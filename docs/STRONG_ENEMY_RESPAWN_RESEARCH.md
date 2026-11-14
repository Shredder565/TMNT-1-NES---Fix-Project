# Strong enemies do not respawn — NES-specific research and experimental build

Status as of **2026-11-14**: an **experimental ROM implementation** was built from editable 6502 source and exercised in a **synthetic miniature 6502 CPU harness**. **It has NOT been tested in a real NES emulator or through gameplay.** It must not be regarded as a proven complete fix.

## What the experimental patch attempts

- Enemies are classified as **strong** if their initial hit points are **at least 32** (`CMP #$20` in the source). `analysis/enemy_hp_type_candidates.csv` provides the underlying initial-HP table. That CSV is a candidate catalog, not a list of verified active spawns.
- Exempts scripted bosses with type IDs `$70`–`$7F` and special timed-wave spawns. This protects original progression, but means **not every stronger adversary is covered**.
- When a qualifying static enemy spawns, its original location is recorded per active actor slot.
- When the enemy's HP reaches zero through the tracked weapon-hit handler, mark the unique spawn-list record defeated.
- When the original spawning code encounters that spawn-list record again, skip allocation. Other spawns proceed normally, even if their hash index collides.
- The defeated-spawn key is `(level RAM $48, subarea RAM $5D, spawn list pointer RAM $42/$43, entry index RAM $1A)`. Up to 256 killed records are stored in six indexed 256-byte pages of MMC1 PRG-RAM (`$6800`–`$6DFF`), with per-actor keys stored at `$6000`–`$606F`. **The design assumes mapper 1 provides writable PRG-RAM.**
- Fixed-bank reset code (`bank 7 $FFD8` pointing to new init at `$FED6`) clears the 256-byte occupancy page and actor scratch, preserving the original reset vector and header. Selecting **New Game** without a hardware RESET may NOT clear defeated records.

## Hook and source map

| Location | Original | Prototype |
|---|---|---|
| Bank 6 `$8162` | `JSR $EED3` on overworld static spawn | Redirect to `RESPAWN_SPAWN_CHECK`, which conditionally calls original allocator |
| Bank 6 `$8225` | `JSR $EED3` on subarea spawn | Redirect to same guard |
| Bank 6 `$82C9` | `JSR $EED3` on third spawn-list path | Redirect to same guard (**checkpoint 2**) |
| Bank 6 `$8298` | `LDY #$C2; LDA $0480,X` | Jump into `RESPAWN_RECORD_ORIGIN` and resume at `$829D` after displaced instructions |
| Bank 6 `$99AC` | `LDA #$00; STA $0560,X` on lethal damage | `JSR RESPAWN_MARK_DEAD; NOP; NOP`, then continue at `$99B1` |
| Bank 6 `$BD92`–`$BFD7` | 582 `$FF` pad bytes | Injected, labeled 6502 routine (315 bytes), remaining pad is `$FF` |
| Bank 7 `$FED6`–`$FEFF` | 42 `$FF` pad bytes | Fixed-bank reset initializer (21 bytes), remaining pad is `$FF` |
| Bank 7 `$FFD8` | Reset instructions | Jump to initializer; original reset continuation at `$C310` |

Full source: `mods/leonardo_strong_enemy_respawn_PROTOTYPE/source/bank06.asm` and `/bank07.asm`.

## What HAS been verified

- Patched ROM is exactly 262,160 bytes, with the same iNES header, the same graphics, and the original reset vector.
- Source reassembles and the IPS patch recreates the patched ROM byte-for-byte from the vanilla ROM.
- Guarded source-edit script only modifies the identified hook sites (including the added `$82C9` hook), newly injected former-`$FF` space, and the separately audited Leonardo/old sprite-cycle edits.
- A miniature 6502 interpreter (tests/test_respawn_prototype.py) runs the actual injected machine instructions to check: reset initialization; kill a strong enemy and suppress its exact spawn; leave other spawn points/rooms/levels unaffected; leave weak enemies and bosses unaffected; exclude waves.
- Full project unit tests pass. **This is *not* a gameplay emulator test.**

## What remains unproven and potentially broken

