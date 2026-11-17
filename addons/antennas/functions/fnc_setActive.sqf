#include "..\script_component.hpp"
/*
 * Author: Andx
 * Activates or deactivates an antenna object that has to be switched on first (Rugged
 * communications terminals, antenna masts). Does the same as the "Open terminal" editor
 * attribute, but animated. The animation sources go to the `avo_antennas_activePhase` config
 * property (100 when the class has none). Has to run where the object is local, see the
 * avo_antennas_setActive event. Raises avo_antennas_activated or avo_antennas_deactivated from
 * there once the state has changed (see isActive), and nothing when it was in that state already.
 *
 * Arguments:
 * 0: Antenna object <OBJECT>
 * 1: Activate <BOOL>
 * 2: Unit that switched it <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, true, player] call avo_antennas_fnc_setActive
 *
 * Public: No
 */

params ["_object", "_activate", ["_unit", objNull, [objNull]]];

private _wasActive = [_object] call FUNC(isActive);

private _cfg = configOf _object;
private _phase = [0, [100, getNumber (_cfg >> QGVAR(activePhase))] select isNumber (_cfg >> QGVAR(activePhase))] select _activate;

{
    _object animateSource [_x, _phase];
} forEach getArray (_cfg >> QGVAR(activeSources));

if (_wasActive isEqualTo _activate) exitWith {};

// The event is for a change that is complete: a terminal is active as soon as it starts to open and
// inactive once it is closed, which takes up to 15 seconds. A change that is interrupted by the
// opposite one never gets there and raises nothing, the timeout only ends the wait for it.
[{
    params ["_object", "_activate"];

    isNull _object || {([_object] call FUNC(isActive)) isEqualTo _activate}
}, {
    params ["_object", "_activate", "_unit"];

    if (isNull _object) exitWith {};

    [[QGVAR(deactivated), QGVAR(activated)] select _activate, [_object, _unit]] call CBA_fnc_globalEvent;
}, [_object, _activate, _unit], 60] call CBA_fnc_waitUntilAndExecute;
