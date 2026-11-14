#!/usr/bin/env python3
"""A/B lag-frame acceptance gate for *real* identical-input NES emulator traces.

Does not produce traces. Rejects missing actor counts, incomplete frame series,
and samples too small for meaningful crowded-scene conclusions.
"""
import argparse
import csv
import json
from pathlib import Path
from profile_frames import profile, number, NTSC_HZ


def crowded(path,minimum_actors=8):
    # profile() validates contiguous frame numbers, flag ranges, and totals.
    info=profile(path)
    frame_ids=[]
    flags=[]
    with Path(path).open(newline='',encoding='utf-8-sig') as h:
        for line,row in enumerate(csv.DictReader(h),2):
            actor=row.get('active_actor_count')
            if actor is None or not str(actor).strip():
                raise ValueError(f'{path}:{line}: crowded-scene validation requires active_actor_count')
            if number(actor)>=minimum_actors and not (number(row['nmi_busy_flag']) & 0x80):
                frame_ids.append(number(row['frame']))
                flags.append(number(row['nmi_busy_flag']))
    if not flags:
        raise ValueError(f'{path}: no gameplay frames with {minimum_actors}+ actors')
    lag=sum(x!=0 for x in flags)
    return {'file':str(path),'min_active_actors':minimum_actors,
            'crowded_gameplay_frames':len(flags),'crowded_lag_frames':lag,
            'crowded_lag_fraction':round(lag/len(flags),6),
            'crowded_logic_updates_per_second_estimated':round(NTSC_HZ*(1-lag/len(flags)),3),
            'first_crowded_frame':frame_ids[0],'last_crowded_frame':frame_ids[-1],
            'overall':info}


def gate(baseline,modified,minimum_actors=8,minimum_frames=300,allow_crowded_skips=0):
    before=crowded(baseline,minimum_actors)
    after=crowded(modified,minimum_actors)
    if before['overall']['first_frame']!=after['overall']['first_frame'] or before['overall']['last_frame']!=after['overall']['last_frame']:
        raise ValueError('Original and modified traces must cover the same NMI frame range')
    enough=before['crowded_gameplay_frames']>=minimum_frames and after['crowded_gameplay_frames']>=minimum_frames
    within_budget=after['crowded_lag_frames']<=allow_crowded_skips
    not_worse=after['crowded_lag_fraction']<=before['crowded_lag_fraction']
    return {'original':before,'modified':after,'minimum_crowded_frames_each':minimum_frames,
            'allowed_modified_crowded_lag_frames':allow_crowded_skips,
            'gates':{'enough_crowded_samples':enough,'modified_within_lag_budget':within_budget,
                     'crowded_lag_fraction_not_worse':not_worse},
            'passed':enough and within_budget and not_worse,
            'limitations':'Even a passing real trace only confirms the captured scene. Verify more scenes and gameplay behavior separately.'}


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('original',type=Path)
    p.add_argument('modified',type=Path)
    p.add_argument('--minimum-actors',type=int,default=8)
    p.add_argument('--minimum-frames',type=int,default=300)
    p.add_argument('--allow-skips',type=int,default=0)
    p.add_argument('--json',type=Path)
    args=p.parse_args()
    if not 1<=args.minimum_actors<=16 or args.minimum_frames<=0 or args.allow_skips<0:
        p.error('invalid threshold')
    try:
        info=gate(args.original,args.modified,args.minimum_actors,args.minimum_frames,args.allow_skips)
    except (ValueError,OSError) as e:
        p.error(str(e))
    print(json.dumps(info,indent=2))
    if args.json:
        args.json.parent.mkdir(parents=True,exist_ok=True)
        args.json.write_text(json.dumps(info,indent=2)+'\n')
    if not info['passed']:
        raise SystemExit(1)

if __name__=='__main__':main()
