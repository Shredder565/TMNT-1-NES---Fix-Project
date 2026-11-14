#!/usr/bin/env python3
"""Analyze TMNT (1989 NES) per-NMI status traces, with optional A/B comparison.

CSV specification (one row per *hardware PPU frame / NMI entry*):
  frame,nmi_busy_flag,active_actor_count
  200,0,4
  201,1,10
  202,0,9
  203,255,0

Observe RAM $001F at *entry* to NMI $C3A3, before its code modifies the
flag. 0 means normal logic is permitted; positive values mean the prior
logic update has not finished and this NMI skips game-update routines;
negative $80-$FF denotes startup/special and is not counted as gameplay.
'active_actor_count' is the observed count of nonzero $0400-$040F slots whose
$0450-$045F flags contain bit 1 (in the OAM builder). Optional but useful.

This tool does not generate an emulator trace itself. No claims about 60 fps
should be made without an actual original-vs-modified gameplay trace.
"""
import argparse
import csv
import json
from collections import defaultdict
from pathlib import Path

NTSC_HZ=60.0988


def number(raw):
    txt=str(raw).strip()
    if txt.startswith('$'):return int(txt[1:],16)
    return int(txt,0)


def profile(path):
    per_actor=defaultdict(lambda:[0,0])
    good=skipped=excluded=0
    first=last=None
    streak=peak=0
    previous_frame=None
    seen_count=0
    with Path(path).open(newline='',encoding='utf-8-sig') as handle:
        rd=csv.DictReader(handle)
        required={'frame','nmi_busy_flag'}
        if not required.issubset(rd.fieldnames or []):
            raise ValueError(f'{path}: missing required columns {sorted(required)}')
        for line,row in enumerate(rd,2):
            try:
                frame=number(row['frame'])
                flag=number(row['nmi_busy_flag'])
                actor_text=row.get('active_actor_count','')
                actor=number(actor_text) if actor_text is not None and str(actor_text).strip() else None
                if frame<0 or not 0<=flag<=255 or (actor is not None and not 0<=actor<=16):
                    raise ValueError('out-of-range frame, busy flag or actor count')
                if previous_frame is not None and frame<=previous_frame:
                    raise ValueError('frames must increase strictly; only one NMI row per frame')
                if previous_frame is not None and frame>previous_frame+1:
                    raise ValueError('missing NMI frames; trace must be complete for rate estimation')
            except (TypeError,ValueError) as e:
                raise ValueError(f'{path}:{line}: {e}') from e
            previous_frame=frame
            seen_count+=1
            if first is None:first=frame
            last=frame
            if flag & 0x80:
                excluded+=1
                streak=0
                continue
            if flag==0:
                good+=1
                streak=0
                if actor is not None:per_actor[actor][0]+=1
            else:
                skipped+=1
                streak+=1
                peak=max(peak,streak)
                if actor is not None:per_actor[actor][1]+=1
    denominator=good+skipped
    if denominator<=0:raise ValueError(f'{path}: trace has no gameplay frames ($001F < $80)')
    return {
        'file':str(path), 'ppu_frames_captured':seen_count,
        'first_frame':first,'last_frame':last,
        'gameplay_frames':denominator, 'full_logic_frames':good,
        'lag_frames_logic_skipped':skipped,'non_gameplay_frames_excluded':excluded,
        'lag_frame_fraction':round(skipped/denominator,6),
        'max_consecutive_lag_frames':peak,
        'estimated_logic_updates_per_second':round(NTSC_HZ*good/denominator,3),
        'ppu_hz_target_ntsc':NTSC_HZ,
        'actor_count_buckets':[
            {'active_actors':n,'full_logic':counts[0],'lag_frames':counts[1],
             'lag_fraction':round(counts[1]/sum(counts),6)}
            for n,counts in sorted(per_actor.items())
        ],
    }


def compare(baseline, modified):
    a=profile(baseline)
    b=profile(modified)
    return {'baseline':a,'modified':b,
            'lag_fraction_improvement':round(a['lag_frame_fraction']-b['lag_frame_fraction'],6),
            'effective_logic_rate_gain_hz':round(b['estimated_logic_updates_per_second']-a['estimated_logic_updates_per_second'],3),
            'method_note':'For valid A/B run both ROMs with identical emulator, input movie, start state, and comparable enemy-count scenarios. Changed RNG/behavior can invalidate a naive frame-index comparison.'}


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('baseline',type=Path)
    p.add_argument('--compare',type=Path,help='Captured trace for modified ROM')
    p.add_argument('--json',type=Path,help='Save machine-readable report')
    args=p.parse_args()
    info=compare(args.baseline,args.compare) if args.compare else profile(args.baseline)
    pretty=json.dumps(info,indent=2)
    if args.json:
        args.json.parent.mkdir(parents=True,exist_ok=True)
        args.json.write_text(pretty+'\n')
    print(pretty)

if __name__=='__main__':main()
