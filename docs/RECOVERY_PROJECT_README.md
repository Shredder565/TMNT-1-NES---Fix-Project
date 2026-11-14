# TMNT NES — Character Balance + Experimental No-Respawn Update (2026-11-14)

**This ZIP is NES-only. The GBA game is excluded.**

### New playable ROM candidates (all recompilable from 6502 source)

| ROM (inside `build/`) | Contents | Actual verification |
| --- | --- | --- |
| `TMNT_Leonardo_Equals_Donatello.nes` | Leonardo primary-weapon damage now 15/16, matching Donatello | **Exact two-byte code/data patch and rebuild verified; emulator gameplay NOT tested** |
| `TMNT_Leonardo_And_LagReduction_EXPERIMENTAL.nes` | Same Leo buff + older 3-cycle-per-sprite speed experiment | ROM/IPS reproducible; **60 FPS NOT benchmarked** |
| `TMNT_Leo_Lag_NoRespawn_UNTESTED_PROTOTYPE.nes` | Both changes above + experimental defeat persistence for static nonboss enemies with 32+ HP | **Injected 6502 routines pass miniature CPU-unit tests; real NES gameplay NOT verified** |

The previous ROM, source recovery tools, sprites, graphics, original ROM, IPS patches, and tests are retained in this archive. **Do not treat the no-respawn prototype as a completed or stable fix.** The original hitbox/reach geometry has not been changed, only damage strength.

### Windows quick start

Double-click `build_character_and_enemy_experiments.bat` to regenerate the new ROMs and run the tests. To hand-edit the main-wanted damage change, open `mods/leonardo_equal_donatello/source/bank06.asm` and find `LEONARDO_NORMAL_WEAPON_DAMAGE`/`LEONARDO_LOW_HP_WEAPON_DAMAGE`. To edit stronger enemy threshold in the optional prototype, find `RESPAWN_RECORD_ORIGIN:` and change `CMP #$20` (currently 32 HP). Recompile edited source via `python tools/build.py --source-dir ... --output ...`; the generation script overwrites its profile.

### Detailed documentation

- `docs/LEONARDO_DAMAGE_SOURCE.md` — exact damage handler, table, editable symbols and build commands.
- `docs/STRONG_ENEMY_RESPAWN_RESEARCH.md` — exact spawn/death hooks, 6502 PRG-RAM record design, limitations, and tests still needed.
- `build/character_update_report.json` / `build/no_respawn_PROTOTYPE_report.json` — machine-readable verification.
- `analysis/enemy_hp_type_candidates.csv` — candidate hit-point table of enemy IDs for choosing a stronger-enemy threshold.

### Tests

```sh
python tools/build_character_update.py
python tools/build_respawn_prototype.py
python -m unittest discover -s tests -v
```

---

# TMNT 1989 NES — editable source + first slowdown optimization experiment

## NEW: 60 Hz lag reduction work — Nov 13, 2026

**Downloadable all-in-one NES-only project.** The GBA version is excluded.
The included `build/TMNT_NES_Lag_Reduction_v1_EXPERIMENTAL.nes` is the first
actual **modified, compiled ROM**, and
`build/TMNT_NES_Lag_Reduction_v1.ips` can apply its changes to an exact-matching
USA original. The change replaces the per-sprite OAM Y-coordinate write with
an equivalent, 3-CPU-cycle-shorter sequence. All 18 local automated tests pass.

**Important: this is an experimental speedup, not a confirmed complete fix.**
We could not measure actual enemy-heavy frame latency or verify that the
modified game holds 60 updates/second. See `docs/60FPS_LAG_REDUCTION.md` for
the CPU logic frame gate, ROM changes, profiler scripts, and exact validation
needed. No hypothetical speed boost is described as a gameplay benchmark.

### Get started (Windows)

1. Double-click `build_lag_reduction_v1.bat` to reproduce the experimental ROM.
2. Edit `mods/lag_reduction_v1/source/bank07.asm` (and other bank `.asm` files
   for gameplay logic) or edit graphics using `start_sprite_studio.bat`.
