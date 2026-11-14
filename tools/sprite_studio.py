#!/usr/bin/env python3
"""Turtle Sprite Studio: edit the native NES 2bpp art with a visual tile editor.

Requirements: Python 3.9+, Tkinter (usually shipped with Python), Pillow.
Run: python tools/sprite_studio.py
Changes are stored in assets/chr/chrXX.chr and built into a mapper-1 NES ROM.
This edits graphics, not character game rules / OAM tile sequences / palettes.
"""
import subprocess
import sys
import tkinter as tk
from pathlib import Path
from tkinter import filedialog, messagebox, ttk

try:
    from PIL import Image, ImageTk
except ImportError:
    raise SystemExit('Install Pillow: python -m pip install Pillow')

from chr_editor import ROOT, PALETTE, decode, encode

SHEET_SCALE=3
PIX_SCALE=30
COLORS=['#151515','#5b5b5b','#a6a6a6','#f5f5f5']


class SpriteStudio:
    def __init__(self, window):
        self.root=window
        window.title('TMNT NES · Turtle Sprite Studio')
        window.geometry('930x900')
        self.bank=0
        self.tile=0
        self.pixels=bytearray()
        self.undo_stack=[]
        self.tile_clipboard=None
        self.dirty=False
        self.brush=tk.IntVar(value=3)
        self.bank_input=tk.IntVar(value=0)
        self.tile_input=tk.StringVar(value='0')
        self.status=tk.StringVar()
        self.show_tiles=tk.BooleanVar(value=True)
        self.make_ui()
        self.load_bank(0)
        window.protocol('WM_DELETE_WINDOW',self.close)

    def make_ui(self):
        top=ttk.Frame(self.root,padding=8)
        top.pack(fill='x')
        ttk.Label(top,text='CHR bank (0–15)').pack(side='left')
        selector=ttk.Spinbox(top,from_=0,to=15,width=4,textvariable=self.bank_input,command=self.change_bank)
        selector.pack(side='left',padx=(6,12))
        selector.bind('<Return>',lambda e:self.change_bank())
        ttk.Label(top,text='Tile (0–511)').pack(side='left')
        tilebox=ttk.Entry(top,textvariable=self.tile_input,width=7)
        tilebox.pack(side='left',padx=4)
        tilebox.bind('<Return>',lambda e:self.jump_to_tile())
        ttk.Button(top,text='Go',command=self.jump_to_tile).pack(side='left')
        ttk.Button(top,text='Prev',command=lambda:self.select_tile((self.tile-1)%512)).pack(side='left',padx=6)
        ttk.Button(top,text='Next',command=lambda:self.select_tile((self.tile+1)%512)).pack(side='left')

        body=ttk.Frame(self.root,padding=8)
        body.pack(fill='both',expand=True)
        left=ttk.LabelFrame(body,text='8 KiB CHR bank — click any 8×8 tile',padding=5)
        left.pack(side='left',fill='y',padx=(0,12))
        self.sheet_canvas=tk.Canvas(left,width=128*SHEET_SCALE+2,height=670,bg='#333333')
        scrollbar=ttk.Scrollbar(left,orient='vertical',command=self.sheet_canvas.yview)
        self.sheet_canvas.configure(yscrollcommand=scrollbar.set,scrollregion=(0,0,128*SHEET_SCALE,256*SHEET_SCALE))
        self.sheet_canvas.pack(side='left')
        scrollbar.pack(side='right',fill='y')
        self.sheet_canvas.bind('<Button-1>',self.sheet_click)
        self.sheet_canvas.bind('<MouseWheel>',lambda e:self.sheet_canvas.yview_scroll(-int(e.delta/120),'units'))
        self.sheet_canvas.bind('<Button-4>',lambda e:self.sheet_canvas.yview_scroll(-3,'units'))
        self.sheet_canvas.bind('<Button-5>',lambda e:self.sheet_canvas.yview_scroll(3,'units'))

        right=ttk.Frame(body)
        right.pack(side='left',fill='both',expand=True)
        box=ttk.LabelFrame(right,text='Selected tile — left click to paint, right click to pick',padding=10)
        box.pack(fill='x')
        self.tile_canvas=tk.Canvas(box,width=8*PIX_SCALE+1,height=8*PIX_SCALE+1,bg='white')
        self.tile_canvas.pack()
        self.tile_canvas.bind('<Button-1>',self.paint)
        self.tile_canvas.bind('<B1-Motion>',self.paint)
        self.tile_canvas.bind('<Button-3>',self.pick_color)
        self.tile_canvas.bind('<Button-2>',self.pick_color)
        ttk.Label(right,text='2-bit NES color index (in-game colors come from palette RAM)').pack(pady=(14,5))
        palette=ttk.Frame(right)
        palette.pack()
        for index,color in enumerate(COLORS):
            b=tk.Radiobutton(palette,text=str(index),value=index,variable=self.brush,
                              indicatoron=False,bg=color,fg='red' if index==0 else 'black',
                              selectcolor=color,activebackground=color,width=5,bd=2,relief='raised')
            b.pack(side='left',padx=3)
        ttk.Button(right,text='Undo pixel change',command=self.undo).pack(fill='x',pady=(18,4))
        ttk.Button(right,text='Copy selected 8×8 tile',command=self.copy_tile).pack(fill='x',pady=4)
        ttk.Button(right,text='Paste tile over selection',command=self.paste_tile).pack(fill='x',pady=4)
        ttk.Button(right,text='Import 8×8 indexed PNG',command=self.import_tile).pack(fill='x',pady=4)
        ttk.Button(right,text='Export selected tile PNG',command=self.export_tile).pack(fill='x',pady=4)
        ttk.Separator(right).pack(fill='x',pady=10)
        ttk.Button(right,text='Save CHR graphics',command=self.save_bank).pack(fill='x',pady=4)
        ttk.Button(right,text='Save + build modified NES ROM',command=self.save_and_build).pack(fill='x',pady=4)
        ttk.Label(right,text='A playable character uses multiple sprite tiles.\nEdit all relevant tiles to replace its art.\nThis tool does not yet rename animation/OAM\ntables or change character physics. ',justify='center').pack(pady=18)

        foot=ttk.Frame(self.root,padding=(8,4))
        foot.pack(side='bottom',fill='x')
        ttk.Label(foot,textvariable=self.status,wraplength=875).pack(side='left')

    def bank_path(self,bank=None):
        return ROOT/'assets'/'chr'/f'chr{(self.bank if bank is None else bank):02d}.chr'

    def load_bank(self,bank):
        self.bank=bank
        self.bank_input.set(bank)
        raw=self.bank_path().read_bytes()
        self.pixels=bytearray(decode(raw))
        self.undo_stack=[]
        self.dirty=False
        self.select_tile(min(self.tile,511))

    def confirm_dirty(self):
        if not self.dirty:return True
        answer=messagebox.askyesnocancel('Unsaved changes','Save your current CHR bank edits?')
        if answer is None:return False
        if answer:self.save_bank()
        return True

    def change_bank(self):
        try:
            value=self.bank_input.get()
            if not 0<=value<16:raise ValueError()
        except Exception:
            messagebox.showerror('Bad bank','Bank must be 0 through 15.')
            self.bank_input.set(self.bank)
            return
        if value==self.bank:return
        if not self.confirm_dirty():
            self.bank_input.set(self.bank)
            return
        self.load_bank(value)

    def jump_to_tile(self):
        try:
            n=int(self.tile_input.get(),0)
            if not 0<=n<512:raise ValueError()
        except Exception:
            messagebox.showerror('Bad tile','Tile index must be in range 0 to 511.')
            return
        self.select_tile(n)
        self.sheet_canvas.yview_moveto((n//16)/32)

    def sheet_click(self,event):
        x=int(self.sheet_canvas.canvasx(event.x))
        y=int(self.sheet_canvas.canvasy(event.y))
        if 0<=x<128*SHEET_SCALE and 0<=y<256*SHEET_SCALE:
            self.select_tile((y//(8*SHEET_SCALE))*16+x//(8*SHEET_SCALE))

    def select_tile(self,tile):
        self.tile=tile
        self.tile_input.set(str(tile))
        self.refresh()

    def tile_offset(self):
        return (self.tile//16)*8*128+(self.tile%16)*8

    def get_tile(self):
        start=self.tile_offset()
        return bytes(value for y in range(8) for value in self.pixels[start+128*y:start+128*y+8])

    def put_tile(self,pixels):
        if len(pixels)!=64 or any(c>3 for c in pixels):raise ValueError('Need 64 pixel indices 0..3')
        self.snapshot()
        start=self.tile_offset()
        for y in range(8):self.pixels[start+128*y:start+128*y+8]=pixels[y*8:y*8+8]
        self.refresh()

    def snapshot(self):
        self.undo_stack.append(bytes(self.pixels))
        if len(self.undo_stack)>100:self.undo_stack.pop(0)
        self.dirty=True

    def undo(self):
        if self.undo_stack:
            self.pixels=bytearray(self.undo_stack.pop())
            self.dirty=True
            self.refresh()

    def paint(self,event):
        x,y=event.x//PIX_SCALE,event.y//PIX_SCALE
        if not (0<=x<8 and 0<=y<8):return
        address=self.tile_offset()+y*128+x
        brush=self.brush.get()
        if self.pixels[address]!=brush:
            self.snapshot()
            self.pixels[address]=brush
            self.refresh()

    def pick_color(self,event):
        x,y=event.x//PIX_SCALE,event.y//PIX_SCALE
        if 0<=x<8 and 0<=y<8:
            self.brush.set(self.pixels[self.tile_offset()+y*128+x])

    def copy_tile(self):
        self.tile_clipboard=self.get_tile()
        self.status.set(f'Copied bank {self.bank} tile {self.tile}; select another tile/bank and paste.')

    def paste_tile(self):
        if self.tile_clipboard is None:
            messagebox.showinfo('Clipboard empty','Copy an existing tile first.')
            return
        self.put_tile(self.tile_clipboard)

    def import_tile(self):
        file=filedialog.askopenfilename(title='Choose 8×8 indexed PNG',filetypes=[('PNG image','*.png')])
        if not file:return
        try:
            with Image.open(file) as pic:
                if pic.size!=(8,8) or pic.mode!='P':
                    raise ValueError('Image must be 8×8 pixels, indexed PNG mode P')
                pixels=pic.tobytes()
            self.put_tile(pixels)
        except Exception as exc:messagebox.showerror('Import failed',str(exc))

    def export_tile(self):
        file=filedialog.asksaveasfilename(title='Export tile',defaultextension='.png',
                                          initialfile=f'bank{self.bank:02d}_tile{self.tile:03d}.png',
                                          filetypes=[('PNG image','*.png')])
        if not file:return
        pic=Image.frombytes('P',(8,8),self.get_tile())
        pal=[]
        for i in range(256):pal.extend(PALETTE[i] if i<4 else (0,0,0))
        pic.putpalette(pal)
        pic.save(file)
        self.status.set(f'Exported {file}')

    def refresh(self):
        # The bank sheet image is a contact-sheet view (not on-screen colors).
        im=Image.frombytes('L',(128,256),bytes(p*85 for p in self.pixels))
        im=im.resize((128*SHEET_SCALE,256*SHEET_SCALE),Image.Resampling.NEAREST)
        self.sheet_image=ImageTk.PhotoImage(im)
        self.sheet_canvas.delete('all')
        self.sheet_canvas.create_image(0,0,anchor='nw',image=self.sheet_image)
        tx=(self.tile%16)*8*SHEET_SCALE
        ty=(self.tile//16)*8*SHEET_SCALE
        self.sheet_canvas.create_rectangle(tx,ty,tx+8*SHEET_SCALE,ty+8*SHEET_SCALE,
                                           outline='#ff3300',width=3)
        self.tile_canvas.delete('all')
        t=self.get_tile()
        for y in range(8):
            for x in range(8):
                self.tile_canvas.create_rectangle(x*PIX_SCALE,y*PIX_SCALE,
                    (x+1)*PIX_SCALE,(y+1)*PIX_SCALE,
                    fill=COLORS[t[y*8+x]],outline='#777777',width=1)
        rom_off=0x20010+self.bank*8192+self.tile*16
        self.status.set(f'Bank {self.bank:02d}, tile {self.tile:03d} (0x{self.tile:03X}), '
                        f'ROM file offset 0x{rom_off:05X}    '
                        f'{"● UNSAVED CHANGES" if self.dirty else "Saved"}')

    def save_bank(self):
        raw=encode(self.pixels)
        path=self.bank_path()
        path.write_bytes(raw)
        self.dirty=False
        self.undo_stack=[]
        self.refresh()
        return True

    def save_and_build(self):
        try:
            self.save_bank()
            out=ROOT/'build'/'TMNT_NES_Custom_Characters.nes'
            proc=subprocess.run([sys.executable,str(ROOT/'tools'/'build.py'),
                                 '--output',str(out)],capture_output=True,text=True,timeout=60)
            if proc.returncode:
                raise ValueError(proc.stdout+'\n'+proc.stderr)
            messagebox.showinfo('Custom ROM compiled',f'Built modified ROM:\n{out}\n\n{proc.stdout}')
        except Exception as exc:
            messagebox.showerror('Compilation failed',str(exc))

    def close(self):
        if self.confirm_dirty():self.root.destroy()


if __name__=='__main__':
    root=tk.Tk()
    SpriteStudio(root)
    root.mainloop()
