# avo_antennas

Comms-agnostic base of the antenna addons: switches the Rugged communications terminals (and, through `avo_antennas_gm`, the GM antenna mast) on and off. It has no ACRE or TFAR dependency, the comms addons build on it. User docs: `docs/objects/antennas.md`.

## How it works

- State is declared in config, not in code. `CfgVehicles.hpp` gives the terminals `avo_antennas_activeSources[]`: the animation sources the "Open terminal" editor attribute raises. The first one marks the state.
  - `fnc_isActive`: active while the first source is above 0. Objects without the property (dishes, omni antennas) are always active.
  - `fnc_isEquipped`: objects where the antenna is optional (the GM mast) list `avo_antennas_requiredSources[]`, all of which have to be above 0.
  - `fnc_setActive`: animates the active sources to `avo_antennas_activePhase` (100 by default) or 0. It has to run where the object is local, so the actions send `avo_antennas_setActive` with `CBA_fnc_targetEvent`.
- `fnc_addActions` adds a sub menu with activate/deactivate to a class. The sub menu always has the path `[QGVAR(terminal)]`, so the comms addons can nest their own actions in it. It is shown while the object is equipped, even when the setting is off, so the comms addons' actions (gated by their own settings) stay reachable.
- Switching raises the public `avo_antennas_activated`/`avo_antennas_deactivated` events. `avo_antennas_acre` uses them to disconnect radios, `avo_antennas_tfar` to register towers.

## Why

- Config properties instead of class lists in code let other addons (GM, other mods) add antennas without touching this one. They are documented in `docs/scripting.md#config`.
- Reopened vanilla classes always keep their parent, since a class reopened without one loses its inheritance.
