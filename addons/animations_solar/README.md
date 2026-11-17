# avo_animations_solar

Rotate and tilt actions for the Rugged solar panels (`Land_SolarPanel_04_base_F`). User docs: `docs/objects/animations.md#solar-panels`.

## How it works

- Each control (`yaw`, `pitch1`, `pitch2`) gets a plus and a minus action that moves its source by one step (30° for the rotation, 15° for the tilt) within the limits of the editor attributes. The phase of these sources is the angle in degrees.
- The step is animated instantly: the config time of a source is for a change of 1, so a step of 15 to 30 would take far too long.
- It reuses `avo_animations`: the `avo_animations_animate` event to run the change where the panel is local, `avo_animations_fnc_hasSources`, and the public `avo_animations_changed` event.

## Why a separate addon

Advanced Equipment (AE3) has its own solar panel controls. `skipWhenAnyAddonPresent[] = {"ae_main"}` skips this addon when AE3 is loaded, so the actions are not there twice, while the other animations still load. Arma 3 versions before 2.22 ignore that property and load the addon anyway.
