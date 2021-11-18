/*
	Author: TheTimidShade

	Description:
		For when you need more laser.

	Parameters:
		0: OBJECT - Centre of bombardment position.
		1: ARRAY (OPTIONAL) - Colour of the beam in format [r,g,b].
		2: ARRAY (OPTIONAL) - Colour of dust created on impact in format [r,g,b].
		3: BOOL (OPTIONAL) - False to disable damage and destruction of beam.
		4: NUMBER (OPTIONAL) - Maximum distance from module centre lasers can land
		5: NUMBER (OPTIONAL) - Number of lasers to fire
		6: NUMBER (OPTIONAL) - Delay in seconds between beam strikes
		7: BOOL (OPTIONAL) - If true, uses a different colour for each laser fired
		
	Returns:
		NONE
*/

params [
	["_centrePos", [0,0], [[]], [2,3]],
	["_beamColour", [1,0.6,0.2], [[]]],
	["_debrisColour", [0.3, 0.27, 0.15], [[]]],
	["_isLethal", true, [true]],
	["_radius", 200, [0]],
	["_strikeCount", 5, [0]],
	["_shotDelay", 5, [0]],
	["_rainbow", false, [true]]
];

if (!isServer) exitWith {};

if (count _beamColour < 3) then {_beamColour = [1,0.6,0.2]; systemChat "Invalid colour given for beam, default used instead";};
if (count _debrisColour < 3) then {_debrisColour = [0.3, 0.27, 0.15]; systemChat "Invalid colour given for beam debris, default used instead";};
if (_radius < 0) then {_radius = 0;};
if (_strikeCount <= 0) then {_strikeCount = 1;};
if (_shotDelay < 0.1) then {_shotDelay = 0.1};

private _rainbowColours = [
	[0.5,0,0],
	[0.3,0.15,0.1],
	[1,0.9,0],
	[0,0.5,0],
	[0,0,0.5],
	[0,0.5,0.5], 
	[1,0,0.6],
	[0.5,0,1]
];
private _rainbowIndex = 0;

private ["_colour", "_rad", "_dir", "_pos", "_target"];

for "_i" from 1 to _strikeCount do
{
	if (missionNamespace getVariable ["tts_beam_stopOrbitalBombardment", false]) then {break;};

	_colour = [];
	if (_rainbow) then {
		_colour = _rainbowColours#_rainbowIndex;
		_rainbowIndex = (_rainbowIndex + 1) % 8;
	}
	else {_colour = _beamColour};

	_dir = random 360;
	_rad = random _radius;
	_pos = (_centrePos getPos [_rad, _dir]);
	
	_target = "Land_HelipadEmpty_F" createVehicle [0,0,0];
	_target setPos _pos;
	
	_target spawn {sleep 15; deleteVehicle _this;};

	[_target, _colour, _debrisColour, _isLethal] remoteExec ["tts_beam_fnc_beam", 0, false];

	sleep _shotDelay;
};
tts_beam_stopOrbitalBombardment = false; publicVariable "tts_beam_stopOrbitalBombardment";