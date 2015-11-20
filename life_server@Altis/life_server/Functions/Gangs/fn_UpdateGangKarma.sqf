//::::::::::::  ::::::::::::\\
//	Filename: life_server/Functions/Gangs/fn_updateGangKarma.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Update vom Karma aller derzeit Aktiven Gangs auf dem Server
//::::::::::::  ::::::::::::\\

_ActiveGroupList = [];
{
	_tmp = [];
	_groupID = _x getVariable "gang_id";
	if(!isNil "_groupID") then {  _tmp pushback _groupID; _tmp pushback _x; _ActiveGroupList pushback _tmp; };
} foreach allGroups;
systemchat str _ActiveGroupList;
// _ActiveGroupList = [[,],[,]]

{
	_GroupID = _x select 0;
	_Group = _x select 1;
	[_GroupID,_Group] spawn TON_fnc_queryGangKarma;
	waitUntil{!D41_GKarmaQry};
}forEach _ActiveGroupList;