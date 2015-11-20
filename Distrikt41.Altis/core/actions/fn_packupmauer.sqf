/*
    File: fn_packupmauer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_mauer"];
_mauer = nearestObjects[getPos player,["Land_LandMark_F"],8] select 0;
if(isNil "_mauer") exitWith {};

if(player canAdd "D41_Mauer") then
{
	_type = ["D41_Mauer"] call life_fnc_D41_GetMagName;
	player addMagazine "D41_Mauer";
    titleText[format[localize "STR_D41_PickupItem",_type],"PLAIN"];
    life_action_mauerPackup = nil;
    deleteVehicle _mauer;
}
else
{
	hint localize "STR_NOTF_InvFull";
};