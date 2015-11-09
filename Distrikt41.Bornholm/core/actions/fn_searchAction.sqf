/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the searching process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_mod = _this select 1;
if(isNull _unit) exitWith {};
hint localize "STR_NOTF_Searching";
sleep 2;

if(_mod == 0) then
{
	if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint localize "STR_NOTF_CannotSearchPerson"};
	[[player],"life_fnc_searchClient",_unit,false] call life_fnc_MP;
	life_action_inUse = true;
};

if(_mod == 1) then
{
	if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint localize "STR_NOTF_CannotSearchPerson"};
	[[player],"life_fnc_searchClientAlk",_unit,false] call life_fnc_MP;
	life_action_inUse = true;
};

if(_mod == 2) then
{
	if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint localize "STR_NOTF_CannotSearchPerson"};
	[[player],"life_fnc_searchClientDrog",_unit,false] call life_fnc_MP;
	life_action_inUse = true;
};