/*
    File: fn_packupleitkegel.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Leitkegel abbauen
*/
private["_leitkegel"];
_leitkegel = nearestObjects[getPos player,["RoadCone_L_F"],3] select 0;
if(isNil "_leitkegel") exitWith {};

if(player canAdd "D41_Leitkegel") then
{
	_type = ["D41_Leitkegel"] call life_fnc_D41_GetMagName;
	player addMagazine "D41_Leitkegel";
    titleText[format[localize "STR_D41_PickupItem",_type],"PLAIN"];
    life_action_leitkegelPickup = nil;
    deleteVehicle _leitkegel;
}
else
{
	hint localize "STR_NOTF_InvFull";
};