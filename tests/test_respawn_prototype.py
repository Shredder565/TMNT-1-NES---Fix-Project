"""Synthetic 6502 execution tests for UNSUPPORTED/UNTESTED-in-game prototype.

This harness only emulates the small injected routines, with a stubbed
$EED3 allocator. Passing tests DO NOT demonstrate real-game compatibility.
"""
import sys
import unittest
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools'))
from build import build
from cpu6502 import DECODE, SIZE

class MiniCPU:
    def __init__(self,rom):
        self.rom=rom
        self.ram=bytearray(0x8000)
        self.a=self.x=self.y=0
        self.sp=0xFD
        self.c=0
        self.z=0
        self.n=0
        self.pc=0
        self.steps=0
        self.allocs=0
    def read(self,addr):
        addr&=0xffff
        if addr <0x8000:return self.ram[addr]
        if addr<0xc000:return self.rom[16+6*0x4000+(addr-0x8000)]
        return self.rom[16+7*0x4000+(addr-0xc000)]
    def write(self,addr,val):
        addr&=0xffff
        if addr <0x8000:self.ram[addr]=val&0xff
        # PRG-ROM+MMC1 registers: treat as emulator hardware, not writable
    def flags(self,val):
        self.z=(val&0xff)==0
        self.n=(val&0x80)!=0
    def push(self,val):
        self.write(0x100+self.sp,val)
        self.sp=(self.sp-1)&0xff
    def pop(self):
        self.sp=(self.sp+1)&0xff
        return self.read(0x100+self.sp)
    def step(self):
        if self.pc==0xEED3:
            self.allocs+=1
            self.x=5
            self.c=0
            lo=self.pop();hi=self.pop()
            self.pc=((hi<<8)|lo)+1
            return
        op=self.read(self.pc)
        if op not in DECODE:
            raise RuntimeError(f'Unsupported opcode {op:02X} at {self.pc:04X}')
        name,mode=DECODE[op]
        sz=SIZE[mode]
        ip=self.pc
        self.pc=(self.pc+sz)&0xffff
        lo=self.read(ip+1) if sz>1 else 0
        hi=self.read(ip+2) if sz>2 else 0
        raw=lo|(hi<<8)
        if mode=='imm':val=lo
        elif mode=='zp': val=self.read(lo)
        elif mode=='abs':val=self.read(raw)
        elif mode=='absx':val=self.read((raw+self.x)&0xffff)
        elif mode=='absy':val=self.read((raw+self.y)&0xffff)
        elif mode in ('rel','imp','acc'):val=0
        else:raise RuntimeError(f'Unsupported addressing mode {mode} at {ip:04X}')
        if name in ('LDA','LDX','LDY'):
            setattr(self,{'LDA':'a','LDX':'x','LDY':'y'}[name],val)
            self.flags(val)
        elif name in ('STA','STX','STY'):
            ofs=(self.x if mode=='absx' else self.y if mode=='absy' else 0)
            address=(raw+ofs) if sz==3 else lo
            self.write(address,getattr(self,{'STA':'a','STX':'x','STY':'y'}[name]))
        elif name=='CMP':
            self.c=int(self.a>=val)
            self.flags((self.a-val)&0xff)
        elif name=='CPY':
            self.c=int(self.y>=val)
            self.flags((self.y-val)&0xff)
        elif name=='SBC':
            # NMOS 6502 binary-mode subtract; used by the actual weapon handler.
            before=self.a
            result=before-val-(1-self.c)
            self.c=int(result>=0)
            self.a=result&255
            self.flags(self.a)
        elif name=='ASL':
            if mode!='acc':raise RuntimeError('MiniCPU ASL supports accumulator only')
            self.c=int(bool(self.a&0x80))
            self.a=(self.a<<1)&255
            self.flags(self.a)
        elif name=='EOR':
            self.a^=val;self.flags(self.a)
        elif name=='TYA':
            self.a=self.y;self.flags(self.a)
        elif name=='TAY':
            self.y=self.a;self.flags(self.y)
        elif name=='PHA':self.push(self.a)
        elif name=='PLA':self.a=self.pop();self.flags(self.a)
        elif name=='INX':self.x=(self.x+1)&0xff;self.flags(self.x)
        elif name=='INY':self.y=(self.y+1)&0xff;self.flags(self.y)
        elif name=='SEC':self.c=1
        elif name=='CLC':self.c=0
        elif name in ('CLD','SEI','NOP'):pass
        elif name=='INC':
            address=raw if mode=='abs' else lo
            value=(val+1)&0xff
            self.write(address,value)
            self.flags(value)
        elif name in ('BEQ','BNE','BCS','BCC','BPL'):
            take={'BEQ':bool(self.z),'BNE':not self.z,'BCS':bool(self.c),
                  'BCC':not self.c,'BPL':not self.n}[name]
            if take:self.pc=(self.pc+(lo if lo<0x80 else lo-0x100))&0xffff
        elif name=='JSR':
            ret=(self.pc-1)&0xffff
            self.push(ret>>8);self.push(ret&0xff)
            self.pc=raw
        elif name=='RTS':
            lo=self.pop();hi=self.pop()
            self.pc=(((hi<<8)|lo)+1)&0xffff
        elif name=='JMP':self.pc=raw
        else:raise RuntimeError(f'Opcode {name}/{mode} not supported at {ip:04X}')
        self.steps+=1
    def run(self,start,stop,limit=100000):
        self.pc=start
        for _ in range(limit):
            if self.pc==stop:return self
            self.step()
        raise RuntimeError(f'Execution did not return: PC={self.pc:04X}')
    def fixture(self,typ=0x4d,hp=40,level=1,room=2,index=9):
        self.write(0x48,level);self.write(0x5D,room)
        self.write(0x42,0x50);self.write(0x43,0x81)
        self.write(0x1A,index)
        self.write(0x5C,1)
        self.write(0x0605,0)
        self.x=5
        self.y=72
        self.write(0x0440+5,typ)
        self.write(0x0560+5,hp)
        self.write(0x0480+5,20)
        return self


class NoRespawnPrototypeUnitTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        p=ROOT/'build/TMNT_Leo_Lag_NoRespawn_UNTESTED_PROTOTYPE.nes'
        cls.rom=p.read_bytes() if p.exists() else build(ROOT,source_dir=ROOT/'mods/leonardo_strong_enemy_respawn_PROTOTYPE/source')

    def cpu(self):
        cpu=MiniCPU(self.rom)
        for ofs in range(256):
            cpu.ram[0x6D00+ofs]=0xA5
            cpu.ram[0x6000+ofs]=0x55
        cpu.run(0xFFD8,0xC310)
        self.assertEqual(cpu.ram[0x6000:0x6100],bytes(256))
        self.assertEqual(cpu.ram[0x6D00:0x6E00],bytes(256))
        return cpu

    def spawn_and_kill(self,cpu,typ=0x4d,hp=40,level=1,room=2,index=9):
        cpu.fixture(typ=typ,hp=hp,level=level,room=room,index=index)
        cpu.run(0x8225,0x8228)
        self.assertEqual(cpu.c,0,'first spawn should be allowed')
        cpu.run(0x8298,0x829D)
        cpu.run(0x99AC,0x99B1)

    def test_strong_enemy_marked_and_blocked_on_return(self):
        c=self.cpu()
        self.spawn_and_kill(c)
        self.assertEqual(c.allocs,1)
        self.assertEqual(c.read(0x6005),0xA5)
        self.assertEqual(c.read(0x0565),0)
        c.run(0x8225,0x8228)
        self.assertEqual(c.c,1,'already-defeated spawn suppressed')
        self.assertEqual(c.allocs,1,'suppressed enemy must not allocate a slot')
        c.write(0x1A,10)
        c.run(0x8225,0x8228)
        self.assertEqual(c.c,0,'different spawn point should still be allowed')
        self.assertEqual(c.allocs,2)

    def test_third_actor_allocator_spawn_path_is_guarded(self):
        # The original bank6 also allocates via $82C9, a third spawn-list
        # route that the v1 prototype missed. This isolated test ensures the
        # new hook at that call site suppresses the exact killed record.
        c=self.cpu()
        self.spawn_and_kill(c)
        self.assertEqual(c.allocs,1)
        c.run(0x82C9,0x82CC)
        self.assertEqual(c.c,1)
        self.assertEqual(c.allocs,1)
        c.write(0x1A,10)
        c.run(0x82C9,0x82CC)
        self.assertEqual(c.c,0)
        self.assertEqual(c.allocs,2)

    def test_stage_and_room_are_part_of_spawn_identity(self):
        c=self.cpu()
        self.spawn_and_kill(c)
        for key,val in [(0x48,2),(0x5D,3),(0x42,0x51),(0x43,0x82)]:
            old=c.read(key)
            c.write(key,val)
            c.run(0x8225,0x8228)
            self.assertEqual(c.c,0,'different identity must not be suppressed')
            c.write(key,old)
        self.assertEqual(c.allocs,5)

    def test_weak_enemies_do_not_create_records(self):
        c=self.cpu()
        self.spawn_and_kill(c,typ=0x0c,hp=7)
        self.assertEqual(c.read(0x6005),0)
        c.run(0x8225,0x8228)
        self.assertEqual(c.c,0)
        self.assertEqual(c.allocs,2)

    def test_bosses_do_not_create_records(self):
        c=self.cpu()
        self.spawn_and_kill(c,typ=0x74,hp=144)
        self.assertEqual(c.read(0x6005),0)
        c.run(0x8225,0x8228)
        self.assertEqual(c.c,0)

    def test_waves_not_persisted(self):
        c=self.cpu()
        c.fixture(hp=40)
        c.write(0x0605,1)
        c.run(0x8225,0x8228)
        c.run(0x8298,0x829D)
        c.run(0x99AC,0x99B1)
        self.assertEqual(c.read(0x6005),0)
        c.run(0x8225,0x8228)
        self.assertEqual(c.c,0)

    def test_unchanged_original_rom_unchanged_outside_guards(self):
        original=build(ROOT)
        self.assertEqual(self.rom[:16],original[:16])
        self.assertEqual(self.rom[0x20010:],original[0x20010:])
        # 6502 reset vector, read from the last PRG bank, points to $FFD8.
        vector=16+7*0x4000+(0xFFFC-0xC000)
        self.assertEqual(self.rom[vector:vector+2],bytes.fromhex('D8 FF'))
        # The original mirrored reset trampoline in bank6 is intentionally untouched.
        mirrored=16+6*0x4000+(0xBFD8-0x8000)
        self.assertEqual(self.rom[mirrored:mirrored+8],original[mirrored:mirrored+8])

if __name__=='__main__':unittest.main()
