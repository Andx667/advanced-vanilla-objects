# avo_antennas_gm

The antenna mast of the Global Mobilization command shelters (`gm_shelteraceI_command_base`, every nation): extend and retract it like a Rugged terminal. Comms-agnostic, the ACRE and TFAR parts are in their own addons. Skipped without Global Mobilization. User docs: `docs/objects/antennas.md#global-mobilization-command-shelters`.

## How it works

- Config only, plus one `avo_antennas_fnc_addActions` call in postInit for the "Antenna" sub menu.
- `CfgVehicles.hpp` declares the mast with the `avo_antennas` config properties:
  - `requiredSources[] = {"antennaMast_01_unhide"}`: the mast is optional (the *Add antenna* attribute). Shelters without it have no actions.
  - `activeSources[]`: the elevate trigger and source.
  - `activePhase = 1`: the GM sources run from 0 to 1, and their trigger only extends the mast at exactly 1.

## Notes

GM is encrypted (`.ebo`), so its config can't be read. The source names come from the editor attributes.
