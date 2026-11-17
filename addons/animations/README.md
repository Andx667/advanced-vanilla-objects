# avo_animations

ACE actions for vanilla objects whose animations could only be changed with editor attributes: drawers, doors, lids, switches, the flag pole and more. User docs: `docs/objects/animations.md`.

## How it works

- `fnc_addActions` (postInit, clients only) builds every action from three local helpers: `_toggle` switches one or more animation sources between two phases (A and B), `_set` puts a source to one phase (the three positions of the transfer switch), and `_register` adds them to a base class and its children through `avo_common_fnc_addClassActions`, in a sub menu when there is a group.
- Actions are added to base classes. Not every variant has every source (a 4 and a 7 drawer cabinet share a base), so `fnc_hasSources` reads the object's `AnimationSources` config and decides per variant whether an action is shown. A sub menu is shown when at least one of its sources exists.
- `fnc_inState` decides which of the two states a toggle is in by the first source: the state its phase is closer to.
- Animations have to run where the object is local. The action sends `avo_animations_animate` to the owner with `CBA_fnc_targetEvent`, and `fnc_animate` runs `animateSource` there.
- Every use raises the public `avo_animations_changed` event. The control ids are part of that contract (see `docs/scripting.md#avo_animations_changed`), so don't rename them.

## Why some things are the way they are

- Tent doors: the door leaf is hidden when open (`Door_*_Hide`), and the action point is put at the door selection (`_doorSelections`), because the tents are too big for one central point.
- The outer medical tents derive from the base but don't have its door, so they are excluded by name.
- Actions that can be shown together are in a group, otherwise ACE would put their points on top of each other.
- No Contact addons are required: classes that are not loaded never get actions.
