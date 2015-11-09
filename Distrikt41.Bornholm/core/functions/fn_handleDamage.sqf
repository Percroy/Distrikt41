/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

//Handle the tazer first (Top-Priority).
if(!isNull _source) then
{
	if(_source != _unit) then
	{
		if(_projectile in ["D41_45ACPGummigeschiss","D41_B_22LR_SD","D41_B_12Gauge_74Slug"]) then
		{
			_distance = if(_projectile == "D41_B_12Gauge_74Slug") then {200} else {50};
			_isVehicle = if(vehicle player != player) then {true} else {false};
			if(!life_istazed && (_unit distance _source < _distance) && !(_unit getVariable["restrained",false]) && !D41_GeGummigeschosst && !_isVehicle)then
			{
				[_unit,_source] spawn life_fnc_tazed;
			};
		};
	};
};

[] call life_fnc_hudUpdate;
_damage;