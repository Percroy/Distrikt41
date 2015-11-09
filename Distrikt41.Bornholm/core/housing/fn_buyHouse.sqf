#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;

	if(D41_IsBuying)exitWith{closeDialog 0;};
	if(isNull _house) exitWith {};
	if(!((typeOf _house) in D41_HausArray)) exitWith {};
	
	_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;
	if(!(_HouseInfos isEqualTo "KeineDaten"))exitWith{hint localize "STR_D41_already_owned"};
	
	
	if(!license_civ_home) exitWith {hint localize "STR_House_License"};
	
	[[_uid,player,_house],"D41_fnc_BuyHouseCheck",false,false] call life_fnc_MP;
	D41_IsBuying = true;
	hint localize "STR_D41_Check_Rent";
	closeDialog 0;
	sleep 1.5;
	
	_HouseSoldCheck = player getVariable["D41_CanBuyHouseSold",false];
	if(_HouseSoldCheck)exitWith{hint localize "STR_D41_already_owned"};
	_DarfKaufen = player getVariable["D41_CanBuyHouse",[6]];
	if(_DarfKaufen >= (__GETC__(life_houseLimit))) exitWith {D41_IsBuying = false; hint format[localize "STR_House_Max_House",__GETC__(life_houseLimit)]};
	D41_IsBuying = false;
	
	_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
	if(count _houseCfg == 0) exitWith {};
	
	_action = [
		format[localize "STR_House_BuyMSG",
		[(_houseCfg select 0)] call life_fnc_numberText,
		(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
	] call BIS_fnc_guiMessage;
	
	if(D41_atmGeld < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};
	
	if(_action) then
	{
		if(D41_atmGeld < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};
		D41_atmGeld = D41_atmGeld - (_houseCfg select 0);
		[6] call SOCK_FNC_updatePartial;
		
		_HouseInfos = [];
		_HouseInfos pushback round(random 99999);
		_MUID = round(random 99999);
		_HouseInfos pushback _MUID;
		_HouseInfos pushback [_uid,profileName];
		_HouseInfos pushback true;
		_HouseInfos pushback [];
		_HouseInfos pushback false;
		
		_house setVariable ["House_Infos", _HouseInfos, true];
		
		life_vehicles pushBack _house;
		life_houses pushBack [str(getPosATL _house),[]];
		_marker = createMarkerLocal [format["house_%1",_MUID],getPosATL _house];
		_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		_marker setMarkerTextLocal _houseName;
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "loc_Lighthouse";
		
		[[_uid,_house],"TON_fnc_addHouse",false,false] call life_fnc_MP;
		[] call life_fnc_hudUpdate;
	};