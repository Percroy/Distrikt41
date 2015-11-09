#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player about an invite.
*/
private["_name","_group"];
_name = [_this,0,"",[""]] call BIS_fnc_param;
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;
if(_name == "" OR isNull _group) exitWith {}; //Fail horn anyone?
if(!isNil {(group player) getVariable "gang_name"}) exitWith {hint localize "STR_D41_GangMember_Already"};

if(D41_LeftGang)exitWith{hint "So nicht! Das Rein-Raus Spiel gibt es nur bei Clockwork Orange"};

_gangName = _group getVariable "gang_name";
_action = [
	format[localize "STR_GNOTF_InviteMSG",_name,_gangName],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then
	{
		[player] join _group;
		
		_NameList = _group getVariable "gang_MemberNames";
		_PlayerUID = format["%1",getPlayerUID player];
		_IsNotIn = true;
		{
			if(_PlayerUID == (_x select 0))exitWith{_IsNotIn = false;};
		}forEach _NameList;
		if(_IsNotIn)then
		{
			_NameList pushback [_PlayerUID, profileName];
			_group setVariable["gang_MemberNames",_NameList,true];
		};
		_members = _group getVariable "gang_members";
		_members pushBack (getPlayerUID player);
		_group setVariable["gang_members",_members,true];	
		
		[[4,_group],"TON_fnc_updateGang",false,false] call life_fnc_MP;
	};