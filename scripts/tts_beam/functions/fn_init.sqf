/*
    Author: TheTimidShade

    Description:
        Initialises TTS Beam Laser. Terminates if TTS Effects AIO is enabled so that the main mod can manage initialisation.

    Parameters:
        NONE
        
    Returns:
        NONE
*/

tts_beam_aceEnabled = isClass(configFile >> "CfgPatches" >> "ace_medical");

if (isClass(configFile >> "CfgPatches" >> "tts_effects_aio")) exitWith {};

[] call tts_beam_fnc_initCustomModules;