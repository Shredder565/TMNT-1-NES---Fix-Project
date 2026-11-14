# Checkpoint 2 — source editing + gameplay validation before enemy sprite replacements

## New source editing feature

`config/weapon_damage.json` directly controls the **primary weapon damage** table for all four turtles:

- `normal`: weapon damage with turtle energy >= `$40`.
- `low_energy`: the weapon damage selected when energy < `$40`.

Modify the JSON, then build a custom variant in a terminal, from the top-level project directory:

```powershell
python tools/edit_weapon_damage.py --config config/weapon_damage.json --variant base
python tools/edit_weapon_damage.py --config config/weapon_damage.json --variant lag
```

Results appear in `build/TMNT_Custom_Weapon_Damage_base.nes` and `build/TMNT_Custom_Weapon_Damage_lag.nes` with matching `.ips` patch files. Every built variant contains eight editable assembly banks in `mods/custom_weapon_damage/<variant>/source/`. Source compilation is guarded against changes outside the 8-byte damage table and the known render experiment. This does **not** change weapon reach, swing timing, or the hitbox.

## Source recovery milestone

- Bank 6 combat is already disassembled in `mods/leonardo_equal_donatello/source/bank06.asm`. The handler at `$9913` is called from `$960C`. It checks immunity/type, selects a weapon damage index at `$9978`–`$999B`, subtracts from enemy HP at `$999E`–`$99A9`, and handles a zero-HP death starting at `$99AC`.
- A new test **executes that actual 6502 handler** from `$9978` through damage subtraction for all turtles, high/low-energy variants, and lethal/nonlethal hits. This goes beyond checking only the damage table's numeric values. Its test CPU is intentionally limited and is **not a complete NES emulator**.
- One additional enemy spawn-list path through bank 6 `$82C9` was identified. The **experimental** no-respawn mod now guards all three identified allocator call sites (`$8162`, `$8225`, `$82C9`) and has a new synthetic test for this path. Other spawn mechanisms and correctness under real gameplay remain unverified.

## Gate 1 — reproducibility (automated now)

On Windows run `validate_update.bat` or manually `python tools/validate_checkpoint.py`. This rebuilds the original, produces six local ROM variants, checks SHA-256 and intended byte differences, and runs unit tests. The results are recorded in `build/CHECKPOINT_VALIDATION.json`.

**Passing this gate does not establish full-game compatibility or 60 FPS.**

## Gate 2 — actual frame pacing under load (requires emulator execution)

1. In an NTSC NES emulator with trace support, replay the **same starting state and input movie** in the original and modified build. A crowded enemy scenario must contain at least eight active enemy/actor slots for at least 300 sampled frames in each run.
2. At **entry to NMI `$C3A3`**, record `frame`, RAM `$001F` before the NMI handler modifies it, and `active_actor_count` (as defined in `docs/60FPS_LAG_REDUCTION.md`). Write one CSV row **for every hardware frame**, no gaps, for both original and modified ROMs. `frame` should be the PPU frame ordinal.
3. Evaluate with:

```powershell
python tools/check_crowded_lag.py original.csv modified.csv --minimum-actors 8 --minimum-frames 300 --allow-skips 0 --json build/crowded_results.json
```

The gate passes only if both traces have enough crowded frames and the modified trace shows **zero positive busy-flag frames** in the observed crowded subset and is no worse than the original. At 60.0988 NTSC PPU frames/sec this is the no-skips target for that captured scene. Passing one scene does **not** establish all levels and all enemy counts run at 60 updates/sec. Actual trace files are **not** included in this checkpoint.

## Gate 3 — enemy-respawn functional playtest

Use the experimental no-respawn ROM separately from the damage-only and lag variants. Test these cases in a real emulator and record the results:

1. Defeat a qualifying, nonboss stronger enemy and leave/reenter its exact spawn area. It must stay gone.
2. Defeat a different stronger enemy in a new room, a new subarea, and a new level; a **different** spawn should still appear correctly.
3. Normal weak enemies should continue to respawn. Timed waves and scripted bosses should behave as before. Progression triggers must still work.
4. Choose **New Game without resetting** and check defeat-history cleanup. **Currently known unimplemented:** the prototype does not clear history on New Game without hardware RESET.
5. Revisit each stage after killing strong enemies; monitor actor-slot reuse and save-RAM behavior; confirm no freeze and no softlock.
6. Compare crowded-scene lag: respawn hash lookups incur extra CPU work and could negate small render savings.

**This gate has not been passed. Do not release the no-respawn prototype as a confirmed fix.**

## Gate 4 — enemy sprite replacement (NEXT, only after Gates 2 and 3)

The planned separate CHR workstream will inventory each enemy's tile-bank, sprite indices, PPU palette, animation frames, and hitbox/render link. Each replacement must fit the NES CHR limitations (8x8 2bpp tiles, four colors per tile from the active subpalette), preserve OAM size or prove any mapper/bank relocation, and verify animation alignment for walking, attacking, and being hit. **No enemy sprites were replaced in this checkpoint.**

## Release channels

- **Conservative**: Leonardo damage-only. Most defensible for early emulator tests.
- **Performance experiment**: Leonardo + 3-cycles-per-sprite Y-render optimization; no runtime 60 FPS measurement.
- **Experimental respawn**: Leonardo + render experiment + 3-hook persistent spawn suppression, synthetic tests only; known New Game/reset and PRG-RAM risks.

Do not put compiled or original NES ROMs into a public GitHub release unless rights and distribution permissions are resolved. The project `.gitignore` excludes `.nes` files.