3. Double-click `build_my_editable_mod.bat` to compile edited source.
4. Both output ROMs are in `build/`. The clean source is still in `asm/prg/`.

### Get started (Mac/Linux/terminal)

```sh
python tools/build.py --expect-vanilla
python tools/recover_dispatch.py "build/Teenage Mutant Ninja Turtles (Rebuilt).nes"
python tools/build_speed_mod.py
python tools/build.py --source-dir mods/lag_reduction_v1/source --output build/TMNT_Custom.nes
python -m unittest discover -s tests -v
```

### What source has been recovered this pass?

The new `analysis/dispatch_source` identifies five inline `$C702` dispatcher
pointer tables and traces 26 directly referenced fixed-bank handler candidates.
Bank 7 now has **7,745 bytes of statically decoded candidate instructions**,
up from 2,077 in the original conservative pass. All the existing disassembly
and editing tools are retained. Dispatch-derived instructions have not been
verified by a runtime execution log, and full original source recovery remains
unfinished. See `analysis/dispatch_report.json`.

Files of interest:
`mods/lag_reduction_v1/source/` (edited assembly),
`patches/lag_reduction_v1.json` (guarded byte patch),
`tools/build_speed_mod.py` (rebuild and verify),
`tools/profile_frames.py` / `tools/profile_opcodes.py` (real-trace analysis),
`docs/RETROPIXELS_PROFILER_INTEGRATION.md` (future emulator tracing hook).

---

## Prior reverse-engineering baseline documentation

# Teenage Mutant Ninja Turtles (NES, USA) — Editable source / exact ROM rebuild

## NES-only recovery update — 13 November 2026

**Focus: Teenage Mutant Ninja Turtles (1989) NES only. The GBA game is not part
of this project.** The clean ROM still builds byte-for-byte. A second,
**hypothesis-based** 6502 source set in `analysis/exploratory_source/` now
classifies 24,645 PRG bytes (18.8%) as potential code, compared with 5,741
bytes (4.4%) in the conservative source. This is **NOT full source recovery**:
no emulator trace or character gameplay fix has validated these guesses.

For character graphics: `python tools/sprite_studio.py` opens the tile painter
(Tkinter and Pillow needed). `tools/character_blocks.py` imports/exports groups
of tiles. To compile from candidate assembly, use
`python tools/build.py --source-dir analysis/exploratory_source`.

Other additions: `tools/recover_code.py` incremental recovery and emulator
trace CSV import, named vector handlers, 52 + 100 decoded address-table entries,
cross-reference reports, expected-byte guarded patch manifests, IPS export,
and more tests. **Start with [docs/RECOVERY_PROGRESS.md](docs/RECOVERY_PROGRESS.md).**


This project takes the uploaded **1989 NES TMNT** ROM and reconstructs it as
**8 independently editable PRG banks of 6502 assembly and data** plus **16 editable
CHR graphic banks**. Everything assembles back into a working-size `.nes` ROM
without requiring the original ROM to be present in the project.

**Proven milestone:** A clean build matches the supplied NES ROM **byte for
byte** (all 262,160 bytes), not just a checksum or approximate game output.

**Important limitation:** This is an **initial reverse-engineered disassembly**,
not the game's original Konami source code and not a fully documented decompilation.
Reachable machine-code paths are emitted as true editable 6502 mnemonics;
unresolved regions remain editable `.byte` data. Particularly, inferred bank
mapping and code-vs-data classification remain work in progress. You can edit
existing operands and values safely *without changing their instruction sizes*.
Adding larger routines, relocating code, reconstructing high-level C, and
replacing whole levels need further reverse engineering and a linker workflow.

## Get started (Windows / Mac / Linux)

Install **Python 3.9+**. No external assembler or API key is needed.

```bash
python tools/build.py --expect-vanilla
python -m unittest discover -s tests -v
```

On Windows, `py` may replace `python`; in Linux/macOS use `python3`.

To build *after making changes*:

```bash
python tools/build.py
```

Output: `build/Teenage Mutant Ninja Turtles (Rebuilt).nes`.

