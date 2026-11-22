#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        author = AUTHOR;
        url = "https://github.com/Andx667/advanced-vanilla-objects";
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "avo_antennas_gm",
            "avo_antennas_tfar",
            "gm_objects_container_shelterace_ge_army_shelterace"
        };
        // Skip this addon instead of erroring when Global Mobilization or TFAR is missing.
        // avo_antennas_gm and avo_antennas_tfar are requirements too, so this is skipped as well
        // when ACE, Contact content or (through avo_antennas_tfar) TFAR itself is missing.
        skipWhenMissingDependencies = 1;
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
