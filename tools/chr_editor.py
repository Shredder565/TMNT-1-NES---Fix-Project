#!/usr/bin/env python3
"""Export/import the NES 2bpp CHR tile banks to indexed PNG contact sheets.

Requires optional Pillow: python -m pip install Pillow
16 columns x 32 rows of 8x8 tiles = 128x256 pixels per 8KiB CHR bank.
IMPORTANT: preserve indexed PNG with indices 0,1,2,3 to avoid wrong colors.
"""
import argparse
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
PALETTE=[(0,0,0),(85,85,85),(170,170,170),(255,255,255)]

def decode(raw):
    if len(raw)!=8192:raise ValueError('Expected 8 KiB bank of 512 2bpp tiles')
    pixels=bytearray(128*256)
    for tile in range(512):
        tile_x=(tile%16)*8
        tile_y=(tile//16)*8
        off=tile*16
        for row in range(8):
            lo,hi=raw[off+row],raw[off+row+8]
            for col in range(8):
                shift=7-col
                pixels[(tile_y+row)*128+tile_x+col]=((lo>>shift)&1)|(((hi>>shift)&1)<<1)
    return bytes(pixels)

def encode(pixels):
    if len(pixels)!=128*256:raise ValueError('Expected 128x256 image')
    if any(x>3 for x in pixels):raise ValueError('Pixels must be palette indices 0..3')
    output=bytearray(8192)
    for tile in range(512):
        tile_x=(tile%16)*8
        tile_y=(tile//16)*8
        off=tile*16
        for row in range(8):
            lo=hi=0
            for col in range(8):
                pixel=pixels[(tile_y+row)*128+tile_x+col]
                shift=7-col
                lo |= (pixel&1)<<shift
                hi |= ((pixel>>1)&1)<<shift
            output[off+row]=lo
            output[off+row+8]=hi
    return bytes(output)

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command',choices=['export','import'])
    parser.add_argument('--bank',type=int,help='CHR bank 0..15; omit to do all')
    args=parser.parse_args()
    try:from PIL import Image
    except ImportError:raise SystemExit('Install Pillow with: python -m pip install Pillow')
    banks=range(16) if args.bank is None else [args.bank]
    if any(not 0<=n<16 for n in banks):raise SystemExit('Bank must be in range 0..15')
    png_dir=ROOT/'assets/chr_png'
    png_dir.mkdir(parents=True,exist_ok=True)
    for i in banks:
        chr_path=ROOT/'assets/chr'/f'chr{i:02d}.chr'
        png_path=png_dir/f'chr{i:02d}.png'
        if args.command=='export':
            image=Image.frombytes('P',(128,256),decode(chr_path.read_bytes()))
            palette=[]
            for j in range(256):palette.extend(PALETTE[j] if j<4 else (0,0,0))
            image.putpalette(palette)
            image.save(png_path)
            print('Exported',png_path)
        else:
            image=Image.open(png_path)
            if image.mode!='P' or image.size!=(128,256):
                raise ValueError(f'{png_path}: indexed PNG (P) of size 128x256 required')
            raw=encode(image.tobytes())
            chr_path.write_bytes(raw)
            print('Updated',chr_path)

if __name__=='__main__':main()
