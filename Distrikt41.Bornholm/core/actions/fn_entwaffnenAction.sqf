/*
	File: fn_entwaffnenAction.sqf
	Author: Distrikt41 - Dscha

	Description:
	Entwaffen starten
*/
private["_target"];
_target = cursorTarget;

if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

hint localize "STR_D41_EntwaffnenAction";
[[player],"life_fnc_entwaffnen",_target,false] call life_fnc_MP;