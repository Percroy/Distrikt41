#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
diag_log format [":::::::::::::::::::::::::: SELLHOUSE _this = %1",_this];

if(isNull _house)exitWith{};
if(!((typeOf _house) in D41_HausArray)) exitWith {}; //Wie?!?! oO Naja, sicher ist sicher.
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_action = [
	format[localize "STR_House_SellHouseMSG",
	(round((_houseCfg select 0)/3)) call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

//Security-Check, if house is already sold... Why didn't you insert that, Tonic???

_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;
diag_log format [":::::::::::::::::::::::::: SELLHOUSE _HouseInfos = %1",_HouseInfos];
if(_HouseInfos isEqualTo "KeineDaten") exitWith {hint localize "STR_D41_House_already_Sold"};

if(_action) then
{
	[[_house],"TON_fnc_sellHouse",false,false] call life_fnc_MP;
	_uid = [_house, "uid"] call life_fnc_D41_GetHouseInfos;
	diag_log format [":::::::::::::::::::::::::: SELLHOUSE _uid = %1", _uid];
	deleteMarkerLocal format["house_%1",_uid];
	
	D41_atmGeld = D41_atmGeld + (round((_houseCfg select 0)/3));
	_index = life_vehicles find _house;
	if(_index != -1) then {
		life_vehicles set[_index,-1];
		life_vehicles = life_vehicles - [-1];
	};
	
	_index = [str(getPosATL _house),life_houses] call TON_fnc_index;
	diag_log format [":::::::::::::::::::::::::: SELLHOUSE getPosATL _house = %1",getPosATL _house ];
	diag_log format [":::::::::::::::::::::::::: SELLHOUSE _index (Haus wird entfernt) = %1", _index];
	if(_index != -1) then {
		diag_log format [":::::::::::::::::::::::::: SELLHOUSE (Haus wird entfernt)",_index];
		life_houses set[_index,-1];
		life_houses = life_houses - [-1];
	};
};
