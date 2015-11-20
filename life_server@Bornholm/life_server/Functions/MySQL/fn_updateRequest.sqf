/*
	File: fn_updateRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Ain't got time to describe it, READ THE FILE NAME!
*/
private["_uid","_side","_cash","_bank","_Karma","_licenses","_gear","_name","_query","_thread"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_bank = [_this,4,5000,[0]] call BIS_fnc_param;
_Karma = _this select 5;
_Position = _this select 6;
_licenses = [_this,7,[],[[]]] call BIS_fnc_param;
_gear = [_this,8,[],[[]]] call BIS_fnc_param;

//Get to those error checks.
if((_uid == "") OR (_name == "")) exitWith {};

//Parse and setup some data.
_name = [_name] call DB_fnc_mresString;
_gear = [_gear] call DB_fnc_mresArray;
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
	_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
	_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call DB_fnc_mresArray;

switch (_side) do {
	case west: {_query = format["UpdateRequest+west:%1:%2:%3:%4:%5:%6",_name,_cash,_bank,_gear,_licenses,_uid];};
	case civilian: {_query = format["UpdateRequest+civilian+pos:%1:%2:%3:%4:%5:%6:%7:%8:%9",_name,_cash,_bank,_Karma,_licenses,_uid,_gear,[_this select 9] call DB_fnc_bool,_Position];};
	case independent: {_query = format["UpdateRequest+independent:%1:%2:%3:%4:%5",_name,_cash,_bank,_licenses,_uid];};
};

//waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;