#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        author = AUTHOR;
        url = "https://github.com/Andx667/advanced-vanilla-objects";
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "avo_common",
            "A3_Props_F_Enoch_Military_Camps",
            "A3_Props_F_Enoch_Military_Equipment",
            "A3_Props_F_Decade_Objectives"
        };
        // Skip this addon instead of erroring when ACE or Contact content is missing. This addon
        // is comms-agnostic (no ACRE or TFAR dependency of its own), see avo_antennas_acre and
        // avo_antennas_tfar.
        skipWhenMissingDependencies = 1;
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
