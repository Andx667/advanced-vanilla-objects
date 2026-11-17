# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- Entries: `* Component - Add|Fix|Change|Remove … (#<PR>) by @<author>`, in the
section that matches the PR's changelog label, the same line release-drafter
writes. Entries from before the repository used pull requests have no number. -->

<!-- TEMPLATE: `hemtt publish` looks up the entry whose heading exactly
matches the current project version (see .hemtt/project.toml's
[version] / addons/main/script_version.hpp) -- so before publishing,
rename "[Unreleased]" below to "[X.Y.Z] - YYYY-MM-DD" matching that
version, and start a fresh empty [Unreleased] section above it. -->

## [Unreleased]

### Fixed

* Tents - Fix Zeus and animation reset on dedicated servers (#29) by @Andx667

### Changed

* Animations, Antennas - Change events to be raised when the change is complete (#32) by @Andx667
* Common - Change public functions to check their argument types (#33) by @Andx667
* Antennas - Change GM antenna mast TFAR support to its own compat addon `avo_antennas_gm_tfar` (#34) by @Andx667
* Antennas, Weather - Change ACRE antenna names and compass points to be translated (#35) by @Andx667

## [1.4.1] - 2026-11-01

### Changed

* Branding - new logo and icon set: the mod icon (`mod.cpp`) is now a 512px icon, with a new Workshop image (#22, #23) by @Andx667
* Documentation - the site is built with Zensical, with the new logo and icon (#17) by @Andx667

## [1.4.0] - 2026-10-05

### Added

* Radios - [ArmaRadio](https://github.com/BrettMayson/ArmaRadio) compatibility (optional addon `avo_radios_armaradio`): the smartphone, the tablets (Helicopters and Apex) and every laptop (base game, Argo and Contact) can play radio stations through an ACE action, skipped without ArmaRadio (#14) by @Andx667

## [1.3.0] - 2026-09-30

### Added

* Antennas - TFAR compatibility (optional addon `avo_antennas_tfar`): the satellite dishes, omni-directional antennas, Rugged terminals and GM antenna masts register as TFAR radio towers while active, so everyone nearby gets the range boost without connecting a specific radio, skipped without TFAR (#12) by @Andx667
* Antennas - new optional addons `avo_antennas_acre` and `avo_antennas_gm_acre` carry the ACRE radio connection that used to be part of `avo_antennas`/`avo_antennas_gm`, see Changed (#12) by @Andx667
* Tents - placed tents have an inventory, opened with "Open Inventory" (invisible container attached to the tent, event `avo_tents_inventoryOpened`). A tent with items in it cannot be packed up, and the server checks that when the pack up is done. Only the tents that can be set up have an inventory, not the big decon, connector and medical tents. The new "Tent inventory" setting turns it off for tents that have none yet (#11) by @Andx667
* Tents - the packed tents are listed in Eden and Zeus (Equipment, Items) and can be picked up from the ground, as `Item_` and the item class (#11) by @Andx667

### Changed

* Antennas - `avo_antennas` and `avo_antennas_gm` no longer require ACRE2, they only switch the Rugged terminals/GM antenna masts on and off now. Connecting an ACRE radio moved to the new `avo_antennas_acre`/`avo_antennas_gm_acre` addons, so ACRE and TFAR support no longer pull each other in through `avo_antennas`. The "Enable antenna connections" setting is now "Enable antenna activation" (`avo_antennas`) plus a separate "Enable ACRE antenna connections" (`avo_antennas_acre`) (#12) by @Andx667
* Tents - "Pack Up Tent" is now in a "Tent" sub menu together with "Open Inventory" (#11) by @Andx667
* Tents - the packed tent items have a picture of their tent in the inventory (solar tents in their four colours, dome tent, A-frame tent) instead of a backpack (#11) by @Andx667

## [1.2.0] - 2026-09-26

### Added

* Antennas - the command shelters of Global Mobilization (optional addon `avo_antennas_gm`): extend and retract the antenna mast, and connect an ACRE radio once it is extended (#9) by @Andx667

### Changed

* Branding - sky blue is now the DLC color and the main color of the documentation, with dark header text and darker link colors so the text stays readable (WCAG AA) (#8) by @Andx667

## [1.1.0] - 2026-09-25

### Added

* Weather - ACE action on the windsock to read the wind (#1) by @Andx667
* Weather - the weather station also shows the wind chill when it is cold and windy, and the heat index when it is warm and humid (#4) by @Andx667
* Events - CBA events for all actions (`avo_animations_changed`, `avo_antennas_activated`, `avo_antennas_deactivated`, `avo_antennas_connected`, `avo_antennas_disconnected`, `avo_tents_setUp`, `avo_tents_packedUp`, `avo_weather_read`), so missions and mods can hook into them (#2) by @Andx667
* Documentation - MkDocs Material site, published to GitHub Pages: the objects with their classnames, the events, functions and config (#3) by @Andx667

## [1.0.0] - 2026-09-25

### Added

* Antennas - connect ACRE radios (PRC-117F, PRC-152) to the vanilla Contact satellite antennas, omni-directional antennas and Rugged communications terminals. The terminals have a "Terminal" sub menu to activate them first, like the "Open terminal" editor attribute by @Andx667
* Weather - ACE action on the Contact portable weather station to read precise weather data by @Andx667
* Tents - packed tent items for the Contact solar tents, dome tent and A-frame tent, set up with ACE 3D placement, and a pack up action on the placed tents by @Andx667
* Tents (BWA3) - the same for the BWA3 small tent, in a separate addon that is skipped when BWA3 is missing by @Andx667
* Animations - ACE actions for vanilla objects with animations that could only be changed in the editor: drawers of the portable cabinets, office tables and coffins, doors of the fridge, coffins and the decon, connector and medical tents, lids of laptops, computers, CBRN containers and buckets, the portable server, transfer switch, data terminal antenna and flag pole by @Andx667
* Animations (Solar) - ACE actions to rotate and tilt the Rugged solar panels, in a separate addon that is skipped when Advanced Equipment is loaded (Arma 3 2.22) by @Andx667
* Settings - CBA setting per addon (Antennas, Weather, Tents, Animations, Animations (Solar)) to disable its function by @Andx667
* Common - shared dependencies of the addons, the top position of a model and interaction points that depend on the size of the object (centre of small objects, chest height for medium ones, where the change is or next to the player for big ones). Actions are added to classes by name, so objects that define their own event handlers get them too by @Andx667

## [0.1.0] - 2026-09-14

### Added

* Mod - Initial release by @Andx667
