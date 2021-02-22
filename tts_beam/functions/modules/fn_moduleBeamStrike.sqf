/*
	Author: TheTimidShade

	Description:
		Module function for Beam Laser Strike module. Executed globally.

	Parameters:
		0: OBJECT - Placed module.
		1: ARRAY - Objects that can be affected by the module.
		2: BOOL - Whether module is activated (synced triggers are active)
		
	Returns:
		NONE
*/

params [
	["_module", objNull, [objNull]],
	["_units", [], [[]]],
	["_activated", true, [true]]
];

if (_activated) then {
	private _beamColour = parseSimpleArray (_module getVariable ["beamColour", [1,0.6,0.2]]);
	private _debrisColour = parseSimpleArray (_module getVariable ["debrisColour", [0.3, 0.27, 0.15]]);

	[_module, _beamColour, _debrisColour] spawn tts_beam_fnc_beam;
};
