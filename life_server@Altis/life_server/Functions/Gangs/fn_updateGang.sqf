/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the gang information?
*/
private["_mode","_group","_groupID","_bank","_maxMembers","_members","_query","_owner"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;

if(isNull _group) exitWith {}; //FAIL

_groupID = _group getVariable["gang_id",-1];
if(_groupID == -1) exitWith {};

switch (_mode) do
{
	case 0:
	{
		_bank = [(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe;
		_maxMembers = _group getVariable ["gang_maxMembers",8];
		_owner = _group getVariable ["gang_owner",""];
		if(_owner == "") exitWith {};
		
		_query = format["updateGang:%1:%2:%3,%4", _bank,_maxMembers,_owner,_groupID];
	};
	
	case 1:
	{
		_query = format["updateGang+1:%1:%2",([(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe),_groupID];
	};
	
	case 2:
	{
		_query = format["updateGang+2:%1:%2",(_group getVariable ["gang_maxMembers",8]),_groupID];
	};
	
	case 3:
	{
		_owner = _group getVariable["gang_owner",""];
		if(_owner == "") exitWith {};
		_query = format["updateGang+3:%1:%2",_owner,_groupID];
	};
	
	case 4:
	{
		_members = _group getVariable "gang_members";
		_MemberNames = _group getVariable "gang_MemberNames";
		_query = format["updateGang+4:%1:%2:%3",_members,_MemberNames,_groupID];
	};
};

if(!isNil "_query") then
{
	//waitUntil{!DB_Async_Active};
	[_query] call DB_fnc_asyncCall;
};