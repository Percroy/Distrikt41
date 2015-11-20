/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in selling the house, sets the owned to 0 and will cleanup with a 
	stored procedure on restart.
*/
private["_house","_ownerID","_housePos","_query","_radius","_containers"];
_house = param[0,ObjNull,[ObjNull]];
if(isNull _house) exitWith {systemChat ":SERVER:sellHouse: House is null";};


	_housePos = getPosATL _house;
	diag_log format [":::::::::: SELL HOUSE: _housePos: %1", _housePos];
	
	_houseID = [_house, "house_id"] call life_fnc_D41_GetHouseInfos;
	diag_log format [":::::::::: SELL HOUSE: _houseID: %1", _houseID];
	
	
	if(_houseID isEqualTo "KeineDaten")exitWith{diag_log format ["::::::::: FEHLER: sellhouse: isNil _houseID: _houseID: %1", _houseID];};
	_query = format["SellHouse+1:%1",_houseID];
	
	_index = -1;
	{
		if(str(_housePos) isEqualTo str(_x)) exitWith
		{
			_index = _forEachIndex;
			_exit = false;
		};
	} foreach D41_HausListe;
	diag_log format ["::::::::: SELL HOUSE: _index %1", _index];
	
	if(_index != -1) then {
		D41_HausListe set[_index,-1];
		D41_HausListe = D41_HausListe - [-1];
	};
	publicVariable "D41_HausListe";
	
	
	_house setVariable["House_Infos",nil,true];
	_radius = (((boundingBoxReal _house select 0) select 2) - ((boundingBoxReal _house select 1) select 2));
	_containers = nearestObjects[(getPosATL _house),["D41_supplyCrate_F","D41_LagerhausContainer_Blue"],_radius];
	{deleteVehicle _x} foreach _containers;
	[_query,1] call DB_fnc_asyncCall;