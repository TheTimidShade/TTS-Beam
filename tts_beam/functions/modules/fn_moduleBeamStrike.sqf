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

if (!isServer) exitWith {};

if (_activated) then {
    private _beamPreset = _module getVariable ["BeamColourPreset", "Custom"];
    private _beamColour = parseSimpleArray (_module getVariable ["BeamColour", "[1,0.6,0.2]"]);
    private _debrisPreset = _module getVariable ["DebrisColourPreset", "Custom"];
    private _debrisColour = parseSimpleArray (_module getVariable ["DebrisColour", "[0.3, 0.27, 0.15]"]);
    private _isLethal = !(_module getVariable ["BeamDamage", false]);

    if (_beamPreset != "Custom") then {
        _beamColour = _beamPreset call tts_beam_fnc_colourFromString;
    };

    if (_debrisPreset != "Custom") then {
        _debrisColour = _debrisPreset call tts_beam_fnc_colourFromString;
    };

    [_module, _beamColour, _debrisColour, _isLethal] remoteExec ["tts_beam_fnc_beam", 0, false];
};
