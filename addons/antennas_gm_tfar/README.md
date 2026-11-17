# avo_antennas_gm_tfar

Registers the antenna mast of the Global Mobilization command shelters (`gm_shelteraceI_command_base`) as a TFAR radio tower while it is extended. Loaded only when Global Mobilization and TFAR are both there (`skipWhenMissingDependencies`).

## How it works

- It is config only. `avo_antennas_gm` declares the mast in config (`avo_antennas_requiredSources`, `avo_antennas_activeSources`, `avo_antennas_activePhase`), so `avo_antennas_fnc_isActive` already knows when it is extended.
- `CfgEventHandlers.hpp` adds the shelter class to the same InitPost/Deleted handlers `avo_antennas_tfar` uses for the Rugged terminals: `avo_antennas_tfar_fnc_initAntenna` registers a mast that is already extended when the shelter is created or a client joins, and `avo_antennas_tfar_fnc_deregisterTower` removes the tower when the shelter is deleted.
- Extending and retracting later are handled by the `avo_antennas_activated`/`avo_antennas_deactivated` handlers in `avo_antennas_tfar`, they are not specific to a class.

## Why a separate addon

Compat code for a mod lives in an addon that requires it. The GM class used to be listed in `avo_antennas_tfar`, which does not require Global Mobilization. That was harmless (XEH entries for a class that does not exist do nothing), but it hid a GM dependency in the TFAR addon.

## Open point

CBA disables XEH for classes derived from `Static` (see `avo_antennas_tfar/CfgVehicles.hpp`, which opts the mounted dishes and terminals back in with `XEH_ENABLED`). Global Mobilization is encrypted, so whether `gm_shelteraceI_base` derives from `Static` could not be checked. If the mast never registers on mission start or JIP, add an `XEH_ENABLED` patch for the shelter class here.
