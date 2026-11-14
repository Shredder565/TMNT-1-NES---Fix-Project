# ROM map and reverse engineering progress

## Actual uploaded NES header (verified)

- System: NES, CPU Ricoh 2A03 (NMOS 6502 subset), 8-bit registers.
- Cartridge mapper: **1 (MMC1)**, dynamic PRG/CHR bank switching.
- iNES header: `4E 45 53 1A 08 10 10 00 00 00 00 00 00 00 00 00`.
- PRG: 128 KiB = eight 16,384-byte banks; ROM offsets 0x00010..0x2000F.
- CHR: 128 KiB = sixteen 8,192-byte banks; ROM offsets 0x20010..0x4000F.
- Horizontal mirroring flag in header; MMC1 can change mirroring at runtime.
- ROM last six bytes: NMI vector `$C3A3`, RESET vector `$FFD8`, IRQ vector `$C412`.

## PRG bank mapping

| Bank | PRG physical ROM offset | CPU window in this assembly | Static code classification |
| ---: | ---: | ---: | ---: |
| 00 | `0x00010` | `$8000-$BFFF` | 2,613 bytes / 15.9% |
| 01 | `0x04010` | `$8000-$BFFF` | Data/unclassified |
| 02 | `0x08010` | `$8000-$BFFF` | Data/unclassified |
| 03 | `0x0C010` | `$8000-$BFFF` | Data/unclassified |
| 04 | `0x10010` | `$8000-$BFFF` | Data/unclassified |
| 05 | `0x14010` | `$8000-$BFFF` | 667 bytes / 4.1% |
| 06 | `0x18010` | `$8000-$BFFF` | 384 bytes / 2.3% |
| 07 | `0x1C010` | `$C000-$FFFF` | 2,077 bytes / 12.7% |

*Important:* These are **static trace classifications**, not percentages of
actual executable code. Banks may contain undiscovered code, especially
routines reached from jump tables and runtime bank selectors. Bank 7 is the
fixed mapping in common MMC1 16K-mode usage, but the MMC1 itself can be
configured for other modes.

**File offset formula**:

- Swappable bank i (0..6), CPU address A in `$8000-$BFFF`:
  `ROM offset = 0x10 + (i * 0x4000) + (A - 0x8000)`.
- Fixed bank 7, CPU address A in `$C000-$FFFF`:
  `ROM offset = 0x10 + (7 * 0x4000) + (A - 0xC000)`.
- CHR bank j (0..15), tile N within a bank (0..511):
  `ROM offset = 0x20010 + j * 0x2000 + N * 16`.

Each PRG bank starts with a one-byte identifier, e.g. bank 00 starts `$00`,
bank 07 starts `$07`. The last bank includes interrupt vectors.

## High-confidence CPU entry points

- `$FFD8` — reset vector target, bank 07: begins `CLD / SEI / INC $FFFF / JMP $C310`.
- `$C3A3` — NMI vector target, bank 07 (vertical blank callback).
- `$C412` — IRQ vector target, bank 07.

You can locate these entry addresses by searching labels or source comments in
`asm/prg/bank07.asm`.

## Next source recovery milestones

1. Add CPU execute-trace and bank-switch log from a compatible emulator
   (e.g. a future RetroPixels trace export). Include the active MMC1 PRG bank,
   CPU PC and whether an address executed, so dynamic code is identified.
2. Parse and annotate jump tables and identify routine ownership by bank.
3. Assign symbolic labels to RAM and gameplay structures; identify level,
   enemy, physics, audio, rendering, UI and script engines.
4. Add safe relocations/trampolines and free-space analysis for expanded code.
5. Identify compressed maps/assets and add level/object editors.
6. Add automated gameplay regression checks in an emulator.

Static analysis is deliberately conservative. False labels and traces need
manual validation against execution traces before making behavioral claims.
