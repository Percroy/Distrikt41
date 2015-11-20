/*
	File: fn_wantedProfUpdate.sqf
	Author: [midgetgrimm]
	Persistence by: ColinM
	Description:
	Updates name of player if they change profiles
*/
private["_uid","_name","_query","_tickTime","_wantedCheck","_wantedQuery"];

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
//Bad data check
if(_uid == "" OR  _name == "") exitWith {};
_tickTime = diag_tickTime;

_wantedCheck = format["WantedProfUpdate:%1",_uid];
//waitUntil{!DB_Async_Active};
_wantedQuery = [_wantedCheck,2,true] call DB_fnc_asyncCall;
if(count _wantedQuery == 0) exitWith {diag_log "Person not wanted, no update";};
_wantedQuery = call compile format["%1",_wantedQuery];
_wantedQuery = (_wantedQuery select 0);

if(_name != (_wantedQuery select 0)) then
{
	_query = format["WantedProfUpdate+2:%1:%2",_name,_uid];
	//waitUntil{!DB_Async_Active};
	[_query,2] call DB_fnc_asyncCall;

	diag_log "------------- Update Player Name -------------";
	diag_log format["QUERY 1: %1",_wantedCheck];
	diag_log format["QUERY 2: %1",_query];
	diag_log format["Last Name: %1",_wantedQuery];
	diag_log format["Req By: %1",_name];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
	diag_log "--------------Person Is Wanted-----------------";
} else {diag_log "Name Matches, no change needed";};