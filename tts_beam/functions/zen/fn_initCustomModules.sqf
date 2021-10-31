/*
	Author: TheTimidShade

	Description:
		Initialises custom modules for ZEN if enabled

	Parameters:
		NONE
		
	Returns:
		NONE
*/

if (isClass(configFile >> "CfgPatches" >> "tts_effects_aio") && {missionNamespace getVariable ["tts_effects_aio_disable_beam", false]}) exitWith {};

[] spawn {
	
	[] call tts_beam_fnc_zen_moduleBeamStrike;
	[] call tts_beam_fnc_zen_moduleOrbitalBombardment;

};