1. Whether the game's actual mapper-1 configuration supports reading/writing the assumed `$6000`–`$6DFF` PRG-RAM in every active gameplay mode. **If it does not, the experimental ROM may fail.**
2. Whether all stronger adversaries use the `$8162`/`$8225` spawn paths and `$99AC` death path under real gameplay conditions. Some enemy waves and scripted spawns intentionally bypass these hooks.
3. Whether the original game repurposes an actor slot using another allocator: a stale spawn record might incorrectly be attributed to that actor if it has the same enemy type.
4. Whether a newly started game (without pressing console Reset) inherits defeated entries: currently yes, until a New Game hook is established.
5. Timing overhead under heavy enemy counts, and potential interference with the existing experimental sprite-cycle lag reduction. **This patch is not a 60 FPS guarantee.**
6. Actual backtracking scenarios in level 1 through 6, with regular enemies, multi-phase bosses, mandatory encounters, area transitions, and alternate weapons.

### Required emulator verification (RetroPixels or another accurate mapper-1 emulator)

**First use `build/TMNT_Leonardo_Equals_Donatello.nes`** for the confirmed two-byte damage change. For the new persistence code use **only** `build/TMNT_Leo_Lag_NoRespawn_UNTESTED_PROTOTYPE.nes`, ideally with emulator save states and a debugger.

1. Start a clean game using the experimental ROM. Check that Mario-style reset and the intro/title screen still function. Confirm PRG-RAM `$6D00`–`$6DFF` is all zero shortly after reset.
2. In a side-scrolling area, defeat a **nonboss enemy whose initial HP is at least 32**, scroll offscreen, and return. Confirm it is absent.
3. Kill a weaker enemy at the same location; scroll away and back. Confirm original respawn behavior remains.
4. Kill a strong enemy with a special weapon; confirm it stays dead after backtracking.
5. Test separate spawn points with similar pointers, same type, and different subareas/stages. Only the exact killed spawn should be suppressed.
6. Test mandatory battles, bosses, and timed waves. Nothing needed for progression may disappear prematurely.
7. Start another game without resetting and test whether defeated flags erroneously persist (known expected issue). Restart/reset the console and verify flags clear.
8. Record per-NMI CPU cycles and logic frames in multi-enemy scenes. Compare vanilla, Leonardo-only, prior lag experiment, and experimental persistence patch.

## Adjusting the strength threshold

In `mods/leonardo_strong_enemy_respawn_PROTOTYPE/source/bank06.asm`, locate `RESPAWN_RECORD_ORIGIN:` and change `CMP #$20` to another 8-bit hex value, e.g. `#$18` (24 HP). Recompile using `python tools/build.py --source-dir mods/leonardo_strong_enemy_respawn_PROTOTYPE/source --output build/my_strong_enemy_test.nes`. **Only change the operand byte**, not the instruction size. Do not rerun `tools/build_respawn_prototype.py` after manual edits; it regenerates and overwrites its source profile.

## Alternative source reference

A separately developed, unofficial **PC C-port** has an opt-in "stay dead" behavior using extra host memory. Its implementation is useful for independent research, but it is **not an NES-ROM patch** and cannot be copied unchanged onto this game's 2 KiB internal RAM architecture:

https://github.com/naparuba-retro/tmnt-recomp

No code was copied from that repository into this NES package. This prototype consists of original assembly injected into free ROM bytes and sourced from analysis of the supplied USA NES ROM.

## Checkpoint 2 addendum — third direct allocator call (`$82C9`)

Source audit of the recovered bank 6 found a third `JSR $EED3` call in the spawn-list handling area at `$82C9`, not covered by the previous prototype. The experimental source hooks this third call via `JSR RESPAWN_SPAWN_CHECK` while keeping the original 3-byte instruction footprint. A synthetic 6502 test checks that a previously killed static spawn is suppressed through that call, while a distinct spawn is still allocated. Byte-change whitelist and IPS roundtrip checks were expanded accordingly.

**Limitations still apply:** only the three identified direct calls are intercepted; indirect/different-bank spawners may exist, and a real emulator must confirm bank mapping, PRG-RAM, `New Game` reset semantics and progression. The addendum does not supersede the warning above that the whole prototype is unverified in gameplay.
