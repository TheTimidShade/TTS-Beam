/*
	Author: TheTimidShade

	Description:
		Module function for Orbital Bombardment module. Should only be executed on the server.

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

if (!isServer) exitWith {};

if (_activated) then {
	private _beamColour = parseSimpleArray (_module getVariable ["BeamColour", [1,0.6,0.2]]);
	private _debrisColour = parseSimpleArray (_module getVariable ["DebrisColour", [0.3, 0.27, 0.15]]);
	private _isLethal = !(_module getVariable ["BeamDamage", false]);
	private _bombardmentRadius = _module getVariable ["BombardmentRadius", 200];
	private _strikeCount = _module getVariable ["StrikeCount", 5];
	private _shotDelay = _module getVariable ["ShotDelay", 5];
	private _rainbowMode = _module getVariable ["RainbowMode", false];

	[getPos _module, _beamColour, _debrisColour, _isLethal, _bombardmentRadius, _strikeCount, _shotDelay, _rainbowMode] spawn tts_beam_fnc_orbitalBombardment;
};
