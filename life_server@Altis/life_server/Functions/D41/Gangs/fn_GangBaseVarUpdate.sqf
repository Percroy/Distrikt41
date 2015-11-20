//::::::::::::  ::::::::::::\\
//	Filename: life_server/Functions/D41/Gangs/fn_GangBaseVarUpdate.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Update der Vergebenen Basen
//		[[GangID, GangBaseLizenz],"D41_fnc_GangBaseUpdate",false,false] call life_fnc_MP;
// Bsp:	[[25, "license_civ_base01"],"D41_fnc_GangBaseUpdate",false,false] call life_fnc_MP;
//::::::::::::  ::::::::::::\\
private["_GangID","_GangBaseLizenz","_tmp","_query","_queryResult"];
_GangID = _this select 0;
_GangBaseLizenz = _this select 1;

D41_RentedGangBasesIDs pushback _GangID;
D41_RentedGangBasesLiz pushback _GangBaseLizenz;
publicVariable "D41_RentedGangBasesIDs";
publicVariable "D41_RentedGangBasesLiz";

_query = format["UpdateGangBaseName:%1:%2",_GangBaseLizenz, _GangID];
//waitUntil{!DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;