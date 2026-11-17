// The holder of the packed tent, it lists the item in the Eden and Zeus object lists, see the
// holders of the tents addon
class CfgVehicles {
    class Item_Base_F;

    class DOUBLES(Item,GVAR(smallFleck)): Item_Base_F {
        author = AUTHOR;
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(smallFleck);
        vehicleClass = "Items";
        model = "\A3\Weapons_F\DummyItemHorizontal.p3d";

        class TransportItems {
            MACRO_ADDITEM(GVAR(smallFleck),1);
        };
    };
};
