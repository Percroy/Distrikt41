/*
	File: fn_joinGang.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Joins the selected gang if it is open.
*/
private["_dialog","_sel","_gangs","_gang","_group","_locked"];
disableSerialization;

_dialog = findDisplay 2520;
_gangs = _dialog displayCtrl 2521;
_sel = lbCurSel _gangs;
_data = _gangs lbData _sel;

_index = [_data,life_gang_list] call TON_fnc_index;
if(_index == -1) exitWith {hint localize "STR_D41_Gang_NotFound"};
_gang = life_gang_list select _index;
_group = _gang select 1;
_locked = _gang select 2;

if(!isNull _group) then
{
	if(!_locked) then
	{
		[player] join _group;
		life_my_gang = _group;
		hint format[localize "STR_D41_Gang_enter",_gang select 0];
		
		closeDialog 0;
	}
		else
	{
		hint localize "STR_D41_Gang_Locked";
	};
}
	else
{
	hint localize "STR_D41_noValid_Gang";
};