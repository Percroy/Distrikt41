/*
    File: fn_packupstrahler.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Strahler abbauen
*/
private["_strahler"];
_strahler = nearestObjects[getPos player,["Land_PortableLight_double_F"],3] select 0;
if(isNil "_strahler") exitWith {};

if(player canAdd "D41_Strahler") then
{
	_type = ["D41_Strahler"] call life_fnc_D41_GetMagName;
	player addMagazine "D41_Strahler";
    titleText[format[localize "STR_D41_PickupItem",_type],"PLAIN"];
    life_action_strahlerPickup = nil;
    deleteVehicle _strahler;
}
else
{
	hint localize "STR_NOTF_InvFull";
};