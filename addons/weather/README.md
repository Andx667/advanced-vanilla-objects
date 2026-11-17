# avo_weather

Read the weather at the Contact portable weather station, and the wind at the windsock. User docs: `docs/objects/weather.md`.

## How it works

- `XEH_postInit.sqf` adds one action each to `Land_PortableWeatherStation_01_base_F` (white, olive and sand) and `Windsock_01_F` through `avo_common_fnc_addClassActions`. Each use raises the public `avo_weather_read` event.
- `fnc_readData` runs on the reading client and shows the result with `ace_common_fnc_displayText`:
  - Wind: `ace_weather_fnc_calculateWindSpeed` at the top of the model plus 0.5 m (`avo_common_fnc_topPosition`), with ACE's terrain and obstacle model, so a station in a valley or behind a building reads less wind. The direction is converted from where the wind blows to where it comes from.
  - Temperature, humidity, dew point and pressure come from ACE weather at the station's altitude. They are left out when ACE weather has no data (its simulation is off).
  - Wind chill and heat index use the same ACE formulas as a player's temperature, and are only shown where they apply.

## Non-public ACE functions

The `ace_weather_fnc_calculate*` functions are not public API, and ACE has no public alternative. Check them after every ACE update.
