/*
        File: fn_insertSkillSys.sqf
        Author: Dscha
 
        Description:
        Inserts Stuff to DB
*/
 
private["_uid","_query"];
 
_uid = [_this,0,"",[""]] call BIS_fnc_param;
 
_query = format["insertSkillSys:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17:%18:%19:%20",_uid,  (_this select 1), (_this select 2),(_this select 3),(_this select 4),(_this select 5) ,(_this select 6) ,(_this select 7) ,(_this select 8) ,(_this select 9),(_this select 10) ,(_this select 11) ,(_this select 12) ,(_this select 13) ,(_this select 14),(_this select 15) ,(_this select 16) ,(_this select 17), (_this select 18), (_this select 19)];
       
diag_log format ["InsertSkillSys Update ID: %1 : %2", _uid, _query];
//waitUntil{!DB_Async_Active};
[_query] spawn DB_fnc_asyncCall;