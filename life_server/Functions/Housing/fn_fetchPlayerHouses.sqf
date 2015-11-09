/*
        Author: Bryan "Tonic" Boardwine
       
        Description:
        Fetches all the players houses and sets them up.
*/
private["_GangQuery","_GangQueryResult","_query","_houses","_HouseNeedsSetUp","_return"];
if(_this == "") exitWith {};

_DB_fnc_mresToArray =
        {
                private["_array"];
                _array = [_this,0,"",[""]] call BIS_fnc_param;
                if(_array == "") exitWith {[]};
                _array = toArray(_array);
				
                for "_i" from 0 to (count _array)-1 do
                {
                        _sel = _array select _i;
                        if(_sel == 96) then
                        {
                                _array set[_i,39];
                        };
                };
				
                _array = toString(_array);
                _array = call compile format["%1", _array];
                _array;
        };
_return = [];

_GangQuery = format["fetchPlayerHouses:%1","%" + _this + "%"];

_GangQueryResult = [_GangQuery,2,false] call DB_fnc_asyncCall;

if(count(_GangQueryResult) < 1)then{_GangQueryResult = [-1]}; 
_GangQueryResult = _GangQueryResult select 0;
diag_log format [":::::::::::::: FetchPlayerHouses: _GangQueryResult: %1", _GangQueryResult];

_query = format["fetchPlayerHouses+1:%1:%2",_this, _GangQueryResult];

_houses = [_query,2,true] call DB_fnc_asyncCall;
diag_log format [":::::::::::::: FetchPlayerHouses: _houses: %1", _houses];

if(count (_houses select 0) == 0) exitWith {};
	{
		_HouseNeedsSetUp= false;
		_HousePos = call compile format["%1",_x select 1];
		//_HouseCrateCheck = nearestObjects [_HousePos,["D41_supplyCrate_F","D41_LagerhausContainer_Blue"], 10];
		_house = [];
		_house = nearestObjects [_HousePos, D41_HausArray, 20];
		_house = _house select 0;
		_house allowDamage false;
		_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;
		if(_HouseInfos isEqualTo "KeineDaten")then{_HouseNeedsSetUp = true;};
		_containers = [];
		
		_containerData = [_x select 2] call _DB_fnc_mresToArray;
		if(typeName _containerData == "STRING") then {_containerData = call compile format["%1", _containerData];};
		{
				if(count _x == 0) exitWith {}; //No containers / items.
				_className = _x select 0;
				_weapons = (_x select 1) select 0;
				_magazines = (_x select 1) select 1;
				_items = (_x select 1) select 2;
				_backpacks = (_x select 1) select 3;
				
				
				_positions = [_house] call life_fnc_getBuildingPositions;
				_PosArray = _positions select count(_containers);
				_pos = [(_PosArray select 0),(_PosArray select 1),(_PosArray select 2)];
				_Dir = _PosArray select 3;
				
				if(_HouseNeedsSetUp)then
				{
						_container = createVehicle[_className,_pos,[],0,"NONE"];
						waitUntil{!isNil "_container"};
						_container allowDamage false;
						_HouseDir = getDir _house;
						_Dir = (_HouseDir - _Dir);
						_container setDir _Dir;
						_HouseVectorUp = vectorUp _house;
						_container setVectorUp _HouseVectorUp;
						_container setPos _pos;
						
						_containers pushBack _container;
						clearWeaponCargoGlobal _container;
						clearItemCargoGlobal _container;
						clearMagazineCargoGlobal _container;
						clearBackpackCargoGlobal _container;
						//Add weapons to the crate.
						{
								_weaponCount = (_weapons select 1) select _forEachIndex;
								_container addWeaponCargoGlobal [_x,_weaponCount];
						} foreach (_weapons select 0);
						
						//Add magazines
						{
								_magazineCount = (_magazines select 1) select _forEachIndex;
								_container addMagazineCargoGlobal [_x,_magazineCount];
						} foreach (_magazines select 0);
						
						//Add items
						{
								_itemCount = (_items select 1) select _forEachIndex;
								_container addItemCargoGlobal [_x,_itemCount];
						} foreach (_items select 0);
						
						//Add backpacks
						{
								_backpackCount = (_backpacks select 1) select _forEachIndex;
								_container addBackpackCargoGlobal [_x,_backpackCount];
						} foreach (_backpacks select 0);
				};
			
			diag_log format ["FETCH PLAYER HOUSES: ID: %1",_this];
			diag_log format ["FETCH PLAYER HOUSES: Container # %1", (_forEachIndex + 1)];
			diag_log format ["FETCH PLAYER HOUSES: Inhalt: %1",_containerData select _forEachIndex];
			sleep 0.1;
		} foreach _containerData;
		
		if(_HouseNeedsSetUp)then
		{
			_query = format["initHouses+1:%1",_HousePos];
			_queryResult = [_query,2,true] call DB_fnc_asyncCall;
			
			diag_log format [":::::::: FetchPlayerHouses: initHouses+1: _queryResult %1",_queryResult];
			_counter = 0;
			if(count (_queryResult select 0) == 0) exitWith {};
			{
				_HouseInfos = [];
				_posi = call compile format["%1",_x select 2];
				_house = nearestObjects [_posi, D41_HausArray, 10];
				if(count(_house) == 0)exitWith{diag_Log format [":::::: INIT HOUSES: count(house) = 0: _posi = %1", _posi];};
				_house = _house select 0;
				_HouseInfos pushback (_x select 0);						//Infos in: MissionFileName/core/housing/fn_D41_GetHouseInfos.sqf
				_HouseInfos pushback (round(random 99999));
				_HouseInfos pushback [_x select 1,_x select 3];
				_HouseInfos pushback true;
				_HouseInfos pushback [];
				_HouseInfos pushback false;
				
				_house setVariable ["House_Infos", _HouseInfos, true];
				
				diag_log format [":::: initHouses: # %1 --- _x = %2",_counter, _x];
				_counter = _counter + 1;
				sleep 0.01;
			} foreach _queryResult;
		
			_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;
			diag_log format ["FETCH PLAYER HOUSES: _HouseInfos: %1",_HouseInfos];
			if(_HouseInfos isEqualTo "KeineDaten")exitWith{diag_log format ["FEHLER FETCHPLAYERHOUSES: POSITION: %1 -- KeineDaten!", getPos _house];};
			_HouseInfos set[4,_containers]; //reSet Container Var
			_house setVariable["House_Infos",_HouseInfos,true];
		};
		_return pushBack [_x select 1,_containers];
	} foreach _houses;
	
missionNamespace setVariable[format["houses_%1",_this],_return];























