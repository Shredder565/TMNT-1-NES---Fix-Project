# RetroPixels trace integration contract — TMNT NES 60 Hz lag analysis

This is an **integration plan**, not code merged into RetroPixels. RetroPixels
source was not part of this NES package, and no runtime traces have been
captured in this release. A developer can implement the following in the
emulator's NES CPU/NMI boundary hooks.

## A. Per-hardware-frame measurements: `nmi_frames.csv`

Required CSV: `frame,nmi_busy_flag`. Recommended optional column:
`active_actor_count`. Log one row on **NMI entry `$C3A3`** for this ROM,
*before executing the NMI's PHA instruction*.

Pseudocode (not tied to a particular emulator language):

```text
when nes.cpu.willEnterNmi():
    # Only for SHA256 dc9acc... (vanilla) or 43ff01... (patch v1).
    f = nes.ppu.frameNumber
    gate = nes.cpuPeekRam(0x001F)  # read BEFORE handler changes the flag
    count = 0
    for index in 0..15:
        if (nes.cpuPeekRam(0x0400 + index) != 0 &&
            (nes.cpuPeekRam(0x0450 + index) & 0x02) != 0):
            count++
    csv.write(f + ',' + gate + ',' + count)
```

Flag semantics in the disassembled NMI at `$C3AF`:

- `0` enters `$C3CE` and runs full frame logic.
- `1..127` skips main logic through `$C3B5` (lag frame).
- `128..255` exits through `$C40D` (non-gameplay / startup / special).

Run replayed gameplay covering **many enemies** with vanilla and the modified
ROM separately. Then:

```text
python tools/profile_frames.py nmi_vanilla.csv --compare nmi_fast.csv
```

The report computes *fraction of hardware frames that actually ran full
logic*, effective logic-update frequency, and lag probability by actor count.
Beware that game RNG can change across timing changes; a frame-index match
is not guaranteed even with identical controller input replay.

## B. CPU hotspot trace: `opcode_samples.csv`

Required CSV: `bank,pc,cycles`. Each CPU opcode event must log the physical
MMC1 16 KiB PRG bank, PC at opcode fetch, and **actual elapsed CPU cycles**.

- `$8000-$BFFF` = physical switchable bank 0..6, determined by the mapper.
- `$C000-$FFFF` = physical fixed bank 7 in this game's usual PRG mode.
- RAM execution may use bank `-1`.
- Record DMA or APU stall cycles with blank bank and blank PC so total cycle
  attribution includes these events.

Because one playthrough can generate millions of events, a streaming CSV
writer or aggregated per-PC counter dump is recommended. For a 10-second
captured run, >100 MB is possible. Profile only representative sections.

Then run `python tools/profile_opcodes.py opcode_samples.csv --top 40`.

## C. Validity of the 60 FPS claim

NTSC PPU video runs approximately 60.0988 Hz; the CPU gets about 29,780.5
cycles for each video frame. A title can present 60 video frames per second
but update gameplay fewer times when engine work overruns. Our target is
**near-zero skipped main-logic frames at maximum representative enemy load**,
not a framerate overlay reading "60".

Do **not** assert 60 fps from: (1) ROM recompiling, (2) static source coverage,
(3) test for arithmetic equivalence, or (4) emulator display-refresh metrics.
A valid report contains actual replay and profiling measurements for both
vanilla and modified ROMs, and confirms that no enemy behavior was removed.
