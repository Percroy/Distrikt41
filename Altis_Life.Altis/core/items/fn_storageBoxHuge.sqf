/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tries to place a storage box in the nearest house.
*/
private["_boxType","_house","_positions","_containers","_pos","_houseCfg"];
_boxType = _this select 0;

_house = nearestBuilding (getPosATL player);
if(!(_house in life_vehicles)) exitWith {hint "Du mußt in einem Haus sein, um dies zu tun."};
if(!(_house isKindOf "Land_i_Shed_Ind_F")) exitWith {hint "Du kannst eine Lagerhauskiste nicht in einem Wohnhaus patzieren"};
_containers = _house getVariable["containers",[]];
_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {}; //What the fuck happened?
if(count _containers >= (_houseCfg select 1)) exitWith {hint "You cannot place any more storage containers in your house."};

_slots = _house getVariable ["slots",[]];
_positions = [_house] call life_fnc_getBuildingPositions;
_pos = [0,0,0];
_Dir = 0;
{
	_slots = _house getVariable ["slots",[]];
	if(!(_forEachIndex in _slots)) exitWith
	{
		_slots pushBack _forEachIndex;
		_house setVariable["slots",_slots,true];
		_pos = [(_x select 0),(_x select 1),(_x select 2)];
		_Dir = (_x select 3);
	};
} foreach _positions;
//if(_pos isEqualTo [0,0,0]) exitWith {hint "No more free storage spaces in your house."};
switch (_boxType) do

{
	case "D41_LagerkisteLagerhaus":
	{
		player removeMagazine "D41_LagerkisteLagerhaus";
		_container = "D41_LagerhausKiste_F" createVehicle [0,0,0];
		_HouseDir = getDir _house;
		_Dir = (_HouseDir - _Dir);
		_container setDir _Dir;
		_container setPos _pos;
		_container allowDamage false;
		
		_containers pushBack _container;
		_house setVariable["containers",_containers,true];
		[[_house],"TON_fnc_updateHouseContainers",false,false] call life_fnc_MP;
		
		//Empty out the crate
		clearWeaponCargoGlobal _container;
		clearMagazineCargoGlobal _container;
		clearItemCargoGlobal _container;
		clearBackpackCargoGlobal _container;
	};
};