/*
	Author: TheTimidShade

	Description:
		Damages/destroys/throws/ragdolls any units within the killzone of the beam. Should only be executed on the server/host player.

	Parameters:
		0: OBJECT - Impact emitter object passed from fnc_beam.
		1: NUMBER - Maximum radius to deal lethal damage to units/vehicles.
		2: NUMBER - Maximum radius to deal damage/ragdoll units.
		
	Returns:
		NONE
*/

if (!isServer) exitWith {}; // make sure this function is only run on server

params ["_impactEmitter","_maxKillRange", "_maxDamageRange"];

private _ace_enabled = isClass(configFile >> "CfgPatches" >> "ace_main");

_nearObjects = nearestObjects[_impactEmitter, ["Building", "House", "Man", "LandVehicle", "Air"], _maxDamageRange];
{
	private _distance = _impactEmitter distance _x;
	private _dirFromTo = (getPosATL _impactEmitter) vectorFromTo (getPosATL _x);
	
	_effectCoef = if (_distance < _maxKillRange) then {1} else {
		private _coef = (_distance - _maxKillRange)/(_maxDamageRange - _maxKillRange); // should be 0 at maxKillRange, 1 at edge of maxDamageRange
		(1 - _coef)
	};
	
	private _throwSpeedKill = [30*_dirFromTo#0, 30*_dirFromTo#1, 5] vectorMultiply _effectCoef;
	private _throwSpeedDamage = [15*_dirFromTo#0, 15*_dirFromTo#1, 5] vectorMultiply _effectCoef;

	if (_distance <= _maxKillRange) then { // if unit is within the killzone, instantly destroy it
		if (!(_x isKindOf "Static")) then {[_x, _throwSpeedKill] remoteExec ["setVelocity", _x, false];}; // throw non-static objects
		[_x, _impactEmitter] spawn {sleep 0.001; if (_this#0 != _this#1) then {_this#0 setDamage 1};};
	} else { // if not, damage it depending on distance
		if (_distance <= _maxDamageRange) then {
			if (!(_x isKindOf "Static")) then {[_x, _throwSpeedDamage] remoteExec ["setVelocity", _x, false];}; // throw non-static objects
			
			private _damageToAdd = 0.5*(_effectCoef^2);
			if (!(_x isKindOf "Man")) then { // damage vehicles/buildings
				_x setDamage ((damage _x) + _damageToAdd);
			} else { // damage unit
				if (_ace_enabled) then { // check if ace is enabled, use ace damage if it is
					_damageRegions = ["body", "hand_l", "hand_r", "leg_l", "leg_r"];
					_damagePoint = selectRandom _damageRegions;
					[_x, _damageToAdd*2, _damagePoint, "explosive"] remoteExec ["ace_medical_fnc_addDamageToUnit", _x, false];
				} else {
					_x setDamage ((damage _x) + _damageToAdd);
				};

				if (_effectCoef >= 0.1) then { // ragdoll the unit if they are close enough to the explosion
					_x spawn {sleep 0.001; [_this] remoteExec ["tts_beam_fnc_ragdollUnit", _this, false];};
				};
			};
		};
	};
	sleep 0.0005;
} foreach _nearObjects;