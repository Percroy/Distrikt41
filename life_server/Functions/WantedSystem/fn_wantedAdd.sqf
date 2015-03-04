/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_pastCrimes","_query","_queryResult"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

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

//What is the crime?
switch(_type) do
{
		case "187V": {_type = ["187V",50000]}; 
		case "187": {_type = ["187",40000]};
		case "901": {_type = ["901",20000]};
		case "261": {_type = ["261",15000]};
		case "261A": {_type = ["261A",7500]};
		case "215": {_type = ["215",5000]}; 
		case "214": {_type = ["214",7500]};
		case "211": {_type = ["211",10000]};
		case "212": {_type = ["212",15000]};
		case "480": {_type = ["480",3500]};
		case "481": {_type = ["481",20000]};
		case "482": {_type = ["482",30000]};
		case "483": {_type = ["483",35000]};
		case "459": {_type = ["459",7500]};
		case "1": {_type = ["1",1500]};
		case "2": {_type = ["2",2000]};
		case "7": {_type = ["7",500]};
		case "4": {_type = ["4",350]};
		case "5": {_type = ["5",1000]};
		case "6": {_type = ["6",2500]};
		case "11": {_type = ["11",500]};
		case "9": {_type = ["9",5000]};
		case "10": {_type = ["10",5000]};
		case "12": {_type = ["12",7500]};
		case "14": {_type = ["14",10000]};
		case "15": {_type = ["15",10000]};
		case "16": {_type = ["16",10000]};
		case "17": {_type = ["17",1000]};
		case "18": {_type = ["18",2000]};
		case "19": {_type = ["19",5000]};
		case "21": {_type = ["21",15000]};
		case "22": {_type = ["22",15000]};
		case "24": {_type = ["24",7500]};
		case "25": {_type = ["25",4000]};
		case "26": {_type = ["26",7500]};
		case "28": {_type = ["28",3500]};
		case "29": {_type = ["29",15000]};
		case "30": {_type = ["30",100000]};
		case "32": {_type = ["32",100000]};
		case "33": {_type = ["3",1000]};
		case "35": {_type = ["35",5000]};
		case "3": {_type = ["3",5000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.

_result = format["SELECT wantedID, wantedCrimes FROM wanted WHERE wantedID='%1'",_uid];
waitUntil{!DB_Async_Active};
_queryResult = [_result,2] call DB_fnc_asyncCall;

_name = [_name] call DB_fnc_mresString;
_val = [(_type select 1)] call DB_fnc_numberSafe;

if(count _queryResult != 0) then
{
	_pastCrimes = [(_queryResult select 1)] call _DB_fnc_mresToArray;
	_pastCrimes pushBack (_type select 0);
	_pastCrimes = [_pastCrimes] call DB_fnc_mresArray;
	_query = format["UPDATE wanted SET wantedCrimes = '%1', wantedBounty = wantedBounty + '%2', active = '1' WHERE wantedID='%3'",_pastCrimes,_val,_uid];
} else {
	_crimes = [[(_type select 0)]] call DB_fnc_mresArray;
	_query = format["INSERT INTO wanted (wantedID, wantedName, wantedCrimes, wantedBounty, active) VALUES('%1','%2','%3','%4', '1')",_uid,_name,_crimes,_val];
};

if(!isNil "_query") then {
	waitUntil{!DB_Async_Active};
	[_query,2] call DB_fnc_asyncCall;
};