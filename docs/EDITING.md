# Editing guide and restrictions

## Source edits

In an assembler bank, instructions like:

```asm
B07_C001:
    LDA #$02
    JSR B07_CEA7
    LDA #$40
    STA $08
```

are actual 6502 assembly. `LDA #$02` assembles to `A9 02`, so changing
`#$02` to `#$03` makes a one-byte edit at that instruction operand. This is a
valid example of the *mechanics* of editing, not a recommended gameplay patch.

- Write hex constants as `#$02`, `$10`, `$8000` or labels such as `B07_CEA7`.
- Source comments after `;` give original instruction addresses and bytes;
  comment bytes are not used by the assembler.
- Relative branches use symbols; assembler computes signed branch distance.
- `.word` emits little-endian 16-bit integers, `.byte` emits raw bytes.
- Keep total length and code location fixed for now. The assembler enforces
  no overlaps, no unwritten bytes, and a 16KiB bank limit.
- Use `python tools/build.py` to compile after any edit. No API key required.

For new code blocks larger than original, first identify unused space and
implement relocation; otherwise a source length change can shift entries and
invalidate pointer tables. The provided assembler intentionally does not
silently repoint pointers or change bank sizes.

## Two kinds of assets

`assets/chr/chrXX.chr`: authoritative native 2bpp graphics data used in builds.
`assets/chr_png/chrXX.png`: optional editable pixel sheets; changes to PNGs
must be imported using `python tools/chr_editor.py import --bank N`.

CHR bank sheets are 128×256 pixels: 16 tiles per row, 32 rows; each tile is
8×8 pixels and 16 bytes in the ROM. The pixel indices are 0, 1, 2, 3; these
are NOT original palette colors, because NES assigns colors at runtime.

## Test procedure

```bash
python -m unittest discover -s tests -v
python tools/build.py --expect-vanilla    # unmodified only
python tools/build.py                     # after edit
```

Run the new `.nes` in a mapper-1-compatible NES emulator. Verify boot, control,
full level transitions, boss scenes, audio and save behavior before shipping a
patch. A sha-identical rebuild validates binary fidelity, not emulator
compatibility or the correctness of *modified* gameplay.

## Common mistakes

- Inserting a single byte into a bank without relocating code breaks address
  assumptions and should be rejected at build time.
- A hex argument `$10` is encoded as zero-page when a mnemonic allows it;
  `$0010` forces a 16-bit absolute address. Changing the width alters opcode
  size, so preserve width unless deliberately moving code.
- If you run `tools/extract.py` on the original ROM, it regenerates ALL PRG
  source and CHR files. Save your changes first.
- Converting a PNG to RGB mode or changing its palette indices can make the
  image importer reject it or change intended tile pixel values.
