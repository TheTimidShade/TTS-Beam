/*
	Author: TheTimidShade

	Description:
		Initialises custom modules for Achilles & ZEN if enabled

	Parameters:
		NONE
		
	Returns:
		NONE
*/

sleep 1;
if (!isNull (getAssignedCuratorLogic player) && {isClass (configFile >> "CfgPatches" >> "achilles_modules_f_achilles")}) then {
	["Fire Support", "Beam Laser Strike", 
	{
		params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

		private _dialogResult = [
			"Beam Laser Strike",
			[
				["Beam Colour", ["Default", "Red", "Orange", "Yellow", "Green", "Cyan", "Pink", "Purple"], 0],
				["Debris Colour", ["Default", "Mud", "Snow", "Sand"], 0]
			]
		] call Ares_fnc_showChooseDialog;

		if (_dialogResult isEqualTo []) exitWith{}; // if dialog was closed exit

		private _beamColour = [1,0.6,0.2];
		switch (_dialogResult#0) do { // select beam colour
			case 0: {_beamColour = [1,0.6,0.2];}; 		// default
			case 1: {_beamColour = [0.5,0,0];}; 		// red
			case 2: {_beamColour = [0.3,0.15,0.1];}; 	// orange
			case 3: {_beamColour = [1,0.9,0];}; 		// yellow
			case 4: {_beamColour = [0,0.5,0];};			// green
			case 5: {_beamColour = [0,0.5,0.5];}; 		// cyan
			case 6: {_beamColour = [1,0,0.6];}; 		// pink
			case 7: {_beamColour = [0.5,0,1];}; 		// purple
		};
		
		private _debrisColour = [0.3, 0.27, 0.15]; 
		switch (_dialogResult#1) do { // select debris colour
			case 0: {_debrisColour = [0.3, 0.27, 0.15];}; 	// default
			case 1: {_debrisColour = [0.15, 0.11, 0.08];}; 	// mud
			case 2: {_debrisColour = [1, 1, 1];}; 			// snow
			case 3: {_debrisColour = [1, 0.8, 0.3];}; 		// sand
		};

		private _beamTarget = "Land_HelipadEmpty_F" createVehicle _position;

		[_beamTarget, _beamColour, _debrisColour] remoteExec ["tts_beam_fnc_beam", 0, false]; // fire beam

		_beamTarget spawn {sleep 60; deleteVehicle _this;}; // wait and cleanup target pos

	}] call Ares_fnc_RegisterCustomModule;
};

if (!isNull (getAssignedCuratorLogic player) && {isClass (configFile >> "CfgPatches" >> "zen_main")}) then {
	["Fire Support", "Beam Laser Strike",
	{
		params [["_position", [0,0,0], [[]], 3], ["_attachedObject", objNull, [objNull]]];

		[
			"Beam Laser Strike", // title
		 	[ // array of controls for dialog
				["COMBO", ["Beam Colour", "Colour of laser particles and glow"],
					[ // control args
						["Default", "Red", "Orange", "Yellow", "Green", "Cyan", "Pink", "Purple"], // return values
						["Default", "Red", "Orange", "Yellow", "Green", "Cyan", "Pink", "Purple"], // labels
						0 // element 0 is default selected
					]
				],
				["COMBO", ["Debris Colour", "Colour of dust kicked up by explosion"],
					[ // control args
						["Default", "Mud", "Snow", "Sand"], // return values
						["Default", "Mud", "Snow", "Sand"], // labels
						0 // element 0 is default selected
					]
				]
			],
			{ // code run on dialog closed (only run if OK is clicked)
				params ["_dialogResult", "_args"];
				
				private _beamColour = _dialogResult#0;
				switch (_dialogResult#0) do { // select beam colour
					case "Default": {_beamColour = [1,0.6,0.2];}; 	// default
					case "Red": {_beamColour = [0.5,0,0];}; 		// red
					case "Orange": {_beamColour = [0.3,0.15,0.1];}; // orange
					case "Yellow": {_beamColour = [1,0.9,0];}; 		// yellow
					case "Green": {_beamColour = [0,0.5,0];};		// green
					case "Cyan": {_beamColour = [0,0.5,0.5];}; 		// cyan
					case "Pink": {_beamColour = [1,0,0.6];}; 		// pink
					case "Purple": {_beamColour = [0.5,0,1];}; 		// purple
				};
				
				private _debrisColour = _dialogResult#1; 
				switch (_dialogResult#1) do { // select debris colour
					case "Default": {_debrisColour = [0.3, 0.27, 0.15];}; 	// default
					case "Mud": {_debrisColour = [0.15, 0.11, 0.08];}; 		// mud
					case "Snow": {_debrisColour = [1, 1, 1];}; 				// snow
					case "Sand": {_debrisColour = [1, 0.8, 0.3];}; 			// sand
				};

				private _beamTarget = "Land_HelipadEmpty_F" createVehicle _args#0;

				[_beamTarget, _beamColour, _debrisColour] remoteExec ["tts_beam_fnc_beam", 0, false]; // fire beam

				_beamTarget spawn {sleep 60; deleteVehicle _this;}; // wait and cleanup target pos
			}, {}, [_position] // args
		] call zen_dialog_fnc_create;
	}] call zen_custom_modules_fnc_register
};

