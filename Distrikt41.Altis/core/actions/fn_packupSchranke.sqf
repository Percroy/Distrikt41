/*
    File: fn_packupSchranke.sqf
    Author: Distrikt41 - Dscha

    Description:
    Packs up a deployed wall.
*/

private["_Schranke"];
_Schranke = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0;
if(isNil "_Schranke") exitWith {};

if(player canAdd "D41_Schranke") then
{
	_type = ["D41_Schranke"] call life_fnc_D41_GetMagName;
	player addMagazine "D41_Schranke";
    titleText[format[localize "STR_D41_PickupItem",_type],"PLAIN"];
    life_action_SchrankePackup = nil;
    deleteVehicle _Schranke;
}
else
{
	hint localize "STR_NOTF_InvFull";
};