The `--expect-vanilla` option checks the original SHA-256, and is **expected
to fail after a successful modification**. Ordinary builds do not require the
original hash, but always enforce the right bank and ROM sizes.

## Where do I edit?

| Path | Purpose |
| --- | --- |
| `asm/prg/bank00.asm` | Bank 0 code and data at CPU `$8000-$BFFF` |
| `asm/prg/bank01.asm` – `bank04.asm` | Mostly unclassified game data; edit `.byte` carefully |
| `asm/prg/bank05.asm` | More discovered code and data |
| `asm/prg/bank06.asm` | More discovered code and data |
| `asm/prg/bank07.asm` | Last/fixed bank, reset/NMI/IRQ and core routines, CPU `$C000-$FFFF` |
| `assets/chr/chr00.chr` – `chr15.chr` | 8KiB banks of native NES 2bpp tiles |
| `assets/chr_png/*.png` | Indexed grayscale edit sheets for all 16 graphic banks |
| `tools/chr_editor.py` | Round-trip PNG <-> CHR conversion |
| `tools/disasm6502.py` | Static control-flow disassembler for this MMC1 layout |
| `tools/extract.py` | Re-extract sources from your original ROM (overwrites edits!) |
| `docs/ROM_MAP.md` | Cartridge layout, entry points, address translation |
| `docs/EDITING.md` | Examples, constraints, and next workstreams |

### Example edit: change a 6502 immediate

Find `LDA #$02` or `LDX #$05` and adjust the constant (e.g. `#$02` -> `#$03`),
then run `python tools/build.py`. This edits an actual code operand when its
line occurs in a detected routine. **Do not change a value at random** without
understanding what the routine does; values may control bank switching,
collision, timing, etc.

Assembly includes fixed-size `.byte` directives for every unclassified byte.
Their comments give the original CPU window address. The comment is informative;
editing `.byte` changes game bytes, and editing 6502 mnemonics changes code.

### Edit CHR graphics (pixel art)

The native 2bpp CHR format is already extracted and editable as raw tiles. The
PNGs are provided as readable tile contact sheets. To edit with an image editor,
use **indexed 4-color palette mode (indices 0..3)**. Color shades here are NOT
the final in-game palette: actual colors are set by NES PPU palette RAM.

Install optional Pillow if you want to export/import PNGs:

```bash
python -m pip install Pillow
python tools/chr_editor.py export
# modify assets/chr_png/chr00.png in indexed-color mode
python tools/chr_editor.py import --bank 0
python tools/build.py
```

The ZIP includes pre-exported PNG sheets. After changing PNGs, you **must run
`import`** to update their `.chr` banks before building.

## What this project does NOT yet provide

* Named game variables for every actor, physics system, timer, enemy, level,
  or cutscene; symbolic names are mostly address labels (`B07_C3A3`, etc.).
* Full code/data coverage from an emulator execution trace. Static discovery
  currently recognizes ~5,741 code bytes out of 131,072 PRG bytes (~4.4%);
  data/tables and dynamically accessed game code remain `.byte`.
* Automatic safe insertion of longer routines. The assembler deliberately
  checks all 16KiB banks for overlaps/holes.
* Emulator validation of gameplay. We verified binary identity to the uploaded
  original, and tested source edit/assemble/CHR round trips; no gameplay test
  was performed here.

## Provenance / reproducibility

Original supplied file: `Teenage Mutant Ninja Turtles (USA).nes`

SHA-256:
`dc9acc00f081ffc396ec4c8477904e1a5046c242081ebadabef3503ee0d99628`

NES iNES 1.0 header: `4E 45 53 1A 08 10 10 00 00 00 00 00 00 00 00 00`.

Unmodified build: 8 × 16KiB PRG + 16 × 8KiB CHR + 16-byte header = 262,160 bytes.

To repeat extraction using your own original ROM (OVERWRITES assembly changes):

```bash
python tools/extract.py "Teenage Mutant Ninja Turtles (USA).nes"
python tools/build.py --expect-vanilla
```

The code is intended for personal reverse engineering and learning. It is not
an official source code release.
