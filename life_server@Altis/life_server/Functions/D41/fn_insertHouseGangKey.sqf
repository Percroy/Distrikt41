//::::::::::::  ::::::::::::\\
//	Filename: life_server/Functions/D41/fn_insertHouseGangKey.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Der an die Gang weitergegebene Schlüßel wird in die DB eingetragen
//::::::::::::  ::::::::::::\\
private["_house","_uid","_housePos","_query"];

_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_mode = _this select 2;
	
if(isNull _house OR _uid == "") exitWith {};

_housePos = getPosATL _house;
	
switch (_mode) do {	
	case 0: {
		//waitUntil{!DB_Async_Active};
		_GangQuery = [format["insertHouseGangKey+0:%1","%" + _uid + "%"], 2] call DB_fnc_asyncCall;
		
		_query = format["insertHouseGangKey+1:%1:%2:%3",_uid, (_GangQuery select 0),_housePos];
		//waitUntil{!DB_Async_Active};
		[_query] spawn DB_fnc_asyncCall;
	};
	
	case 1: {
		_query = format["insertHouseGangKey+2:%1:%2",_uid,_housePos];
		//waitUntil{!DB_Async_Active};
		[_query] spawn DB_fnc_asyncCall;		
	};
};