//::::::::::::  ::::::::::::\\
//	Filename: life_server/Functions/D41/fn_BuyHouseCheck.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Der an die Gang weitergegebene Schlüßel wird in die DB eingetragen
//::::::::::::  ::::::::::::\\
private["_house","_uid","_housePos","_query"];

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_player = _this select 1;
_house = _this select 2;
_housePos = getPosATL _house;

//waitUntil{!DB_Async_Active};
_check = [format["BuyHouseCheck:%1", _uid], 2] call DB_fnc_asyncCall;
_player setVariable ["D41_CanBuyHouse",_check select 0,true];

//waitUntil{!DB_Async_Active};
_check2 = [format["BuyHouseCheckSold:%1", _housePos], 2] call DB_fnc_asyncCall;
_player setVariable ["D41_CanBuyHouseSold",_check2 select 0,true];

