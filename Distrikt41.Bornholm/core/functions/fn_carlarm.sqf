/*
	File: fn_carlarm.sqf
*/
private["_source"];
_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _source) exitWith {};
_source say3D "carlarm";

for "_i" from 1 to 15 do
{
	player action ["LightOn", _source];
	sleep 0.5;
	player action ["LightOff", _source];
	sleep 0.5;
};