#!/usr/bin/env python3
"""Expected-byte guarded, repeatable NES ROM modification manifests.

Example (save as my_mod.json):
{
  "name": "Example mod - not a verified gameplay fix",
  "patches": [
    {"region": "prg", "bank": 5, "cpu_address": "$8001",
     "expect": "A5 27", "replace": "A5 27", "note": "No-op syntax example"}
  ]
}

PRG uses 16 KiB physical bank indices 0..7 and $8000 or $C000 CPU
addresses. CHR uses 8 KiB bank indices 0..15 and optional tile indices.
Overlapping patches are rejected even if they would happen to agree.
"""
import json
import re
from pathlib import Path

ROM_LEN=16+8*0x4000+16*0x2000
CHR_START=16+8*0x4000


def parse_int(text):
    if isinstance(text,int):return text
    text=str(text).strip()
    if text.startswith('$'):return int(text[1:],16)
    return int(text,0)


def parse_bytes(value):
    if isinstance(value,list):
        if not all(isinstance(a,int) and 0<=a<=255 for a in value):
            raise ValueError('byte list must contain integers from 0..255')
        return bytes(value)
    if not isinstance(value,str):raise ValueError('expected hex bytes or integer byte list')
    s=re.sub(r'[\s,:_-]+','',re.sub(r'(?i)0x|\$','',value))
    if not re.fullmatch(r'[0-9A-Fa-f]*',s) or len(s)%2:
        raise ValueError(f'invalid even-length hex byte string: {value}')
    return bytes.fromhex(s)


def index_for_patch(patch):
    region=patch.get('region')
    bank=parse_int(patch['bank'])
    if region=='prg':
        if not 0<=bank<8:raise ValueError('PRG bank must be 0..7')
        if 'cpu_address' in patch:
            addr=parse_int(patch['cpu_address'])
            base=0xC000 if bank==7 else 0x8000
            offset=addr-base
        else:
            offset=parse_int(patch['offset'])
        if not 0<=offset<0x4000:raise ValueError('PRG offset outside 16KB bank')
        return 16+bank*0x4000+offset
    if region=='chr':
        if not 0<=bank<16:raise ValueError('CHR bank must be 0..15')
        if 'tile' in patch:
            tile=parse_int(patch['tile'])
            if not 0<=tile<512:raise ValueError('Tile must be 0..511')
            offset=16*tile+parse_int(patch.get('tile_byte',0))
        else:offset=parse_int(patch['offset'])
        if not 0<=offset<0x2000:raise ValueError('CHR offset outside 8KB bank')
        return CHR_START+bank*0x2000+offset
    raise ValueError('region must be prg or chr')


def apply_patches(blob, manifests):
    if len(blob)!=ROM_LEN or blob[:4]!=b'NES\x1a':
        raise ValueError('Expected TMNT NES ROM 262160 bytes')
    result=bytearray(blob)
    touched=set()
    log=[]
    for manifest in manifests:
        manifest=Path(manifest)
        document=json.loads(manifest.read_text(encoding='utf8'))
        if not isinstance(document.get('patches'),list):
            raise ValueError(f'{manifest}: requires patches array')
        for index,patch in enumerate(document['patches'],1):
            try:
                start=index_for_patch(patch)
                old=parse_bytes(patch['expect'])
                new=parse_bytes(patch['replace'])
                if not old or len(old)!=len(new):
                    raise ValueError('expected and replacement must be same nonzero length')
                end=start+len(old)
                if end>len(result):raise ValueError('patch exceeds ROM length')
                if patch['region']=='prg' and (start-16)//0x4000 != (end-1-16)//0x4000:
                    raise ValueError('PRG patch may not cross banks')
                if patch['region']=='chr' and (start-CHR_START)//0x2000 != (end-1-CHR_START)//0x2000:
                    raise ValueError('CHR patch may not cross banks')
                locations=set(range(start,end))
                if touched & locations:raise ValueError('overlapping patches')
                if result[start:end]!=old:
                    raise ValueError(f'expected bytes {old.hex(" ")} but found {result[start:end].hex(" ")}')
                touched.update(locations)
                result[start:end]=new
                log.append((str(manifest),index,start,old,new,patch.get('note','')))
            except Exception as error:
                raise ValueError(f'{manifest} patch #{index}: {error}') from error
    return bytes(result),log
