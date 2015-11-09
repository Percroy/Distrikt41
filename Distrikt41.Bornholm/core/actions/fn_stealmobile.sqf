/*
	File: fn_stealmobile.sqf
	Author: Distrikt41 - Dscha

	Description:
	"steal" cellphone?
*/

hint localize "STR_D41_HandyAbgenommen";

{ if(_x isKindOf ["ItemRadio", configFile >> "CfgWeapons"])then { player unassignItem _x; player removeItem _x; };	}forEach assignedItems player;
{ if(_x isKindOf ["ItemRadio", configFile >> "CfgWeapons"])then { player removeItem _x;};							}forEach Items player;