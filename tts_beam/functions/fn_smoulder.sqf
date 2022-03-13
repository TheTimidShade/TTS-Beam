/*
    Author: TheTimidShade

    Description:
        Creates smouldering fire effect on the target object
		Used when static objects are destroyed by the laser explosion

    Parameters:
		0: STRING - Type of fire to create
        0: POSITION - Source of fire
		1: NUMBER - How long the fire burns for
        
    Returns:
        NONE
*/

if (!hasInterface) exitWith {};

params [
	["_type", "small", [""]],
    ["_position", [0,0,0], [[]], [2,3]],
	["_duration", 30, [0]]
];

private _fire = "#particlesource" createVehicleLocal _position;
private _smoke = "#particlesource" createVehicleLocal _position;

switch (_type) do {
	case "small": {
		_fire setParticleClass "IEDFlameF";
		_smoke setParticleClass "IEDFlameS";
	};
	case "medium": {
		_fire setParticleClass "MediumDestructionFire";
		_smoke setParticleClass "MediumDestructionSmoke";
	};
	case "large": {
		_fire setParticleClass "BigDestructionFire";
		_smoke setParticleClass "BigDestructionSmoke";
	};
	case "skeleton": {
		_smoke setParticleClass "SmallDestructionSmoke";
	};
	default { 
		_fire setParticleClass "MediumDestructionFire";
		_smoke setParticleClass "MediumDestructionSmoke";
	};
};

sleep _duration;

{deleteVehicle _x;} forEach [_fire, _smoke];

//ObjectDestructionFire1Tiny
//IEDMineFireStones
//IEDMineFireStonesBig
//SmallDestructionFire
//SmallDestructionSmoke
//BigDestructionFire
//BigDestructionSmoke
//MediumDestructionFire
//MediumDestructionSmoke