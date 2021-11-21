/*
    Author: TheTimidShade

    Description:
        Initialises custom modules for ZEN if enabled

    Parameters:
        NONE
        
    Returns:
        NONE
*/

if (!isClass (configFile >> "CfgPatches" >> "zen_main")) exitWith {};

[] call tts_beam_fnc_zen_moduleBeamStrike;
[] call tts_beam_fnc_zen_moduleOrbitalBombardment;
