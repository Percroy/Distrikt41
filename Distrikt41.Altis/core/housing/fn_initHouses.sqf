/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the players houses, mainly throwing down markers.
*/
if(count life_houses == 0) exitWith {}; //Nothing to do.

{
	_position = call compile format["%1",_x select 0];
	diag_log format ["::::::::::::::::::::::::: initHouses: _position: %1", _position];
	_house = [];
	_house = nearestObjects [_position, D41_HausArray, 20];
	if(isNil "_house")exitWith{systemchat "FEHLER! BEIM ADMIN MELDEN! HOUSING SYSTEM InitHouses! - IsNil";};
	if(count(_house) == 0)exitWith{systemchat "FEHLER! BEIM ADMIN MELDEN! HOUSING SYSTEM InitHouses!";};
	diag_log format ["::::::::::::::::::::::::: initHouses: count(_house): %1", count(_house)];
	_house = _house select 0;
	diag_log format ["::::::::::::::::::::::::: initHouses: _house: %1", _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	diag_log format ["::::::::::::::::::::::::: initHouses: _houseName: %1", _houseName];
	
	_uid = [_house, "uid"] call life_fnc_D41_GetHouseInfos;
	if(_uid isEqualTo "KeineDaten")exitWith{diag_log format ["::::::::: FEHLER: initHouses (Client): isNil _uid: _house: %1", _house];};
	_marker = createMarkerLocal [format["house_%1",_uid],_position];
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
} foreach life_houses;