/*
        File: fn_jailSys.sqf
        Author: Bryan "Tonic" Boardwine
       
        Description:
        I forget?
*/
private["_unit","_bad","_id","_ret","_time"];
 
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param;
 
 
 
if(_bad) then //Load time from database
{
        diag_log "**TIMEJAIL** Loading jail time from DB";
 
        _query = format["JailSys:%1", getPlayerUID _unit];
        //waitUntil{!DB_Async_Active};
        _result = [_query,2] call DB_fnc_asyncCall;
        _result = (_result select 0);
       
        diag_log format["**TIMEJAIL** ... returned %1", _result];
       
        _time = _result;
       
}
else //Set time to database
{
        diag_log "**TIMEJAIL** Sending to DB";
        _query = format["JailSys+1:%1:%2", _time, getPlayerUID _unit];
        //waitUntil{!DB_Async_Active};
        _result = [_query,1] call DB_fnc_asyncCall;
       
};
 
diag_log format["**TIMEJAIL** Jail time for player %1 is %2",name _unit , _time];
 
_id = owner _unit;
 
_ret = [_unit] call life_fnc_wantedPerson;
[[_ret,_bad,_time],"life_fnc_jailMe",_id,false] call life_fnc_MP;