/*
	File: fn_stealmobileaction.sqf
	Author: Distrikt41 - Dscha

	Description:
	"steal" cellphone?
*/
private["_target"];
_target = cursorTarget;

if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

hint localize "STR_D41_HandyAbnehmenAction";
[[player],"life_fnc_stealmobile",_target,false] call life_fnc_MP;
[-3,0] call life_fnc_D41_KSys;