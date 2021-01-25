/*
	Author: TheTimidShade

	Description:
		Creates dust cloud particles and rock debris for beam impact.

	Parameters:
		0: OBJECT - The object the beam is created above.
		1: ARRAY - Colour of dust/rock debris created on impact in format [r,g,b].

	Returns:
		NONE
*/

if (!hasInterface) exitWith {}; // dedicated server & HC should not run particles

params ["_impactEmitter", "_col"];

// dust wave
_wave = "#particlesource" createVehicleLocal getPos _impactEmitter;
_wave setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48], "", "Billboard", 1, 7, [0, 0, 0],[0, 0, 0], 0, 1.5, 1, 0, [50, 100], [[_col#0, _col#1, _col#2, 0.5], [_col#0, _col#1, _col#2, 0.5], [_col#0, _col#1, _col#2, 0.3], [_col#0, _col#1, _col#2, 0]], [1,0.5], 0.1, 1, "", "", _impactEmitter];
_wave setParticleRandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
_wave setParticleCircle [50, [-80, -80, 2.5]];
_wave setDropInterval 0.001;

// dust cloud
_cloud = "#particlesource" createVehicleLocal getPos _impactEmitter;
_cloud setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48], "", "Billboard", 1, 18, [0, 0, 0],[0, 0, 0], 0, 1.5, 1, 0, [50, 65], [[_col#0, _col#1, _col#2, 0.5], [_col#0, _col#1, _col#2, 0.5], [_col#0, _col#1, _col#2, 0.3], [_col#0, _col#1, _col#2, 0]], [1,0.5], 0.1, 1, "", "", _impactEmitter];
_cloud setParticleRandom [2, [10, 10, 5], [10, 10, 5], 0, 0, [0, 0, 0, 0.1], 0, 0];
_cloud setParticleCircle [50, [8, 8, 5]];
_cloud setDropInterval 0.005;

// dust tower
_tower = "#particlesource" createVehicleLocal getPos _impactEmitter;
_tower setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48], "", "Billboard", 1, 18, [0, 0, 0],[0, 0, 0], 0, 1.5, 1, 0, [40, 90], [[_col#0, _col#1, _col#2, 0.5], [_col#0, _col#1, _col#2, 0.5], [_col#0, _col#1, _col#2, 0.3], [_col#0, _col#1, _col#2, 0]], [1,0.5], 0.1, 1, "", "", _impactEmitter];
_tower setParticleRandom [2, [10, 10, 5], [5, 5, 20], 0, 0, [0, 0, 0, 0.1], 0, 0];
_tower setParticleCircle [20, [2, 2, 20]];
_tower setDropInterval 0.01;

// rocks
_debris = "#particlesource" createVehicleLocal (getPosATL _impactEmitter);
_debris setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1, 1], "", "SpaceObject", 1,30,[0,0,0],[0, 0, 20], 1, 500,15,0,[2.5],[[0, 0, 0, 1]], [0.125],0, 0, "","",_impactEmitter, 0, true,0];
_debris setParticleRandom [10,[25, 25, 0.1],[30, 30, 20],0.5,1,[0, 0, 0, 0],0,0,0,0];
_debris setParticleCircle [0.5,[10, 10, 10]];
_debris setDropInterval 0.0004;

sleep 0.1;

deleteVehicle _debris;

sleep 0.9;

{deleteVehicle _x} forEach [_wave, _cloud, _tower, _debris];