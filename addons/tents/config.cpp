#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        author = AUTHOR;
        url = "https://github.com/Andx667/advanced-vanilla-objects";
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "avo_common",
            "ace_interaction",
            "A3_Weapons_F",
            "A3_Props_F_Enoch_Military_Camps",
            "A3_Structures_F_Civ_Camping"
        };
        // Skip this addon instead of erroring when ACE or Contact content is missing
        skipWhenMissingDependencies = 1;
        // The holders of the packed tents, Zeus lists them by the addon that has them
        units[] = {
            QUOTE(DOUBLES(Item,GVAR(solarOlive))),
            QUOTE(DOUBLES(Item,GVAR(solarSand))),
            QUOTE(DOUBLES(Item,GVAR(solarRedWhite))),
            QUOTE(DOUBLES(Item,GVAR(solarBlueWhite))),
            QUOTE(DOUBLES(Item,GVAR(dome))),
            QUOTE(DOUBLES(Item,GVAR(a)))
        };
        weapons[] = {
            QGVAR(solarOlive),
            QGVAR(solarSand),
            QGVAR(solarRedWhite),
            QGVAR(solarBlueWhite),
            QGVAR(dome),
            QGVAR(a)
        };
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
