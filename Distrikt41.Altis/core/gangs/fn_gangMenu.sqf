#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	31 hours of no sleep screw your description.
*/
private["_ownerID","_gangBank","_gangMax","_gangKarma","_gangName","_members","_allUnits","_ctrl"];
disableSerialization;
if(isNull (findDisplay 2620)) then {
	if(!(createDialog "Life_My_Gang_Diag")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};

_group = group player;
_ownerID = _group getVariable["gang_owner",""];
if(_ownerID == "") exitWith {closeDialog 0;}; //Bad juju
_gangName = _group getVariable "gang_name";
_gangBank = _group getVariable "gang_bank";
_gangMax = _group getVariable "gang_maxMembers";
_gangKarma = _group getVariable "gang_Karma";
_gangMemberList = _group getVariable "gang_MemberNames";


if(_gangMax == 8)then
{
	(getControl(2620,2622)) ctrlEnable false; //Upgrade
};
if(_ownerID != steamid) then {
	(getControl(2620,2622)) ctrlEnable false; //Upgrade
	(getControl(2620,2624)) ctrlEnable false; // Kick
	(getControl(2620,2625)) ctrlEnable false; //Set New Leader
	(getControl(2620,2630)) ctrlEnable false; //Invite Player
	(getControl(2620,2631)) ctrlEnable false; //Disband Gang
};

(getControl(2620,2629)) ctrlSetText _gangName;
(getControl(2620,601)) ctrlSetText format[(localize "STR_GNOTF_Funds")+ " €%1",[_gangBank] call life_fnc_numberText];
(getControl(2620,602)) ctrlSetText format["Gang Karma: %1",_gangKarma];

//Loop through the players.
_members = getControl(2620,2621);
lbClear _members;
{
        if((_x select 0) isEqualto _ownerID) then {
                _members lbAdd format["%1 " +(localize "STR_GNOTF_GangLeader"),(_x select 1)];
                _members lbSetData [(lbSize _members)-1,str([_x select 0,_x select 1])];
        } else {
                _members lbAdd format["%1",(_x select 1)];
                _members lbSetData [(lbSize _members)-1,str([_x select 0,_x select 1])];
        };
} foreach _gangMemberList;

_grpMembers = units _group;
_allUnits = playableUnits;
//Clear out the list..
{
	if(_x in _grpMembers OR side _x != civilian && isNil {(group _x) getVariable "gang_id"}) then {
		_allUnits set[_forEachIndex,-1];
	};
} foreach _allUnits;
_allUnits = _allUnits - [-1];

_ctrl = getControl(2620,2632);
lbClear _ctrl; //Purge the list
{
	_ctrl lbAdd format["%1",_x getVariable["realname",name _x]];
	_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} foreach _allUnits;