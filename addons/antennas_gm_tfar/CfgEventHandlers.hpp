// The antenna mast of the GM command shelters registers as a TFAR radio tower while it is extended,
// like the Rugged communications terminals of avo_antennas_tfar: these handlers cover a mast that is
// already extended when the shelter is created or a client joins, the avo_antennas_activated and
// deactivated events of avo_antennas_tfar cover extending and retracting it later.
class Extended_InitPost_EventHandlers {
    class gm_shelteraceI_command_base {
        class ADDON {
            clientInit = QUOTE([_this select 0] call EFUNC(antennas_tfar,initAntenna));
        };
    };
};

class Extended_Deleted_EventHandlers {
    class gm_shelteraceI_command_base {
        ADDON = QUOTE([_this select 0] call EFUNC(antennas_tfar,deregisterTower));
    };
};
