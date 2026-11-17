class CfgAcreComponents {
    class ACRE_243CM_VHF_TNC;

    // Inherit connector type and gain pattern from ACRE's ground spike antenna.
    // `height` is 0 because the antenna position comes from acre_antennaPosFnc
    // (the real tip of the model), see functions\fnc_antennaPos.sqf.
    class GVAR(satDish): ACRE_243CM_VHF_TNC {
        name = CSTRING(component_satDish);
        shortName = CSTRING(component_satDish);
        height = 0;
        compatibleRadios[] = {"ACRE_PRC117F", "ACRE_PRC152"};
    };

    class GVAR(omni): ACRE_243CM_VHF_TNC {
        name = CSTRING(component_omni);
        shortName = CSTRING(component_omniShort);
        height = 0;
        compatibleRadios[] = {"ACRE_PRC117F", "ACRE_PRC152"};
    };
};
