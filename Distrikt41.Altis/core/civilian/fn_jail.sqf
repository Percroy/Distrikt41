/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;

//##80
_time = [_this,2,15,[0]] call BIS_fnc_param;

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPos (getMarkerPos "jail_marker");

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

[1] call life_fnc_removeLicenses;
life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);
removeUniform player; 
removeVest player;
removeGoggles player;
removeHeadgear player;
removeAllAssignedItems player;
player addUniform "D41_prisoner_uniform";
player addBackpack "rhs_sidor";
[-100,0] call life_fnc_D41_KSys;

[[player,_bad,_time],"life_fnc_jailSys",false,false] call life_fnc_MP;
[5] call SOCK_fnc_updatePartial;