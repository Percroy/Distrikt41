/*
	File: fn_insertKarma.sqf
	Author: Dscha

	Description:
	Inserts Stuff to DB
*/
private["_uid","_type","_query","_sql"];

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;

_query = "insertKarma"+ ":" + _uid + ":" + str(_type);
//waitUntil{!DB_Async_Active};
[_query] spawn DB_fnc_asyncCall;