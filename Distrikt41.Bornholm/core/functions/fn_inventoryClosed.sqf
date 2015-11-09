/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
private["_container"];
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {}; //MEH

if((typeOf _container) in ["D41_supplyCrate_F","D41_LagerhausContainer_Blue"]) exitWith
{
	_house = [];
	_house = nearestObjects [player, D41_HausArray, 20];
	if(count(_house) == 0)exitWith{systemchat localize "STR_House_ContainerError"};
	_house = _house select 0;
	[[_house],"TON_fnc_updateHouseContainers",false,false] spawn life_fnc_MP;
};