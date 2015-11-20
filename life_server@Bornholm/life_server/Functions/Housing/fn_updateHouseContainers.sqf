/*
	BLAH BLAH
	I LOVE NOTEPAD++ GET OVER IT
	BLAH!
*/
private["_house","_houseID","_containers","_query"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {systemChat "House null";};
_houseID = [_house, "house_id"] call life_fnc_D41_GetHouseInfos;
if(isNil "_houseID") exitWith {systemChat "HouseID invalid";};

_containers = [_house, "containers"] call life_fnc_D41_GetHouseInfos;
if(_containers isEqualTo "KeineDaten")exitWith{diag_log format ["::::::::: FEHLER: UpdateHouseContainers: KeineDaten _containers: _House: %1", _house];};
diag_log format["Number of containers found: %1 || _house: %2 || _houseID: %3",count _containers, typeOf _house, _houseID];

_arr = [];
{
	_className = typeOf _x;
	_weapons = getWeaponCargo _x;
	_magazines = getMagazineCargo _x;
	_items = getItemCargo _x;
	_backpacks = getBackpackCargo _x;
	
	_arr pushBack [_className,[_weapons,_magazines,_items,_backpacks]];
} foreach _containers;

_arr = [_arr] call DB_fnc_mresArray;
_query = format["UpdateHouseContainers:%1:%2",_arr,_houseID];

"extDB2" callExtension format["%1:%2:%3",1,(call life_sql_id),_query];