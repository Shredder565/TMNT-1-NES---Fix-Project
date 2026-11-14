# TMNT NES modernization project — checkpoint 2026-11-13

## Goal

Make the original 1989 USA NES game easy to edit and recompile, and progressively
improve CPU-limited slowdowns in busy combat while preserving all enemies and
character behavior. Later work includes play-character replacements and bug fixes.

## Shipped in this checkpoint

- **Clean NES build**: fixed-size per-bank 6502 assembly + CHR source rebuild
  matches the 262,160-byte original SHA-256 byte-for-byte.
- **New dispatcher-assisted source**: five decoded inline `JSR $C702` jump
  tables, 26 distinct fixed-bank pointer roots, 7,745 candidate executable
  bytes in bank 7 (baseline had 2,077). The new paths are static hypotheses,
  not proven by gameplay traces. Bank switchable targets remain unresolved.
- **Actual modified NES ROM**: guarded, 6-byte instruction replacement at
  PRG07 `$C114` in sprite tile generation, savings **3 NES CPU cycles per
  sprite tile** for identical output.
- **Editable modified source** at `mods/lag_reduction_v1/source/`.
- **Standalone IPS patch**, original & experimental `.nes` files.
- **Profiling tools** able to consume *real* per-frame and CPU-opcode CSV logs
  in an emulator (no real logs supplied this checkpoint).
- **18 tests pass** including exact rebuild, patch manifest parity, byte
  differences, IPS round trip, and mathematical sprite arithmetic parity.

## Not achieved yet

- **Sustained 60 game-logic updates per second in all enemy-heavy scenes**.
  This cannot be confirmed without playing and measuring the modified ROM.
- A substantial measured slowdown reduction. The current small speedup may not
  be observable where game logic, collision, sound or PPU writes dominate.
- Complete 6502 code/data separation and runtime-confirmed entry points.
- Character roster replacement, gameplay modifications and in-emulator
  regression testing.

## How to evaluate the real 60 fps result

Use a compatible NES emulator to record the value of RAM `$001F` at entry to
NMI `$C3A3` for both original and modified builds. Each normal gameplay NMI
with `$001F != 0` signifies that the main logic update was skipped. Compare
lag-frame frequency in heavy-enemy scenes. The analyzer is
`python tools/profile_frames.py original.csv --compare modified.csv`.

**No independent runtime/emulator benchmark has been completed for this patch.**
