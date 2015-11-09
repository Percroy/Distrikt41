/*
	File: fn_wantedFetch.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm

	Description:
	Displays wanted list information sent from the server.
*/
private["_ret","_list","_result","_queryResult","_units","_inStatement"];
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _ret) exitWith {};
_ret = owner _ret;
_inStatement = "";
_tickTime = diag_tickTime;
_UnblockQuery = false;

_serverzeit = time;
sleep 0.1;
if(isNil "D41_WLReqBlockZeit")then{D41_WLReqBlockZeit = _serverzeit;};
diag_log format["::::::::::::::: wantedFetch D41_WLReqBlockZeit: %1 - Serverzeit: %2",D41_WLReqBlockZeit, time];
if(time >= D41_WLReqBlockZeit)then{_UnblockQuery = true;};

if(_UnblockQuery)then
{
	//waitUntil{!DB_Async_Active};
	_queryResult = ["WantedFetch",2,true] call DB_fnc_asyncCall;
	diag_log format["::::::::::::::: wantedFetch _queryResult: %1",_queryResult];
	D41_WLReqBlockZeit = _serverzeit + (5 * 60); //Bsp.: 5 x 60 (Multiplikator * Minute(60s) - ("300" theoretisch auch möglich)
	diag_log format["::::::::::::::: wantedFetch Neue D41_WLReqBlockZeit: %1",D41_WLReqBlockZeit];
	
	_units = [];
	{
		if((side _x) == civilian) then {_units pushBack (getPlayerUID _x)};
	} foreach playableUnits;
	
	D41_Wantedlist = [];
	{
		if((_x select 0) in _units)then
		{
			D41_Wantedlist pushBack (_x);
		};
	}forEach _queryResult;
	[[0,"Wanted Liste aktualisiert!"],"life_fnc_broadcast",WEST,false] call life_fnc_MP;
	[[0,"Wanted Liste aktualisiert!"],"life_fnc_broadcast",WEST,false] call life_fnc_MP;
};
if(!_UnblockQuery)then
{
	_Restzeit = round(D41_WLReqBlockZeit - _serverzeit);
	[[0,format["Wantedliste aus Zwischenspeicher geladen!! Zeit bis zum Update: %1 Sekunden", _Restzeit]],"life_fnc_broadcast",_ret,false] call life_fnc_MP;
};
diag_log format["::::::::::::::: wantedFetch _list: %1",D41_Wantedlist];



if(count D41_Wantedlist == 0) exitWith {[[],"life_fnc_wantedList",_ret,false] spawn life_fnc_MP;};

[[D41_Wantedlist],"life_fnc_wantedList",_ret,false] spawn life_fnc_MP;