/*
	File: fn_storeVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Stores the vehicle in the garage.
*/
private["_nearVehicles","_vehicle","_ropes"];
if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship","D41_CargoContainer_Orange"],30];
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_NoNPC"};
if(isNull _vehicle) exitWith {};
if((typeOf _vehicle) in [
			"D41_Lada_R_Gelb1","D41_Lada_R_Gelb2","D41_Lada_R_Gelb3","D41_Lada_R_Gruen4","D41_Lada_R_Gruen5","D41_Lada_R_Gruen6","D41_Lada_R_Blau7",
			"D41_Lada_R_Blau8","D41_Lada_R_Blau9","D41_Lada_R_Rot10","D41_Lada_R_Rot11","D41_Lada_R_Rot12","D41_Lada_R_Pink13","D41_Lada_R_Pink14","D41_Lada_R_Pink15"
			])exitWith{hint localize "STR_Garage_Store_Armed"};

_HasCargoLoaded = false;
if((typeOf _vehicle) == "D41_Trailer_A")then
{
	_CargoState = _vehicle animationPhase "HideCargo";
	if(_CargoState == -1)exitWith{_HasCargoLoaded = true};
};
if(_HasCargoLoaded)exitWith{hint localize "STR_D41_ActContainerErstAbladen";};

[[_vehicle,false,(_this select 1)],"TON_fnc_vehicleStore",false,false] call life_fnc_MP;
life_garage_store = true;
_ropes = (_vehicle getvariable ["zlt_ropes", []]);
hint localize "STR_Garage_Store_Server";
{deletevehicle _x} foreach _ropes;
_vehicle setvariable ["zlt_ropes", [], true];