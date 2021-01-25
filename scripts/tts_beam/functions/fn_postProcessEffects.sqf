/*
	Author: TheTimidShade

	Description:
		Handles post processing effects for beam impact.

	Parameters:
		NONE
		
	Returns:
		NONE
*/

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