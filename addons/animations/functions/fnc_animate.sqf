#include "..\script_component.hpp"
/*
 * Author: Andx
 * Sets animation sources of an object to the given phases. Has to run where the object
 * is local, see the avo_animations_animate event. Raises the avo_animations_changed event
 * from there once every source has reached its phase.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Sources and their phases <ARRAY>
 *   0: Animation source <STRING>
 *   1: Phase <NUMBER>
 *   2: Instant, instead of the time set in the config of the source <BOOL> (default: false)
 * 2: Control, the id the event is raised with, no event when empty <STRING> (default: "")
 * 3: Unit that used the control <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, [["Drawer_1_move_source", 1]], "drawer1", player] call avo_animations_fnc_animate
 *
 * Public: No
 */

params ["_object", "_sources", ["_control", "", [""]], ["_unit", objNull, [objNull]]];

{
    _x params ["_source", "_phase", ["_instant", false]];
    _object animateSource [_source, _phase, _instant];
} forEach _sources;

if (_control == "") exitWith {};

// The event is for a change that is complete. A change that is interrupted by another one never
// gets there and raises nothing, the other one raises its own event. The animations take a few
// seconds at most, the timeout only ends the wait for one that was interrupted.
private _changes = _sources apply {[_x select 0, _x select 1]};

[{
    params ["_object", "_changes"];

    isNull _object || {_changes findIf {abs ((_object animationSourcePhase (_x select 0)) - (_x select 1)) > 0.01} == -1}
}, {
    params ["_object", "_changes", "_control", "_unit"];

    if (isNull _object) exitWith {};

    [QGVAR(changed), [_object, _control, _changes, _unit]] call CBA_fnc_globalEvent;
}, [_object, _changes, _control, _unit], 60] call CBA_fnc_waitUntilAndExecute;
