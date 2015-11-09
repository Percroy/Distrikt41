/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tries to place a storage box in the nearest house.
*/
private["_boxType","_house","_positions","_containers","_pos","_houseCfg"];
_boxType = _this select 0;

_house = [];
_house = nearestObjects [player, D41_HausArray, 20];
if(isNil "_house")exitWith{systemchat "FEHLER! BEIM ADMIN MELDEN! HOUSING SYSTEM StorageBox! - IsNil"};
if(count(_house) == 0)exitWith{systemchat "FEHLER! BEIM ADMIN MELDEN! HOUSING SYSTEM StorageBox!"};
_house = _house select 0;
if(!(_house in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};

_containers = [_house, "containers"] call life_fnc_D41_GetHouseInfos;
if(_containers isEqualTo "KeineDaten")exitWith{hint "FEHLER\n\n Admin melden.\n\nMerken:\nStorageBoxHuge - _Containers = Keine Daten!"; systemchat "FEHLER\n\n Admin melden.\n\nMerken:\nStorageBoxHuge - _Containers = Keine Daten!"};

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {}; //What the fuck happened?
if(count _containers >= (_houseCfg select 1)) exitWith {hint localize "STR_ISTR_Box_HouseFull"};

_positions = [_house] call life_fnc_getBuildingPositions;
_PosArray = _positions select count(_containers);
_pos = [(_PosArray select 0),(_PosArray select 1),(_PosArray select 2)];
_Dir = _PosArray select 3;


if(!("D41_LagerkisteGross" in magazines player))exitWith{hint "Wat? Wie kommste hier hin? Am bescheißen oder was??"};

	player removeMagazine "D41_LagerkisteGross";
	_Hauscontainer = "D41_supplyCrate_F" createVehicle [0,0,0];
	_Hauscontainer allowDamage false;
	_HouseDir = getDir _house;
	_Dir = (_HouseDir - _Dir);
	_Hauscontainer setDir _Dir;
	_Hauscontainer setPos _pos;
	clearWeaponCargoGlobal _Hauscontainer;
	clearMagazineCargoGlobal _Hauscontainer;
	clearItemCargoGlobal _Hauscontainer;
	clearBackpackCargoGlobal _Hauscontainer;
	
	_containers pushBack _Hauscontainer;
	_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;
	_HouseInfos set[4,_containers];
	_house setVariable["House_Infos",_HouseInfos,true];
	[[_house],"TON_fnc_updateHouseContainers",false,false] call life_fnc_MP;