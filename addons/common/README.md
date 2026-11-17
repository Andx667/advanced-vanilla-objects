# avo_common

Shared base of the feature addons: it carries the CBA/ACE dependencies and the helpers more than one addon needs.

## Dependencies

`requiredAddons[]` lists `cba_main`, `ace_common` and `ace_interact_menu` with `skipWhenMissingDependencies = 1`. Every feature addon requires `avo_common` (directly or through another AVO addon), so when CBA or ACE is missing they are all skipped instead of erroring, and none of them has to list CBA/ACE again.

## Functions

All three are public (`Public: Yes`) and documented for users in `docs/scripting.md#functions`. Changing their arguments or results is a contract change.

- `fnc_addClassActions`: adds an ACE action to a class and every class derived from it. `ace_interact_menu_fnc_addActionToClass` with inheritance only reaches objects that run CBA's extended event handlers. Classes that define their own `EventHandlers` (Rugged terminals, weather station, cabinets, coffins...) or derive from `Static` don't, so the action is added to each placeable class (scope > 0) by name instead. The child map of `CfgVehicles` is built once on the first call and kept in `avo_common_children`.
- `fnc_interactionPosition`: the point of an action, by the size of the object: the centre for small objects, chest height for medium ones, and for big ones the given selection (a tent door) or the point closest to the player. It runs every frame for every action in range, so the selection lookup is cached per class and selection list in `avo_common_selectionPositions`.
- `fnc_topPosition`: top centre of the bounding box in ASL, following the object's orientation. Used for the ACRE antenna tip and the weather sensor height instead of hand-measured offsets.
