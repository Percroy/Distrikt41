/*
	File: fn_searchClientDrog.sqf
	Author: Distrikt41 - Dscha

	Description:
	Searches the player and he returns information back to the player.
*/
private["_cop"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};

[[player,life_DrogenKonsum],"life_fnc_copSearchDrog",_cop,false] call life_fnc_MP;