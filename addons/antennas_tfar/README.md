# avo_antennas_tfar

Registers the antennas as TFAR radio towers: the satellite dishes and omni-directional antennas always, the Rugged communications terminals while they are active. Skipped without TFAR. User docs: `docs/objects/antennas.md#tfar`.

## How it works

- TFAR has no per-radio connection like ACRE's GSA. A tower boosts every radio in range, so an antenna only has to be registered (`TFAR_antennas_fnc_initRadioTower`, public) and deregistered (`TFAR_antennas_fnc_deleteRadioTower`, public). Towers are local to each client, so all of this runs on clients only.
- `CfgEventHandlers.hpp`: InitPost (`fnc_initAntenna`) registers an antenna when it is created on a client, which also covers JIP and terminals that are already active. Deleted handlers deregister it.
- `XEH_postInit.sqf`: the `avo_antennas_activated`/`deactivated` events register and deregister the terminals when they are switched later.
- `fnc_updateTower` decides from the setting and `avo_antennas_fnc_isActive`. A change of either setting re-runs it for every antenna of the client (`avo_antennas_tfar_updateTowers`), because TFAR keeps the range a tower was registered with.

## Why

- CBA switches XEH off for everything derived from `Static`, which includes the mounted dishes and the terminals, so the InitPost/Deleted handlers would never run for them. `CfgVehicles.hpp` turns it back on with `XEH_ENABLED` for these classes only, the same way CBA does for TFAR's own tower base. The parents are kept when the classes are reopened.
- Only the three communications terminals are covered, not `RuggedTerminal_Base_F`: its other children have no `avo_antennas_activeSources`, so they would count as always active.
