#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_grp","_grpMembers"];
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_grp = grpPlayer;
_grpMembers = grpPlayer getVariable "gang_members";
_ID = steamid;
_grpPos = _grpMembers find _ID;
_grpMembers deleteAt _grpPos;

_grp setVariable["gang_members",_grpMembers,true];

_NameList = _grp getVariable "gang_MemberNames";
_PlayerUID = getPlayerUID player;
{
	_NLPos = _x find _PlayerUID;
	if(_NLPos != -1)then
	{
		_NameList deleteAt _forEachIndex;
		_grp setVariable["gang_MemberNames",_NameList,true];
	};
}forEach _NameList;

[[4,_grp],"TON_fnc_updateGang",false,false] call life_fnc_MP;
sleep 1;
[player] joinSilent (createGroup civilian);
D41_LeftGang = true;
[[getPlayerUID player], "D41_fnc_LeaveGang",false,false] call life_fnc_MP;
closeDialog 0;