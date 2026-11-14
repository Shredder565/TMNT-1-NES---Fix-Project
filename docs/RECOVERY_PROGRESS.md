# TMNT (NES, USA) — NES-only reverse engineering and character modification

**2026-11-13.** This workspace deliberately excludes the GBA target.

## What is built and independently tested

- The full 262,160-byte NES image is reproducibly assembled from the banked
  source and 16 native CHR graphics banks. Clean build has the same SHA-256 as
  the user-provided ROM: `dc9acc00f081ffc396ec4c8477904e1a5046c242081ebadabef3503ee0d99628`.
- Stable source: `asm/prg/bank00.asm` ... `bank07.asm`. Identifies **5,741 bytes**
  of reachable executable instructions in the eight PRG banks (~4.4% of PRG).
  Unclassified bytes remain editable `.byte` data, and address tables are
  `.word` values in bank01 (52 entries) and bank02 (100 entries).
- Exploratory source: `analysis/exploratory_source/bank00.asm` ... `bank07.asm`.
  A heuristic target scanner expands **candidate instructions to 24,645 bytes
  (~18.8% of PRG)**. **These additional instructions are UNVERIFIED**: byte-exact
  roundtrip does not prove the bytes are instructions at run time.
- Source line labels include the real reset/NMI/IRQ ROM vectors; `RESET_HANDLER`,
  `NMI_HANDLER`, `IRQ_HANDLER` aliases are provided in fixed bank 7.
- Cross-reference reports (`analysis/xrefs.csv`, `analysis/XREFS.md`) cover
  tentative instruction operand references, including mapper/PPU register sites
  and possible actor arrays at CPU `$0400-$06FF`.
- An indexed, paintable 2bpp **Sprite Studio** GUI edits character tiles,
  supports import/export of 8×8 indexed PNGs and can compile a custom ROM.
- A rectangular 2bpp graphics tool (`tools/character_blocks.py`) imports or
  exports bigger art fragments (2×2, 4×4, and other tile rectangles).
- Change manifests require expected-byte checks, show bank-aware differences,
  and can export IPS patches without distributing complete game ROM images.
- Automated tests cover both source sets, address tables, CHR conversions,
  sprite block edits, patch mismatches, and IPS roundtrips.

## What is NOT yet recovered

This is **not yet a full decompilation**. The original source symbols and
comments cannot be derived uniquely from a machine-code ROM. Most PRG code/data
regions remain unresolved. No gameplay bug has been definitively identified
or fixed, no altered character animations have been play-tested, no level
format has been fully reconstructed, and the tool currently changes character
**pixel art**, not the character roster, game logic, collision boxes, animation
sequence, or runtime palettes.

The largest near-term blocker is **execution traces with the active MMC1 PRG
bank** (including frame-by-frame play of different areas). See
`docs/RETROPIXELS_TRACE.md`. The exploratory guesses should be replaced with
execution-backed entry points before risky gameplay edits.

## Quick start — all commands from project root

```sh
python -m unittest discover -s tests -v
python tools/build.py --expect-vanilla
python tools/build.py --source-dir analysis/exploratory_source --expect-vanilla
```

For the Windows paintable character editor:

```sh
python -m pip install Pillow
python tools/sprite_studio.py
```

Change tiles, click **Save + build modified NES ROM**; output is
`build/TMNT_NES_Custom_Characters.nes`. The editor uses 8×8 4-index sprite
pixels; runtime colors are provided by PPU palette and may differ from the
editor's grayscale preview.

To export **one 4×4-tile part** of an existing character and import replacement
art as indexed 4-color PNG:

```sh
python tools/character_blocks.py export --bank 5 --tile 256 --cols 4 --rows 4 --png part.png
# Edit part.png in a pixel-art editor. It must stay 32x32, indexed pixels 0-3.
python tools/character_blocks.py import --bank 5 --tile 256 --cols 4 --rows 4 --png part.png
python tools/build.py --output build/My_Custom_Turtles.nes
```

**Bank/tile coordinates above are an example, not a confirmed playable turtle
frame!** Use the included `assets/chr_png/chr00.png` ... `chr15.png` image
contact sheets, or `assets/CHR_BANK_OVERVIEW.png`, to visually find the appropriate animation frames. To replace
an entire character, you must update *all* of its visible frames and may need
to change runtime tile/OAM maps.

### Edit likely script/data pointers

```sh
python tools/pointer_tables.py --bank 2
python tools/pointer_tables.py --bank 2 --show 22
```

Bank 2 has a 100-entry little-endian pointer table starting at `$8001`. The
bytes at pointer targets appear to be structured data; the format is **not
identified yet**. Edit `.word` entries only when you have proved how the
engine reads them.

### Reproducible ROM patches (not source relocation)

Create a JSON file like `patches/EXAMPLE_no_op.json` but with verified addresses,
expected original bytes and changes of equal length. Then:

```sh
python tools/build.py --patch-file patches/EXAMPLE_no_op.json --output build/With_Patches.nes
python tools/rom_diff.py build/Teenage\ Mutant\ Ninja\ Turtles\ \(Rebuilt\).nes build/With_Patches.nes --ips build/My_Changes.ips --csv build/My_Changes.csv
```

The included example patch is **intentionally a no-op**, not a pretend bug
fix. Successful code edits require identifying the real defective routine,
choosing a safe change, and confirming gameplay in an emulator.

### Expand recovery with execution evidence

```sh
python tools/recover_code.py build/Teenage\ Mutant\ Ninja\ Turtles\ \(Rebuilt\).nes \
  --trace my_emulator_trace.csv --out analysis/trace_backed_source
python tools/build.py --source-dir analysis/trace_backed_source --expect-vanilla
python tools/xref_report.py --source-dir analysis/trace_backed_source --out analysis/trace_backed_reports
```

The expected `my_emulator_trace.csv` includes the two required fields
`bank,pc`. The `bank` is the **physically mapped PRG bank at that instruction
fetch**; see mapper caveats in `docs/RETROPIXELS_TRACE.md`.

## Quality gates

1. Unedited build must exactly match the user's NES SHA-256.
2. Every tentative decoded bank reassembles byte-for-byte to its original 16KiB.
3. Any modified output must preserve iNES header, mapper and PRG/CHR sizes.
4. Pixel edits must round-trip in 2bpp without corrupting neighboring tiles.
5. Bug fixes must include expected-byte guard and emulator gameplay tests.
6. Do not claim a gameplay fix based solely on a build succeeding.
