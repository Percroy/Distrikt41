/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles the incoming request and sends an asynchronous query 
	request to the database.
	
	Return:
	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private["_uid","_side","_query","_query2","_query3","_return","_queryResult","_queryResult2","_queryResult3","_qResult","_handler","_thread","_loops","_returnCount"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;

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

/*
	_returnCount is the count of entries we are expecting back from the async call.
	The other part is well the SQL statement.
*/
_query = switch(_side) do
{
	case west: {_returnCount = 10; format["SELECT playerid, name, cash, bankacc, adminlevel, Karma, cop_licenses, coplevel, cop_gear, blacklist FROM players WHERE playerid='%1'",_uid];};
	case civilian: {_returnCount = 10; format["SELECT playerid, name, cash, bankacc, adminlevel, Karma, civ_licenses, arrested, civ_gear FROM players WHERE playerid='%1'",_uid];};
	case independent: {_returnCount = 9; format["SELECT playerid, name, cash, bankacc, adminlevel, Karma, med_licenses, mediclevel, med_gear FROM players WHERE playerid='%1'",_uid];};
};

waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

// SKILLSYS
_query2 = switch(_side) do {
	case west: {_returnCount = 17; format["SELECT D41_Apfel, D41_Pfirsich, D41_Kalkstein, D41_Salz, D41_Sand, D41_EisenRoh, D41_KupferRoh, D41_DiamantenRoh, D41_CannabisRoh, D41_KokainRoh, D41_HeroinRoh, D41_OelRoh, D41_FleischRoh, D41_KohleRoh, D41_Bruchstein, D41_TonRoh, D41_Krabben, D41_Fischen FROM skillsys WHERE playerid='%1'",_uid];};
	case civilian: {_returnCount = 17; format["SELECT D41_Apfel, D41_Pfirsich, D41_Kalkstein, D41_Salz, D41_Sand, D41_EisenRoh, D41_KupferRoh, D41_DiamantenRoh, D41_CannabisRoh, D41_KokainRoh, D41_HeroinRoh, D41_OelRoh, D41_FleischRoh, D41_KohleRoh, D41_Bruchstein, D41_TonRoh, D41_Krabben, D41_Fischen FROM skillsys WHERE playerid='%1'",_uid];};
	case independent: {_returnCount = 17; format["SELECT D41_Apfel, D41_Pfirsich, D41_Kalkstein, D41_Salz, D41_Sand, D41_EisenRoh, D41_KupferRoh, D41_DiamantenRoh, D41_CannabisRoh, D41_KokainRoh, D41_HeroinRoh, D41_OelRoh, D41_FleischRoh, D41_KohleRoh, D41_Bruchstein, D41_TonRoh, D41_Krabben, D41_Fischen FROM skillsys WHERE playerid='%1'",_uid];};
};
waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult2 = [_query2,2] call DB_fnc_asyncCall;

// D41 - Spieler gestorben?
_query3 = switch(_side) do
{
	case civilian: {_returnCount = 1; format["SELECT died FROM players WHERE playerid='%1'",_uid];};
};
_queryResult3 = [];
if(_side == civilian)then
{
	waitUntil{sleep (random 0.3); !DB_Async_Active};
	_queryResult3 = [_query3,2] call DB_fnc_asyncCall;
};

diag_log "------------- Client Query Request -------------";
diag_log format["::::::::::::: _queryResult (Spielerinfo): %1",_queryResult];
diag_log "------------- Client Skillpunkte Request -------";
diag_log format["::::::::::::: _queryResult2 (Skillpunkte): %1",_queryResult2];
diag_log "------------- Client War tot? Request -------";
diag_log format["::::::::::::: _queryResult3 (War tot): %1",_queryResult3];


if(typeName _queryResult == "STRING") exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

if(count _queryResult == 0) exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

//Blah conversion thing from a2net->extdb
private["_tmp"];
_tmp = _queryResult select 2;
_queryResult set[2,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult select 3;
_queryResult set[3,[_tmp] call DB_fnc_numberSafe];

//Parse licenses (Always index 6)
_new = [(_queryResult select 6)] call _DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[6,_new];

//Convert tinyint to boolean
_old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do
{
	_data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};

_queryResult set[6,_old];

_new = [(_queryResult select 8)] call _DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[8,_new];
//Parse data for specific side.
switch (_side) do
{
	case west:
	{
		_queryResult set[9,([_queryResult select 9,1] call DB_fnc_bool)];
	};
	
	case civilian:
	{
		_queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)];
		_houseData = _uid spawn TON_fnc_fetchPlayerHouses;
		waitUntil {scriptDone _houseData};
		_queryResult pushBack (missionNamespace getVariable[format["houses_%1",_uid],[]]);
		_gangData = _uid spawn TON_fnc_queryPlayerGang;
		waitUntil{scriptDone _gangData};
		_queryResult pushBack (missionNamespace getVariable[format["gang_%1",_uid],[]]);
	};
};

_keyArr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]];
_queryResult set[12,_keyArr];

//Karma abfrage
_tmp = _queryResult select 5;
_queryResult set[14,[_tmp] call DB_fnc_numberSafe];

//Karma abfrage
// D41 - Spieler gestorben?
if(_side == civilian)then
	{
	_tmp = _queryResult3 select 0;
	_queryResult set[13,[_tmp] call DB_fnc_numberSafe];
	};

//Skillpunkte
_tmp = _queryResult2 select 0;
_queryResult set[15,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 1;
_queryResult set[16,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 2;
_queryResult set[17,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 3;
_queryResult set[18,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 4;
_queryResult set[19,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 5;
_queryResult set[20,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 6;
_queryResult set[21,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 7;
_queryResult set[22,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 8;
_queryResult set[23,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 9;
_queryResult set[24,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 10;
_queryResult set[25,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 11;
_queryResult set[26,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 12;
_queryResult set[27,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 13;
_queryResult set[28,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 14;
_queryResult set[29,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 15;
_queryResult set[30,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 16;
_queryResult set[31,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult2 select 17;
_queryResult set[32,[_tmp] call DB_fnc_numberSafe];

[_queryResult,"SOCK_fnc_requestReceived",_ownerID,false] call life_fnc_MP;