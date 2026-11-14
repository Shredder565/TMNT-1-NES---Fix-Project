# NES-only parallel reverse-engineering workstreams

These are independent assignments for human/AI developers to pick up in parallel.
**No background team has been launched through this workspace.** A source-
complete recreation cannot be guaranteed in a day just by increasing agent count.

| Workstream | Priority | Deliverable / acceptance | Current status |
|---|---|---|---|
| N01 Build & reproducibility | High | All eight PRG banks and 16 CHR banks round-trip byte-exact | Complete |
| N02 Execution tracing | Critical | MMC1 bank-aware CSV from real gameplay | Interface defined; emulator export not implemented |
| N03 Static 6502 analysis | Critical | Candidate code map, static refs and conflicts with evidence | Exploratory 18.8% decoded |
| N04 Bank 07 interrupt/mapper | High | Verified reset/NMI/IRQ and MMC1 register write annotations | Vectors named; further recovery pending |
| N05 Bank 05 objects | High | Actor routines, slot map, collision/damage semantics | Source candidates and RAM xrefs only |
| N06 Bank 06 event/objects | High | Entity scheduling/AI logic identification | Source candidates only |
| N07 Bank 00 engine/gameplay | High | Gameplay systems and mode transitions | Source candidates only |
| N08 Banks 02/03/04 packed data | High | Documented event/level format + lossless decoder/reencoder | 100 bank 02 pointers mapped; format unknown |
| N09 Sprite/art editor | High | User-facing editor for CHR sprites with build integration | Single-tile GUI, multi-tile CLI completed |
| N10 Character selection & animation | Critical | Four turtle roster assignments, OAM sequence tables, safe character swap test | Not started |
| N11 Bug triage and patching | High | Specific reproducible bug reports and guarded minimal fixes | Guarded patches/IPS/diff done; no bug identified |
| N12 Runtime validation | Critical | Emulator boot + representative gameplay before/after screenshots & logs | Tests cover binary, not real gameplay |

## Merge/acceptance requirements

Each module should ship source and tests, a ROM file offset/bank/CPU mapping,
provenance of conclusions (runtime trace, byte reference, or hypothesis), and
byte-identical vanilla rebuild. Every actual gameplay patch must identify its
purpose and include a before/after emulator test. Preserve instruction sizes
until a safe relocator/trampoline system is in place.
