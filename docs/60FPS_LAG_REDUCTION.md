# NES slowdown investigation: target 60 logic updates/second

**Scope:** 1989 NES Teenage Mutant Ninja Turtles (USA), MMC1 bank 7.
**Status:** First *tested-for-binary-correctness* cycle-reduction experiment.
**Not yet demonstrated:** sustained 60 fps with many enemies. There has been
**no emulator gameplay timing run** in this development environment. Do not
call the issue fixed based only on a ROM compiling.

## What causes a logic-frame skip in this ROM?

The interrupt vector at `$FFFA` points to NMI handler `$C3A3` in physical PRG
bank 7. Its code does `LDY $1F` at `$C3AF`, then `BEQ $C3CE` at `$C3B1`.

* `$001F == 0`: complete frame-update path at `$C3CE`. It sets busy with
  `INC $1F`, performs OAM DMA/PPU transfer and runs music, sprite construction
  and game-state update, then resets busy at `$C402-$C404`.
* `$001F` positive: the prior update has not finished. The NMI instead takes
  `$C3B5` and skips the `$C3CE` game-update path (a **lag frame**).
* `$001F` negative: early/startup/exception path (not used for gameplay
  frame-rate measurements).

The game logic includes `JSR $C001` at `$C3F6` (OAM builder), and
`JSR $C551` at `$C3F9` (frame/game-state update). Thus, dense enemy scenes
can increase work in one NMI; if a second NMI fires before the first update
finishes, the main update is skipped. NTSC NES has roughly 29,780 CPU
cycles per video frame. A ROM patch **cannot increase that hardware budget**.
A near-60-fps goal requires keeping worst-case updates within the budget and
measuring representative game scenes.

## Optimized hot path — experiment v1

**At `$C114`–`$C119`, physical PRG bank 7:**

Original (per sprite tile):

```asm
ADC $02             ; compute sprite Y
STA $0200,X         ; 5 cycles
DEC $0200,X         ; 7 cycles (read/modify/write)
```

Optimized:

```asm
ADC $02             ; same input and addition
SEC                 ; 2 cycles
SBC #$01            ; 2 cycles
STA $0200,X         ; 5 cycles
```

The resulting byte in `$0200,X` is `(old ADC result - 1) & 255` in **both**
implementations. The original `PHP` at `$C110` and `PLP` at `$C120` preserve
and later restore processor flags needed by downstream code. The temporary
A and flags changes between `ADC` and `PLP` do not affect the next LDA, INY,
STA and PLP instructions. Both sequences occupy **six ROM bytes** and
preserve the external branch/entry address layout. CPU budget saved:
**3 CPU cycles per rendered sprite tile** (12 -> 9 cycles for replaced part).
This is a low-risk, **small gain**, not proof of eliminated slowdown.

**Safeguards:** the patch manifest checks exact original bytes; recompilation
from edited assembly matches manifest output; clean and patched ROMs have the
same size/mapper; automated tests compare the result across all 65,536
combinations of accumulator and sprite Y offset and test IPS round-trip.

## How to build and edit

```powershell
python tools/build.py --expect-vanilla
python tools/recover_dispatch.py "build/Teenage Mutant Ninja Turtles (Rebuilt).nes"
python tools/build_speed_mod.py
python tools/build.py --source-dir mods/lag_reduction_v1/source --output build/TMNT_edited.nes
python -m unittest discover -s tests -v
```

To inspect the *actual assembly being used by the modified ROM* open
`mods/lag_reduction_v1/source/bank07.asm`. Its bank00..06 source files remain
identical to the dispatch-assisted vanilla source. You can edit both gameplay
logic and character graphics then rebuild from that source dir.

Alternative patch-only build, applied to clean source:

```powershell
python tools/build.py --patch-file patches/lag_reduction_v1.json --output build/TMNT_speed_experimental.nes
```

**Do not** combine patched source **and** the same patch manifest — the
manifest is guarded for unmodified bytes and will reject double application.

## Benchmark the actual lag

A compatible NES emulator (including a RetroPixels build once its trace hook
exists) must record the **value of RAM `$001F` immediately at each NMI entry**
(PC `$C3A3`) and count actor slots. Capture an input replay in a scene
containing many enemies, and repeat the same scenario with the edited ROM.

Per-frame trace CSV schema:

```csv
frame,nmi_busy_flag,active_actor_count
200,0,4
201,1,10
202,0,9
```

Here `nmi_busy_flag=1` denotes a skipped logic update. Values 128–255 are
excluded from gameplay estimates. Count actor slots 0–15 with `$0400+slot !=
0` and `$0450+slot & 2 != 0` in this sprite renderer, if available.
The sample above is **format documentation only**, not a real measurement.

Analyze real traces:

```powershell
python tools/profile_frames.py original_frames.csv
python tools/profile_frames.py original_frames.csv --compare modified_frames.csv --json build/lag_comparison.json
```

Instruction-level trace CSV schema for hotspot attribution:

```csv
bank,pc,cycles
7,$C114,5
7,$C117,7
7,$C114,2
```

`cycles` must be measured opcode cycles **including dynamic branch penalties**;
add extra rows with blank `bank,pc` and `cycles` to represent DMA stalls.
Rows above illustrate formats, not captured data. Then:

```powershell
python tools/profile_opcodes.py original_opcode_trace.csv --top 40
```

## Continued recovery / source editing

`tools/recover_dispatch.py` now reads five inline pointer tables following
real `JSR $C702` dispatcher calls. It promotes their 26 distinct fixed-bank
handler roots to tentative 6502 instructions, and **protects the pointer
ranges** from accidental instruction decoding. The output at
`analysis/dispatch_source` is byte-for-byte reconstructible and has 7,745
candidate code bytes in bank 7 versus 2,077 originally identified there.
This is **static source recovery**, not execution-confirmed coverage.
Other banks' source remains unchanged. Inline cross-bank dispatch cannot be
proven without tracing MMC1 PRG mapping at runtime.

## Next technical gates before claiming 60 fps

1. Collect reference lag-frame and CPU hotspots trace from an emulator with
   a crowded enemy scene. Save gameplay inputs and ROM/checksum.
2. Optimize the actual top CPU consumers in enemy update, actor collision,
   projectile handling, and renderer, while preserving actor behavior.
3. Compare identical start states and input sequences for gameplay
   equivalence and number of skipped logic frames. Check all four turtles,
   scrolling, bosses, water level, and weapon sprites for regressions.
4. If worst-case CPU work still exceeds hardware limits, a 60 Hz **display**
   output can be handled by emulator frame pacing or overclock, but this is
   different from a NES ROM sustaining 60 *game logic* updates/second.
