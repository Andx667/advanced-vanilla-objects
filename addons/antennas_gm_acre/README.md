# avo_antennas_gm_acre

Connect an ACRE2 radio to the extended antenna mast of the GM command shelters. Needs Global Mobilization and ACRE2, skipped otherwise.

## How it works

- Config: the shelter class gets an `AcreComponents` class (`avo_antennas_gm_acre_mast`, with the same connector, gain and radios as the antennas of `avo_antennas_acre`) and `acre_antennaPosFnc = avo_antennas_acre_fnc_antennaPos`, so the antenna is at the top of the model.
- postInit nests the Connect/Disconnect actions of `avo_antennas_acre_fnc_addActions` in the "Antenna" sub menu that `avo_antennas_gm` creates (`[QEGVAR(antennas,terminal)]`). They are shown while the mast is extended (`avo_antennas_fnc_isActive`).
- Disconnecting on retract and the `avo_antennas_connected`/`disconnected` events come from `avo_antennas_acre`, which matches every component named `avo_antennas_*`.

## Why a separate addon

`avo_antennas_gm` must load without ACRE, and `avo_antennas_acre` without GM. The combination needs both, so it is its own compat addon.
