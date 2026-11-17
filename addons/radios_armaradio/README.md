# avo_radios_armaradio

More vanilla objects that play radio stations with ArmaRadio (Live Radio): the smartphone, the tablets and every laptop. Skipped without ArmaRadio. User docs: `docs/objects/radios.md`.

## How it works

- `XEH_postInit.sqf` adds one ACE action to the classes by name through `avo_common_fnc_addClassActions`. It calls `live_radio_interface_fnc_open` for the object, with a condition of our own. Classes that already have ArmaRadio's config action are left out, so it isn't there twice.
- `CfgVehicles.hpp` sets ArmaRadio's `live_radio_interface_hasRadio = 1` on the base game classes, patched by inheritance with their vanilla parents.
- The DLC classes (Helicopters and Apex tablets, Argo and Contact laptops) are not patched in config, which would need those DLCs. They get the action by name, so the addon needs nothing but the base game. `addClassActions` skips a class that does not exist.

## Why

- Our own condition, not ArmaRadio's `canOpen`: older ArmaRadio builds make `canOpen` fail for everything that is not a vehicle unless its "interact outside vehicle" setting is on.
- ArmaRadio has no public functions. `fnc_open` is internal, so `XEH_postInit.sqf` checks that it exists and leaves the actions out with a `WARNING` otherwise. Check it after every ArmaRadio update.
