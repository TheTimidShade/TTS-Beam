["TTS Beam Laser", "STR_tts_beam_moduleBeamStrike_title",
{
    params [["_position", [0,0,0], [[]], 3], ["_attachedObject", objNull, [objNull]]];

    [
        "STR_tts_beam_moduleBeamStrike_title", // title
        [ // array of controls for dialog
            ["COMBO", ["STR_tts_beam_moduleBeamStrike_beamColour", "STR_tts_beam_moduleBeamStrike_beamColour_desc"],
                [ // control args
                    ["Custom", "Red", "Orange", "Yellow", "Green", "Blue", "Cyan", "Pink", "Purple"], // return values
                    ["STR_tts_beam_moduleBeamStrike_beamColour_custom", "STR_tts_beam_moduleBeamStrike_beamColour_red", "STR_tts_beam_moduleBeamStrike_beamColour_orange", "STR_tts_beam_moduleBeamStrike_beamColour_yellow", "STR_tts_beam_moduleBeamStrike_beamColour_green", "STR_tts_beam_moduleBeamStrike_beamColour_blue", "STR_tts_beam_moduleBeamStrike_beamColour_cyan", "STR_tts_beam_moduleBeamStrike_beamColour_pink", "STR_tts_beam_moduleBeamStrike_beamColour_purple"], // labels
                    0 // element 0 is default selected
                ],
                false
            ],
            ["COLOR", ["STR_tts_beam_moduleBeamStrike_customBeamColour", "STR_tts_beam_moduleBeamStrike_customBeamColour_desc"],
                [1,0.6,0.2],
                false
            ],
            ["COMBO", ["STR_tts_beam_moduleBeamStrike_debrisColour", "STR_tts_beam_moduleBeamStrike_debrisColour_desc"],
                [ // control args
                    ["Custom", "Mud", "Snow", "Sand"], // return values
                    ["STR_tts_beam_moduleBeamStrike_beamColour_custom", "STR_tts_beam_moduleBeamStrike_debrisColour_mud", "STR_tts_beam_moduleBeamStrike_debrisColour_snow", "STR_tts_beam_moduleBeamStrike_debrisColour_sand"], // labels
                    0 // element 0 is default selected
                ],
                false
            ],
            ["COLOR", ["STR_tts_beam_moduleBeamStrike_customDebrisColour", "STR_tts_beam_moduleBeamStrike_customDebrisColour_desc"],
                [0.3,0.27,0.15],
                false
            ],
            ["CHECKBOX", ["STR_tts_beam_moduleBeamStrike_disableBeamDamage", "STR_tts_beam_moduleBeamStrike_disableBeamDamage_desc"],
                [ // control args
                    false // default state
                ],
                false
            ],
            ["SLIDER:RADIUS", ["STR_tts_beam_moduleBeamStrike_lethalRadius", "STR_tts_beam_moduleBeamStrike_lethalRadius_desc"],
                [ // control args
                    1, // min
                    2000, // max
                    200, // default
                    0, // decimals
                    _position, // radius center position
                    [1, 0, 0, 0.5] // radius colour
                ],
                false
            ],
            ["SLIDER:RADIUS", ["STR_tts_beam_moduleBeamStrike_damageRadius", "STR_tts_beam_moduleBeamStrike_damageRadius_desc"],
                [ // control args
                    1, // min
                    2000, // max
                    400, // default
                    0, // decimals
                    _position, // radius center position
                    [0, 1, 0, 0.5] // radius colour
                ],
                false
            ]
        ],
        { // code run on dialog closed (only run if OK is clicked)
            params ["_dialogResult", "_args"];
            _dialogResult params ["_beamColourPreset", "_customBeamColour", "_debrisColourPreset", "_customDebrisColour", "_disableDamage", "_lethalRadius", "_damageRadius"];
            _args params ["_position"];

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

            private _beamTarget = "Land_HelipadEmpty_F" createVehicle _position;

            [_beamTarget, _beamColour, _debrisColour, !_disableDamage, _lethalRadius, _damageRadius] remoteExec ["tts_beam_fnc_beam", 0, false]; // fire beam

            _beamTarget spawn {sleep 60; deleteVehicle _this;}; // wait and cleanup target pos
        }, {}, [_position] // args
    ] call zen_dialog_fnc_create;
}, "\tts_beam\icons\beam_strike.paa"] call zen_custom_modules_fnc_register;
