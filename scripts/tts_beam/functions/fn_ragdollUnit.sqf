/*
	Author: Killzone_Kid

	Description:
		Forces the unit into ragdoll. Should be executed where unit is local.

	Parameters:
		0: OBJECT - Unit being forced into ragdoll.
		
	Returns:
		NONE
*/

params ["_unit"];

if (vehicle _unit != _unit) exitWith {};
private "_rag";
_rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
_rag setMass 1e10;
_rag attachTo [_unit, [0,0,0], "Spine3"];
_rag setVelocity [0,0,6];
_unit allowDamage false;
detach _rag;
[_rag, _unit] spawn {
	deleteVehicle (_this#0);
	(_this#1) allowDamage true;
};