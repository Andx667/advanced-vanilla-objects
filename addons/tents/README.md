# avo_tents

Packed tents as inventory items: set them up with a 3D placement, pack them up again, and store items in a placed tent. User docs: `docs/objects/tents.md`. The placement functions are GPL licensed, see `functions/readme.md`.

## How it works

- **Items:** a tent is any `CfgWeapons` item with an `avo_tents_object` property naming the tent class (`CfgWeapons.hpp`, derived from `avo_tents_base`). `fnc_scanItems` finds them on every machine at postInit, so other addons (`avo_tents_bwa3`, other mods) only add a config item. The property is documented in `docs/scripting.md#adding-tents`.
- **Holders:** `Item_avo_tents_*` (`CfgVehicles.hpp`) list the items in Eden and Zeus. They use the dummy item model, because a tent model would flicker with the item model the engine also draws.
- **Set up:** a self action per carried tent, then `fnc_place` (local ghost object; a PFH follows the view and is removed when done, and the mouse wheel rotates), `fnc_startBuild` (ACE progress bar) and `fnc_construct` (creates the tent and a grass cutter, raises `avo_tents_setUp`).
- **Pack up:** `fnc_canPackUp`, then `fnc_progressPackUp` (the tent is locked with `avo_tents_inUse`), `fnc_packUp` and `fnc_finishPackUp` (raises `avo_tents_packedUp`).
- **Inventory:** tents are buildings and can't hold cargo, so a tent gets an invisible `avo_tents_container` attached when its inventory is first opened.

## Networking

The server owns the inventories:

- It creates the container (`avo_tents_createContainer`), so two players who open a new tent at once never get two.
- When a tent with an inventory is packed up, it checks and deletes the container in one step (`avo_tents_commitPackUp`), so an item put in at the last moment is not lost.
- It always answers the requesting unit with `CBA_fnc_targetEvent` (`inventoryAnswer`, `packUpAnswer`), so nothing waits or times out.
- It only accepts tents of AVO's tent classes, because any client can send these events.

## Why

- Pack up and the inventory are only for the exact tent classes (`addActionToClass` without inheritance), not their children, which may be different objects.
- The big tents (decon, connector, medical) are not in the item list, so they get no inventory and no pack up.
