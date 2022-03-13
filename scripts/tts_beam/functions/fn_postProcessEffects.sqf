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
if (!isNull (findDisplay 60492) || !isNull (findDisplay 312)) exitWith {}; // if spectator/zeus interface are open don't show effects

// camera shake
if ((positionCameraToWorld [0,0,0]) distance2D _target < 2000) then {
    private _distanceCoef = 1 - ((positionCameraToWorld [0,0,0]) distance2D _target)/2000;

    enableCamShake true;
    addCamShake [15 * _distanceCoef, 5, 12];
};

// flash
if (!(missionNamespace getVariable ["tts_beam_disableImpactFlash", false]) && (positionCameraToWorld [0,0,0]) distance2D _target < 3000) then {
    private _cameraDirection = getCameraViewDirection player;
    private _dirToLaser = (positionCameraToWorld [0,0,0]) vectorFromTo (position _target);
    
    private _angleBetween = acos (_cameraDirection vectorDotProduct _dirToLaser);

    // only show flash effect if player is looking towards the laser impact
    if (_angleBetween < 80) then {
        cutText ["", "WHITE OUT", 1];
        titleCut ["", "WHITE IN", 1];
    };
};

// blur
"dynamicBlur" ppEffectEnable true;   
"dynamicBlur" ppEffectAdjust [8];   
"dynamicBlur" ppEffectCommit 0;     
"dynamicBlur" ppEffectAdjust [0.0];  
"dynamicBlur" ppEffectCommit 1.5;  
sleep 1.5;
"dynamicBlur" ppEffectEnable false; 
