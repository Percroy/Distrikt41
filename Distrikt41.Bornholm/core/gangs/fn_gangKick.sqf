#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours...
*/
private["_unit","_unitID","_members"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unit = call compile format["%1",getSelData(2621)];
//if(isNull _unit) exitWith {}; //Bad unit?
if((_unit select 0) == getPlayerUID player) exitWith {hint localize "STR_GNOTF_KickSelf"};

_unitID = _unit select 0;
_members = grpPlayer getVariable "gang_members";
if(isNil "_members") exitWith {diag_log "exitWith isNil _members"};
//if(typeName _members != "ARRAY") exitWith {diag_log "exitWith != ARRAY"};

_grpPos = _members find _unitID;
_members deleteAt _grpPos;
grpPlayer setVariable["gang_members",_members,true];

_NameList = grpPlayer getVariable "gang_MemberNames";
{
	_NLPos = _x find _unitID;
	if(_NLPos != -1)then
	{
		_NameList deleteAt _forEachIndex;
		grpPlayer setVariable["gang_MemberNames",_NameList,true];
	};
}forEach _NameList;

_check = [_unitID] call life_fnc_isUIDActive;
if(_check)then
{
    [[D41_SelectedPlayer,grpPlayer],"TON_fnc_clientGangKick",D41_SelectedPlayer,false] call life_fnc_MP;
};

[[4,grpPlayer],"TON_fnc_updateGang",false,false] call life_fnc_MP;
[] call life_fnc_gangMenu;