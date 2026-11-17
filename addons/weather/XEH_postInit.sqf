#include "script_component.hpp"

if (!hasInterface) exitWith {};

// The readout uses ACE weather functions that are not public API, so bail out with a log line rather
// than throwing errors from the interaction menu if ACE ever renames them.
private _aceFunctions = [
    QACEFUNC(weather,calculateWindSpeed),
    QACEFUNC(weather,calculateTemperatureAtHeight),
    QACEFUNC(weather,calculateBarometricPressure),
    QACEFUNC(weather,calculateDewPoint),
    QACEFUNC(weather,calculateWindChill),
    QACEFUNC(weather,calculateHeatIndex)
];
private _missing = _aceFunctions select {isNil _x};
if (_missing isNotEqualTo []) exitWith {
    WARNING_1("ACE weather functions not found (%1), interactions disabled",_missing);
};

private _readData = [
    QGVAR(readData),
    LLSTRING(readData),
    QPATHTOF(data\readData_ca.paa),
    {
        params ["_target", "_player"];
        [_target] call FUNC(readData);
        [QGVAR(read), [_target, _player, false]] call CBA_fnc_globalEvent;
    },
    {GVAR(enabled)},
    {},
    [],
    {[_target] call EFUNC(common,interactionPosition)},
    4
] call ACEFUNC(interact_menu,createAction);

// Base of the white, olive and sand variants
["Land_PortableWeatherStation_01_base_F", [], _readData] call EFUNC(common,addClassActions);

// The windsock only shows the wind
private _readWind = [
    QGVAR(readWind),
    LLSTRING(readWind),
    QPATHTOF(data\readData_ca.paa),
    {
        params ["_target", "_player"];
        [_target, true] call FUNC(readData);
        [QGVAR(read), [_target, _player, true]] call CBA_fnc_globalEvent;
    },
    {GVAR(enabled)},
    {},
    [],
    {[_target] call EFUNC(common,interactionPosition)},
    4
] call ACEFUNC(interact_menu,createAction);

["Windsock_01_F", [], _readWind] call EFUNC(common,addClassActions);
