/*
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private["_vehicle","_CheckBlaulicht","_trueorfalse"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad entry!

if(!((typeOf _vehicle) in ["D41_BMW_X6M_Pol2","D41_tigr_swat","D41_swat_hunter"]))exitWith
{
	if(isNull ((attachedObjects _vehicle) select 0))exitWith{};
	_CheckBlaulicht = isLightOn ((attachedObjects _vehicle) select 0);
	if(_CheckBlaulicht)exitWith{{_vehicle action ['lightOff', _x]}forEach (attachedObjects _vehicle); _vehicle animate ['BeaconsStart',0]; _vehicle animate ['BeaconsServicesStart',0];};
	if(!_CheckBlaulicht)exitWith{{_vehicle action ['lightOn', _x]}forEach (attachedObjects _vehicle); _vehicle animate ['BeaconsStart',1]; _vehicle animate ['BeaconsServicesStart',1];};
};

_trueorfalse = _vehicle getVariable["lights",FALSE];

if(_trueorfalse) then {
	_vehicle setVariable["lights",FALSE,TRUE];
} else {
	_vehicle setVariable["lights",TRUE,TRUE];
	[[_vehicle,0.22],"life_fnc_copLights",true,false] call life_fnc_MP;
};