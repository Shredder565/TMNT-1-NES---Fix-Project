# Leonardo matches Donatello — verified damage change

The game's primary weapon hit handler was identified and isolated in bank 6. This change **modifies damage per registered hit**, not sword artwork, reach, weapon animation timing, active frames, or hitbox geometry. Those are separate systems and have not been altered.

## Evidence in machine code

1. Bank 6 `$9978`: `LDY $67` selects the active turtle. `$67`: 0 Leonardo, 1 Raphael, 2 Michelangelo, 3 Donatello.
2. Bank 6 `$9988`: `ASL A` doubles that index, selecting a pair of table entries per turtle.
3. Bank 6 `$998E`–`$999B`: read current turtle energy, increment to the second entry if health is below `$40`.
4. Bank 6 `$99A2`: `SBC $9BCB,Y` subtracts selected damage from the current enemy's HP (`$0560,X`).
5. Bank 6 `$99AC`: the zero HP / death branch (prototype also hooks this for defeated-spawn tracking).

## Balance table

| Primary weapon | Original normal HP ≥ `$40` | Original low-energy HP < `$40` | New normal | New low-energy |
|---|---:|---:|---:|---:|
| Leonardo | 7 (`$07`) | 10 (`$0A`) | **15 (`$0F`)** | **16 (`$10`)** |
| Raphael | 9 | 9 | 9 | 9 |
| Michelangelo | 7 | 12 | 7 | 12 |
| Donatello | 15 | 16 | 15 | 16 |

ROM offsets **`0x19BDB`–`0x19BDC`** change from `07 0A` to `0F 10` (bank 6 CPU `$9BCB`–`$9BCC`). The other turtle values and all character graphics remain untouched. The corresponding editable source is at `mods/leonardo_equal_donatello/source/bank06.asm`, under labels `LEONARDO_NORMAL_WEAPON_DAMAGE` and `LEONARDO_LOW_HP_WEAPON_DAMAGE`. The source is rebuilt and the exact two-byte patch is checked against `patches/leonardo_equal_donatello.json`.

## Why not extend Leonardo's sword hitbox automatically?

"Hit detection" can mean contact/reach or the strength of a hit. The requested **strength** is corrected here via two documented damage bytes. Matching Donatello's *reach* or *active frames* would require tracing player weapon collision rectangles and animation IDs; those parameters were not safely isolated. Changing other bytes without proving their meaning would risk corrupting combat or sprites.

## How to rebuild

From the top-level project folder, with Python 3:

```bash
python tools/build.py --source-dir mods/leonardo_equal_donatello/source --output build/Leo_Custom.nes
python tools/build.py --source-dir mods/leonardo_plus_lag_experiment/source --output build/Leo_Custom_With_Old_Speed_Experiment.nes
python -m unittest discover -s tests -v
```

**Runtime status:** exact byte-level assembly and synthetic table-index tests passed; manual NES gameplay validation has not been performed.
