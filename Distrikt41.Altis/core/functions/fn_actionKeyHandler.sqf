#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater","_FSAbfrage"];
_curTarget = cursorTarget;
if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_interrupted) exitWith {life_interrupted = false;};

if(playerSide == west && _curTarget isKindOf "Land_Blitzer") exitWith
{
	[_curTarget] call life_fnc_copInteractionMenu;
};

_FSAbfrage = nearestObjects [player,["Land_FuelStation_Feed_F","Land_fs_feed_F"], 3];
if((count _FSAbfrage) > 0) exitWith {[] spawn life_fnc_D41_Tanke;};

if	(
		(playerSide == west && player distance _curTarget < 19 && (_curTarget in [fed_bank_building,zelle01,zelle02,zelle03,zelle04,waka01,waka02,waka03])) OR
		(playerSide == west && player distance _curTarget < 25 && (_curTarget in [CopRoenne]))
	)
	exitWith
	{
		[_curTarget] call life_fnc_copInteractionMenu;
	};

//if(_curTarget isKindOf "House_F" && {player distance _curTarget < 14}) exitWith { //Andere Abfrage:
if((typeOf _curTarget) in D41_HausArray && ((player distance _curTarget) < 14))exitWith
{
	[_curTarget] call life_fnc_houseMenu;
};

if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;

//Temp fail safe.
[] spawn {
	sleep 60;
	life_action_inUse = false;
};

//Check if it's a dead body.
if(_curTarget isKindOf "Man" && {!alive _curTarget} && {playerSide in [west,independent]}) exitWith {
	//Hotfix code by ins0
	if(((playerSide == blufor && {(call life_revive_cops)}) || playerSide == independent) && {"Medikit" in (items player)}) then {
		[_curTarget] call life_fnc_revivePlayer;
	};
};



_money = "Land_Money_F";
if((typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])}) then
{
	private["_handle"];
	_curTarget setVariable["inUse",TRUE,TRUE];
	_handle = [_curTarget] spawn life_fnc_pickupMoney;
	waitUntil {scriptDone _handle};
};