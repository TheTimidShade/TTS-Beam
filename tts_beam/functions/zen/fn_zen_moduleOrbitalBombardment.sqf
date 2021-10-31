if (isClass (configFile >> "CfgPatches" >> "zen_main")) then {
	["TTS Beam Laser", "STR_tts_beam_moduleOrbitalBombardment_title",
	{
		params [["_position", [0,0,0], [[]], 3], ["_attachedObject", objNull, [objNull]]];

		[
			"STR_tts_beam_moduleOrbitalBombardment_title", // title
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
				],
				["EDIT", ["STR_tts_beam_moduleOrbitalBombardment_radius", "STR_tts_beam_moduleOrbitalBombardment_radius_desc"],
					[ // control args
						"200", // default text
						{}, // sanitise function
						1 // edit box height (only for multi line)
					],
					false // force default
				],
				["EDIT", ["STR_tts_beam_moduleOrbitalBombardment_strikeCount", "STR_tts_beam_moduleOrbitalBombardment_strikeCount_desc"],
					[ // control args
						"5", // default text
						{}, // sanitise function
						1 // edit box height (only for multi line)
					],
					false // force default
				],
				["EDIT", ["STR_tts_beam_moduleOrbitalBombardment_shotDelay", "STR_tts_beam_moduleOrbitalBombardment_shotDelay_desc"],
					[ // control args
						"3", // default text
						{}, // sanitise function
						1 // edit box height (only for multi line)
					],
					false // force default
				],
				["CHECKBOX", ["STR_tts_beam_moduleOrbitalBombardment_rainbow", ""],
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

				private _isLethal = !(_dialogResult#2);

				private _radius = parseNumber(_dialogResult#3);
				private _strikeCount = parseNumber(_dialogResult#4);
				private _shotDelay = parseNumber(_dialogResult#5);
				private _rainbow = _dialogResult#6;

				[_args#0, _beamColour, _debrisColour, _isLethal, _radius, _strikeCount, _shotDelay, _rainbow] remoteExec ["tts_beam_fnc_orbitalBombardment", 2, false];

			}, {}, [_position] // args
		] call zen_dialog_fnc_create;
	}, "\tts_beam\icons\beam_strike.paa"] call zen_custom_modules_fnc_register
};