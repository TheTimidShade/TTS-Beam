/*
    Author: TheTimidShade

    Description:
        Handles effects on individual objects within the lethal radius of the beam strike explosion

    Parameters:
        0: OBJECT - Object being destroyed by the beam
        
    Returns:
        NONE
*/

if (!isServer) exitWith {};

params [
    ["_target", objNull, [objNull]]
];

if (isNull _target) exitWith {};

// disintegrate men
if (_target isKindOf "CAManBase") then {
	_target setDamage 1;
	
	if (missionNamespace getVariable ["tts_beam_vaporiseBodies", true]) then {
		// hide the body
		_target hideObjectGlobal true;

		// create a skeleton object
		private _skeleton = createVehicle ["Land_HumanSkeleton_F", (getPosATL _target), [], 0, "CAN_COLLIDE"];
		_skeleton setDir (random 360);
		_skeleton setPosATL (getPosATL _skeleton);

		// create scorch mark
		private _scorch = createVehicle ["Land_Decal_ScorchMark_01_small_F", (getPosATL _target), [], 0, "CAN_COLLIDE"];
		_scorch setDir (random 360);
		_scorch setPosATL (getPosATL _scorch);

		["skeleton", position _skeleton, 30 + random 30] remoteExec ["tts_beam_fnc_smoulder", 0, false];

		// if cleanup is enabled, start the cleanup timer
		if (missionNamespace getVariable ["tts_beam_cleanupSkeletons", false]) then {
			[_skeleton, _scorch] spawn {
				sleep (missionNamespace getVariable ["tts_beam_cleanupSkeletonsDelay", 300]);
				{deleteVehicle _x;} forEach _this;
			};
		};
	};
};

// have a chance to burn buildings/static objects
if (_target isKindOf "Static") then {
	_target setDamage [1, false];
	
	// static objects have a chance to burn when destroyed
	if (missionNamespace getVariable ["tts_beam_structureFiresEnabled", true] && {random 1 < missionNamespace getVariable ["tts_beam_structureFireChance", 0.03]}) then {
		private _size = sizeOf typeOf _target;
		private _minDuration = missionNamespace getVariable ["tts_beam_structureFireMinDuration", 60];
		private _maxDuration = missionNamespace getVariable ["tts_beam_structureFireMaxDuration", 120];
		private _duration = _minDuration + (random (_maxDuration - _minDuration));
		
		private _fireType = "small";
		
		if (_size < 5) then {
			_fireType = "small";
		} else { if (_size < 10) then {
			_fireType = "medium";
		} else { 
			_fireType = "large";
		};};

		// slight displacement of fire position based on object size
		private _firePos = (position _target) getPos [random (_size/2), random 360];

		[_fireType, _firePos, _duration] remoteExec ["tts_beam_fnc_smoulder", 0, false];
	};
};

// if the object is neither a man or a building just destroy it
if (!(_target isKindOf "CAManBase" || _target isKindOf "Static")) then {
	_target setDamage 1;
};