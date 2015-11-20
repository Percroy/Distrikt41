/*
	File: fn_queryHouseRent.sqf
	Author: Dscha

	Description:
	query Stuff from DB or updates the rentdate
*/
private["_pos","_player","_mode","_query","_queryResult","_D41_MietZeit"];
_pos = _this select 0;
_player = _this select 1;
_mode = _this select 2;

switch (_mode) do {	
	case 0: {
		//waitUntil{!DB_Async_Active};
		_query = [format["queryHouseRent+0:%1",_pos], 2] call DB_fnc_asyncCall;
		_player setVariable ["D41_MietZeit",_query,true];
	};
	
	case 1: {
		_query = "queryHouseRent+1" + ":" + str(_pos);
		//waitUntil{!DB_Async_Active};
		[_query] spawn DB_fnc_asyncCall;		
	};
};