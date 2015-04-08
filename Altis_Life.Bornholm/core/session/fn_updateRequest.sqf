/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,D41_Geld,D41_atmGeld,life_D41_Karma];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;
_packet pushBack _array;

[] call life_fnc_saveGear;
_packet pushBack life_gear;
switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
	};
};

diag_log format [":::::::::::: fn_update_request.sqf: PlayerUID: %1 - ProfileName: %2 - playerSide: %3 - Geld: %4 - Bank: %5 - Karma: %6",getPlayerUID player,(profileName),playerSide,D41_Geld,D41_atmGeld,life_D41_Karma];
[_packet,"DB_fnc_updateRequest",false,false] call life_fnc_MP;