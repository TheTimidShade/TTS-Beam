["TTS Beam Laser", "STR_tts_beam_moduleOrbitalBombardment_title",
{
    params [["_position", [0,0,0], [[]], 3], ["_attachedObject", objNull, [objNull]]];

    [
        "STR_tts_beam_moduleOrbitalBombardment_title", // title
        [ // array of controls for dialog
            ["COMBO", ["STR_tts_beam_moduleBeamStrike_beamColour", "STR_tts_beam_moduleBeamStrike_beamColour_desc"],
                [ // control args
                    ["Custom", "Red", "Orange", "Yellow", "Green", "Blue", "Cyan", "Pink", "Purple"], // return values
                    ["STR_tts_beam_moduleBeamStrike_beamColour_custom", "STR_tts_beam_moduleBeamStrike_beamColour_red", "STR_tts_beam_moduleBeamStrike_beamColour_orange", "STR_tts_beam_moduleBeamStrike_beamColour_yellow", "STR_tts_beam_moduleBeamStrike_beamColour_green", "STR_tts_beam_moduleBeamStrike_beamColour_blue", "STR_tts_beam_moduleBeamStrike_beamColour_cyan", "STR_tts_beam_moduleBeamStrike_beamColour_pink", "STR_tts_beam_moduleBeamStrike_beamColour_purple"], // labels
                    0 // element 0 is default selected
                ]
            ],
            ["COLOR", ["STR_tts_beam_moduleBeamStrike_customBeamColour", "STR_tts_beam_moduleBeamStrike_customBeamColour_desc"],
                [1,0.6,0.2]
            ],
            ["COMBO", ["STR_tts_beam_moduleBeamStrike_debrisColour", "STR_tts_beam_moduleBeamStrike_debrisColour_desc"],
                [ // control args
                    ["Custom", "Mud", "Snow", "Sand"], // return values
                    ["STR_tts_beam_moduleBeamStrike_beamColour_custom", "STR_tts_beam_moduleBeamStrike_debrisColour_mud", "STR_tts_beam_moduleBeamStrike_debrisColour_snow", "STR_tts_beam_moduleBeamStrike_debrisColour_sand"], // labels
                    0 // element 0 is default selected
                ]
            ],
            ["COLOR", ["STR_tts_beam_moduleBeamStrike_customDebrisColour", "STR_tts_beam_moduleBeamStrike_customDebrisColour_desc"],
                [0.3,0.27,0.15]
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
            ],
            ["CHECKBOX", ["STR_tts_beam_moduleOrbitalBombardment_stopBombardment", "STR_tts_beam_moduleOrbitalBombardment_stopBombardment_desc"],
                [ // control args
                    false // default state
                ],
                true
            ]
        ],
        { // code run on dialog closed (only run if OK is clicked)
            params ["_dialogResult", "_args"];
            _dialogResult params ["_beamColourPreset", "_customBeamColour", "_debrisColourPreset", "_customDebrisColour", "_isLethal", "_radius", "_strikeCount", "_shotDelay", "_rainbow", "_stopBombardment"];
            _args params ["_position"];

            if (_stopBombardment) exitWith {
                tts_beam_stopOrbitalBombardment = true;
                publicVariable "tts_beam_stopOrbitalBombardment";
            };

            _radius = parseNumber _radius;
            _strikeCount = parseNumber _strikeCount;
            _shotDelay = parseNumber _shotDelay;

            private _beamColour = [];
            if (_beamColourPreset == "Custom") then {
                _beamColour = _customBeamColour;
            } else {
                _beamColour = _beamColourPreset call tts_beam_fnc_colourFromString;
            };
            
            private _debrisColour = []; 
            if (_debrisColourPreset == "Custom") then {
                _debrisColour = _customDebrisColour;
            } else {
                _debrisColour = _debrisColourPreset call tts_beam_fnc_colourFromString;
            };

            [_position, _beamColour, _debrisColour, _isLethal, _radius, _strikeCount, _shotDelay, _rainbow] remoteExec ["tts_beam_fnc_orbitalBombardment", 2, false];

        }, {}, [_position] // args
    ] call zen_dialog_fnc_create;
}, "\tts_beam\icons\beam_strike.paa"] call zen_custom_modules_fnc_register