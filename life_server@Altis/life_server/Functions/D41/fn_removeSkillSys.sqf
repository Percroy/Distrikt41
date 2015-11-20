/*
	File: fn_removeSkillSys.sqf
	Author: Dscha

	Description:
	Inserts Stuff to DB
*/

private["_uid","_type","_queryName","_query","_amount"];

_uid = param[0,"",[""]];
_type = param[1,"",[""]];
_amount = param[2,"",[""]];


_queryName = format["RemoveFromSkillSys_%1",_type];
_query = _queryName + ":" + _uid + ":" + str(_amount);
//waitUntil{!DB_Async_Active};
[_query] spawn DB_fnc_asyncCall;