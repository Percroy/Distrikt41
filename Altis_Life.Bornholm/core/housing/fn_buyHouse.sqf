#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;

if(D41_IsBuying == 1)exitWith{closeDialog 0;};
if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if((_house getVariable["house_owned",false])) exitWith {hint "This house is already owned even though you shouldn't be seeing this hint..."};
if(!isNil {(_house getVariable "house_sold")}) exitWith {hint localize "STR_House_Sell_Process"};
if(!license_civ_home) exitWith {hint localize "STR_House_License"};

[[_uid,player],"D41_fnc_BuyHouseCheck",false,false] call life_fnc_MP;
D41_IsBuying = 1;
hint "Der Mieterbund schaut in seine Unterlagen...";
closeDialog 0;
sleep 1.5;

_DarfKaufen = player getVariable["D41_CanBuyHouse",[6]];
if(_DarfKaufen >= (__GETC__(life_houseLimit))) exitWith {D41_IsBuying = 0; hint format[localize "STR_House_Max_House",__GETC__(life_houseLimit)]};
//if(count life_houses >= (__GETC__(life_houseLimit))) exitWith {hint format[localize "STR_House_Max_House",__GETC__(life_houseLimit)]};
D41_IsBuying = 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_action = [
	format[localize "STR_House_BuyMSG",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(D41_atmGeld < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};

if(_action) then {
	if(D41_atmGeld < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};
	D41_atmGeld = D41_atmGeld - (_houseCfg select 0);
	[1] call SOCK_fnc_updatePartial;
	sleep 0.5;
	[[_uid,_house],"TON_fnc_addHouse",false,false] call life_fnc_MP;
	_house setVariable["house_owner",[_uid,profileName],true];
	_house setVariable["house_soldCheck",false,true];
	_house setVariable["locked",true,true];
	_house setVariable["house_owned",true,true];
	_house setVariable["containers",[],true];
	_house setVariable["uid",round(random 99999),true];
	life_vehicles pushBack _house;
	life_houses pushBack [str(getPosATL _house),[]];
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
	[] call life_fnc_hudUpdate;
};