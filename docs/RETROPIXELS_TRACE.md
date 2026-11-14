# Runtime execution tracing with RetroPixels (proposed integration)

This is a **trace interface**, not a claim that RetroPixels has already been
patched or can automatically export it. Any NES emulator which exposes CPU
instruction fetches and MMC1 bank mapping can produce the CSV below.

Record **one row for each unique physically mapped instruction address**
executed across representative gameplay, not the entire per-frame instruction
stream unless convenient.

```csv
bank,pc
7,$FFD8
7,$C310
5,$8001
6,$8001
```

At each actual CPU opcode fetch, capture the CPU program counter `PC` and the
physical 16 KiB PRG-ROM bank mapped at that address **before** fetching and
executing the instruction. In normal MMC1 16 KiB fixed-last-bank mode:

- `PC $8000-$BFFF`: physical swappable bank (0 through 6, or 7 when mapped);
- `PC $C000-$FFFF`: physical fixed bank 7 in mode 3;
- Ignore RAM/IO execution events, or log them to a separate unclassified file.

**Do not automatically force bank 7 for upper addresses when MMC1 uses a
non-fixed-last-bank PRG mode.** Trace import deliberately assumes the standard
mapping found in the disassembly. Alternative MMC1 modes require a richer
`cpu_pc, physical_bank, bank_window, prg_mode` schema and per-window source
mapping before import.

In a 6502 fetch handler (pseudocode, language-independent):

```text
onOpcodeFetch(pc):
    if pc in PRG-ROM window:
        physical_bank = mapper.physicalPrg16kBankForCpuAddress(pc)
        if (pc >= 0xC000 and physical_bank != 7):
            report nonstandard mapping; do not feed this row to current importer
        write_once("bank,pc", physical_bank, pc)
```

Collect test runs for reset/title, over-world map, sewer stages, bosses,
underwater levels, all four turtle selections, menus, damage and character
switches. Cover many distinct states; the same bank address can be data in
one PRG bank and code in another. If the same PC is logged under different
physical banks, **keep both rows**.

Regenerate the exploratory disassembly using the local ROM generated from the
included editable project (no need for a second ROM copy):

```sh
python tools/build.py --expect-vanilla
python tools/recover_code.py 'build/Teenage Mutant Ninja Turtles (Rebuilt).nes' \
  --trace recorded.csv --out analysis/trace_backed_source
python tools/build.py --source-dir analysis/trace_backed_source --expect-vanilla
```

This verifies that newly classified instructions still assemble byte-for-byte.
It does **not** confirm that all indirect dispatch or code paths were seen.
Verified coverage additionally requires comparing each executed PC to recovered
instruction boundaries and confirming mapper bank state. The next reverse-
engineering pass should add independent trace coverage masks and jump-table
annotations.
