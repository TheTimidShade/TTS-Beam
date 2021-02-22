/*
	Author: TheTimidShade

	Description:
		Handles post processing effects for beam impact.

	Parameters:
		0: OBJECT - Beam target object, used to determine if player is close enough to need ppeffects
		
	Returns:
		NONE
*/

params ["_target"];

if (!hasInterface) exitWith {}; // dedicated server & HC do not need to run post process effects
if (player distance _target > 1000) exitWith {}; // don't play ppeffects if player is far away

// blur
[] spawn {		
	cutText ["", "WHITE OUT", 1];
	titleCut ["", "WHITE IN", 1];
	"dynamicBlur" ppEffectEnable true;   
	"dynamicBlur" ppEffectAdjust [8];   
	"dynamicBlur" ppEffectCommit 0;     
	"dynamicBlur" ppEffectAdjust [0.0];  
	"dynamicBlur" ppEffectCommit 1.5;  
	sleep 1.5;
	"dynamicBlur" ppEffectEnable false; 
};

// shake
[] spawn {
	addCamShake [55, 5, 21];
	enableCamShake false;
	sleep 1;
	enableCamShake true;
	addCamShake [15, 5, 21];
	enableCamShake false;
};