/*
    File: fn_packupBlitzer.sqf
    Author: Distrikt41 - Dscha

    Description:
    Blitzer wieder aufsammeln.
*/

private["_Blitzer"];
_Blitzer = nearestObjects[getPos player,["Land_Blitzer"],3] select 0;
if(isNil "_Blitzer") exitWith {};

if(player canAdd "D41_Blitzer") then
{
	_type = ["D41_Blitzer"] call life_fnc_D41_GetMagName;
	player addMagazine "D41_Blitzer";
	_Blitzer setVariable ["D41_Blitzer", false, true];
    titleText[format[localize "STR_D41_PickupItem",_type],"PLAIN"];
    life_action_BlitzerPackup = nil;
	sleep 0.5;
    deleteVehicle _Blitzer;
	D41_BlitzerCounter = 0;
}
else
{
	hint localize "STR_NOTF_InvFull";
};