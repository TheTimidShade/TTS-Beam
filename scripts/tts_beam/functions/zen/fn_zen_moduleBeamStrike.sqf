["TTS Beam Laser", "STR_tts_beam_moduleBeamStrike_title",
{
	params [["_position", [0,0,0], [[]], 3], ["_attachedObject", objNull, [objNull]]];

	[
		"STR_tts_beam_moduleBeamStrike_title", // title
		[ // array of controls for dialog
			["COMBO", ["STR_tts_beam_moduleBeamStrike_beamColour", "STR_tts_beam_moduleBeamStrike_beamColour_desc"],
				[ // control args
					["Default", "Red", "Orange", "Yellow", "Green", "Blue", "Cyan", "Pink", "Purple"], // return values
					["STR_tts_beam_default", "STR_tts_beam_moduleBeamStrike_beamColour_red", "STR_tts_beam_moduleBeamStrike_beamColour_orange", "STR_tts_beam_moduleBeamStrike_beamColour_yellow", "STR_tts_beam_moduleBeamStrike_beamColour_green", "STR_tts_beam_moduleBeamStrike_beamColour_blue", "STR_tts_beam_moduleBeamStrike_beamColour_cyan", "STR_tts_beam_moduleBeamStrike_beamColour_pink", "STR_tts_beam_moduleBeamStrike_beamColour_purple"], // labels
					0 // element 0 is default selected
				]
			],
			["COMBO", ["STR_tts_beam_moduleBeamStrike_debrisColour", "STR_tts_beam_moduleBeamStrike_debrisColour_desc"],
				[ // control args
					["Default", "Mud", "Snow", "Sand"], // return values
					["STR_tts_beam_default", "STR_tts_beam_moduleBeamStrike_debrisColour_mud", "STR_tts_beam_moduleBeamStrike_debrisColour_snow", "STR_tts_beam_moduleBeamStrike_debrisColour_sand"], // labels
					0 // element 0 is default selected
				]
			],
			["CHECKBOX", ["STR_tts_beam_moduleBeamStrike_disableBeamDamage", "STR_tts_beam_moduleBeamStrike_disableBeamDamage_desc"],
				[ // control args
					false // default state
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
				case "Blue": {_beamColour = [0,0,0.5];}; 		// blue
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

			private _isLethal = if (_dialogResult#2) then {false} else {true};

			private _beamTarget = "Land_HelipadEmpty_F" createVehicle _args#0;

			[_beamTarget, _beamColour, _debrisColour, _isLethal] remoteExec ["tts_beam_fnc_beam", 0, false]; // fire beam

			_beamTarget spawn {sleep 60; deleteVehicle _this;}; // wait and cleanup target pos
		}, {}, [_position] // args
	] call zen_dialog_fnc_create;
}, "scripts\tts_beam\icons\beam_strike.paa"] call zen_custom_modules_fnc_register
