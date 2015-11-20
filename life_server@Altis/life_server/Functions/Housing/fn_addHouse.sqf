/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Blah
*/
private["_house","_uid","_housePos","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR _uid == "") exitWith {};

_housePos = getPosATL _house;


_query = format["AddHouse:%1:%2",_uid,_housePos];
diag_log format["Query: %1",_query];

[_query,1] call DB_fnc_asyncCall;

sleep 0.3;

_query = format["AddHouse+1:%1:%2",_housePos,_uid];
_queryResult = [_query,2] call DB_fnc_asyncCall;


_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;
_HouseInfos set[0,(_queryResult select 0)]; //Set HouseID
_house setVariable["House_Infos",_HouseInfos,true];

D41_HausListe pushback _housePos;
publicvariable "D41_HausListe";