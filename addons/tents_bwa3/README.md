# avo_tents_bwa3

The BWA3 small tent (`BWA3_Tent_small_Fleck`) as a packed tent. Skipped without BWA3.

Config only. `CfgWeapons.hpp` adds an item derived from `avo_tents_base` with `avo_tents_object = "BWA3_Tent_small_Fleck"`, and `avo_tents_fnc_scanItems` finds it like any other tent. `CfgVehicles.hpp` adds its `Item_` holder for Eden and Zeus.

It is also the reference for other mods that add a tent, see `docs/scripting.md#adding-tents`.

The inventory picture is BWA3's editor preview (`.jpg`), which `hemtt check` warns about (`L-C11UE`). BWA3 ships no `.paa` for it.
