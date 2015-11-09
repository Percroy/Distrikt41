/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;
_Sourrounding = nearestObjects [player,["D41_supplyCrate_F","D41_LagerhausContainer_Blue"], 4];


_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1 && playerSide != west) then {
	hint localize "STR_MISC_Backpack";
	ctrlShow [640,false];
	ctrlEnable [640, false];
	[] spawn
	{
		waitUntil {!isNull (findDisplay 602)};
		ctrlShow [640,false];
		ctrlEnable [640, false];
		closeDialog 0;
	};
};

if(count(_Sourrounding) > 0)exitWith
{
	_house = [];
	_house = nearestObjects [player, D41_HausArray, 20];
	if(count(_house) == 0)exitWith{systemchat "FEHLER! BEIM ADMIN MELDEN! HOUSING SYSTEM InvOpened!"};
	_house = _house select 0;
	_houseStatus = [_house, "locked"] call life_fnc_D41_GetHouseInfos;
	if(!(_house in life_vehicles) && _houseStatus) then
	{
		hint localize "STR_House_ContainerDeny";
		ctrlShow [640,false];
		ctrlEnable [640, false];
		[] spawn
		{
			waitUntil {!isNull (findDisplay 602)};
			ctrlShow [640,false];
			ctrlEnable [640, false];
			closeDialog 0;
		};
	};
};

if((typeOf _container) in ["D41_supplyCrate_F","D41_LagerhausContainer_Blue"]) exitWith
{
	_house = [];
	_house = nearestObjects [player, D41_HausArray, 20];
	if(isNil "_house")exitWith{systemchat "FEHLER! BEIM ADMIN MELDEN! HOUSING SYSTEM InvOpened! - IsNil"};
	if(count(_house) == 0)exitWith{systemchat "FEHLER! BEIM ADMIN MELDEN! HOUSING SYSTEM InvOpened!"};
	_house = _house select 0;
	_houseStatus = [_house, "locked"] call life_fnc_D41_GetHouseInfos;
	if(!(_house in life_vehicles) && _houseStatus) then
	{
		hint localize "STR_House_ContainerDeny";
		ctrlShow [640,false];
		ctrlEnable [640, false];
		[] spawn
		{
			waitUntil {!isNull (findDisplay 602)};
			ctrlShow [640,false];
			ctrlEnable [640, false];
			closeDialog 0;
		};
	};
};

if(playerSide != west) then
{
	if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith
	{
		if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith
		{
			hint localize "STR_MISC_VehInventory";
			ctrlShow [640,false];
			ctrlEnable [640, false];
			[] spawn
			{
				waitUntil {!isNull (findDisplay 602)};
				ctrlShow [640,false];
				ctrlEnable [640, false];
				closeDialog 0;
			};
		};
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
/*if(_container isKindOf "Man" && !alive _container) exitWith {
	hint localize "STR_NOTF_NoLootingPerson";
	[] spawn {
		waitUntil {!isNull (findDisplay 602)};
		closeDialog 0;
	};
};*/