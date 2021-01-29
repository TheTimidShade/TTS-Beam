/*
	Author: TheTimidShade

	Description:
		Creates particles for main laser beam. Executed internally from tts_beam_fnc_beam.

	Parameters:
		0: OBJECT - Beam emitter object passed from fnc_beam.
		1: ARRAY - Colour of laser passed from fnc_beam.
		2: ARRAY - Position of target object passed from fnc_beam.
		
	Returns:
		NONE
*/

params ["_beamEmitter", "_col", "_targetPos"];

_ray = "#particlesource" createVehicleLocal (getpos _beamEmitter);
_ray setParticleCircle [0, [0, 0, -3]];
_ray setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_ray setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0], 13, 10, 7.6, 0, [15,11,7,3], [[_col#0, _col#1, _col#2, 1]], [0.08], 1, 0, "", "", _ray];
_ray setDropInterval 0.0025;
_ray attachTo [_beamEmitter, [0,0,0]];

// lights
_lights = "#particlesource" createVehicleLocal (getpos _beamEmitter);
_lights setParticleCircle [0, [0, 0, -3]];
_lights setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_lights setParticleParams [["\A3\data_f\VolumeLight", 1, 0, 1], "", "SpaceObject", 1, 3, [0, 0, 0], [0, 0, 0], 0, 10, 7.6, 0, [8,6,3,1], [[_col#0, _col#1, _col#2, 1]], [0.08], 1, 0, "", "", _lights];
_lights setDropInterval 0.002;
_lights attachTo [_beamEmitter, [0,0,0]];

// lightpoint
_lightp = "#lightpoint" createVehicleLocal (getpos _beamEmitter);
_lightp setLightBrightness 80;
_lightp setLightAmbient _col;
_lightp setLightColor _col;
_lightp lightAttachObject [_beamEmitter, [20,20,200]];

sleep 1; // sleep to let beamEmitter accelerate first
waitUntil {sleep 0.01; vectorMagnitude (velocity _beamEmitter) < 20 || _beamEmitter distance _targetPos < 5 || (getPosATL _beamEmitter)#2 < 5};

sleep 0.1; // small sleep to let dust cloud get created to hide deletion of beam

{deleteVehicle _x} forEach [_ray, _lights, _lightp];