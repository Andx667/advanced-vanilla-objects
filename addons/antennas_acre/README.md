# avo_antennas_acre

Connect an ACRE2 radio to the Contact satellite dishes, omni-directional antennas and active Rugged terminals, like ACRE's ground spike antenna (GSA). Skipped without ACRE2. User docs: `docs/objects/antennas.md`.

## How it works

- ACRE's GSA code only needs an `AcreComponents` class and `acre_antennaPosFnc` on the object (`CfgVehicles.hpp`). The components (`CfgAcreComponents.hpp`) inherit connector and gain pattern from ACRE's `ACRE_243CM_VHF_TNC` and allow the PRC-117F and PRC-152.
- `height` is 0, and `fnc_antennaPos` (via `avo_common_fnc_topPosition`) gives the real tip of the model, so height matters for range without hand-measured values.
- `fnc_addActions` adds Connect/Disconnect, at the top level for always-active antennas or nested in the terminal sub menu of `avo_antennas` (`[QEGVAR(antennas,terminal)]`). Connect is only shown while `avo_antennas_fnc_isActive` is true. Disconnect is never gated by the setting, so an existing link can always be removed.
- ACRE's events `acre_sys_gsa_connectGsa`/`disconnectGsa` are relayed as the public `avo_antennas_connected`/`disconnected` events, only for components named `avo_antennas_*` (this addon's and `avo_antennas_gm_acre`'s).
- On `avo_antennas_deactivated`, the server disconnects a radio that is still connected, because ACRE doesn't know about the switch.

## Non-public ACRE functions

The connect/disconnect logic is ACRE's own `sys_gsa` code (`connectChildrenActions`, `disconnect`, `isAntennaConnected`, `hasCompatibleRadios`), which is not public API, and ACRE has no public alternative. `XEH_postInit.sqf` checks for them and leaves out the actions with a `WARNING` when one is missing. Check them after every ACRE update.
