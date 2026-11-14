#!/usr/bin/env python3
"""Import/export multiple adjacent NES sprite tiles as one character-art PNG.

The rectangle uses the CHR sheet's 16-tile-per-row layout. This is not the
runtime OAM layout: a character's animation frames may be spread across banks.

Export a 4x4 group: python tools/character_blocks.py export --bank 0 --tile 32 --cols 4 --rows 4 --png character.png
Import it:         python tools/character_blocks.py import --bank 0 --tile 32 --cols 4 --rows 4 --png character.png
Rebuild ROM:       python tools/build.py
"""
import argparse
from pathlib import Path

from chr_editor import ROOT, PALETTE, decode, encode


def validate(bank,tile,cols,rows):
    if not 0<=bank<16:raise ValueError('Bank must be 0..15')
    if not 0<=tile<512:raise ValueError('Tile must be 0..511')
    if not 1<=cols<=16 or not 1<=rows<=32:raise ValueError('Invalid dimensions')
    if tile%16+cols>16 or tile//16+rows>32:
        raise ValueError('Block crosses atlas edge: choose a smaller region / different tile')


def from_sheet(bank_pixels,tile,cols,rows):
    """Get a rectangular block from native 128x256 CHR pixel-index sheet."""
    w,h=cols*8,rows*8
    left=(tile%16)*8
    top=(tile//16)*8
    return bytes(x for y in range(top,top+h) for x in bank_pixels[y*128+left:y*128+left+w])


def into_sheet(bank_pixels,tile,cols,rows,block_pixels):
    """Replace one rectangular group; other tiles remain byte identical."""
    w,h=cols*8,rows*8
    if len(block_pixels)!=w*h or any(x>3 for x in block_pixels):
        raise ValueError('Expect 4-color indexed image with correct dimensions')
    result=bytearray(bank_pixels)
    left=(tile%16)*8
    top=(tile//16)*8
    for y in range(h):
        dst=(top+y)*128+left
        result[dst:dst+w]=block_pixels[y*w:(y+1)*w]
    return bytes(result)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action',choices=['export','import'])
    parser.add_argument('--bank',type=int,required=True)
    parser.add_argument('--tile',type=int,required=True,help='first tile ID in 16-column CHR sheet')
    parser.add_argument('--cols',type=int,required=True)
    parser.add_argument('--rows',type=int,required=True)
    parser.add_argument('--png',type=Path,required=True)
    args=parser.parse_args()
    validate(args.bank,args.tile,args.cols,args.rows)
    try:from PIL import Image
    except ImportError:raise SystemExit('Install Pillow: python -m pip install Pillow')
    bankpath=ROOT/'assets'/'chr'/f'chr{args.bank:02d}.chr'
    original=bankpath.read_bytes()
    sheet=decode(original)
    if args.action=='export':
        raw=from_sheet(sheet,args.tile,args.cols,args.rows)
        im=Image.frombytes('P',(args.cols*8,args.rows*8),raw)
        pal=[]
        for i in range(256):pal.extend(PALETTE[i] if i<4 else (0,0,0))
        im.putpalette(pal)
        args.png.parent.mkdir(parents=True,exist_ok=True)
        im.save(args.png)
        print(f'Exported bank={args.bank} tile={args.tile} block to {args.png}')
    else:
        with Image.open(args.png) as im:
            if im.mode!='P' or im.size!=(args.cols*8,args.rows*8):
                raise ValueError('Image must be indexed PNG, exact size cols×8 by rows×8')
            block=im.tobytes()
        edited=encode(into_sheet(sheet,args.tile,args.cols,args.rows,block))
        bankpath.write_bytes(edited)
        count=sum(a!=b for a,b in zip(original,edited))
        print(f'Updated CHR bank {args.bank} ({count} changed bytes). Build the ROM to use art.')


if __name__=='__main__':main()
