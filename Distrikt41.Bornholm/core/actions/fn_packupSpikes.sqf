/*
	File: fn_packupSpikes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Packs up a deployed spike strip.
*/

private["_spikes"];
_spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0;
if(isNil "_spikes") exitWith {};

if(player canAdd "D41_Nagelband") then
{
	_type = ["D41_Nagelband"] call life_fnc_D41_GetMagName;
	player addMagazine "D41_Nagelband";
	titleText[format[localize "STR_D41_PickupItem",_type],"PLAIN"];
	player removeAction life_action_spikeStripPickup;
	life_action_spikeStripPickup = nil;
	deleteVehicle _spikes;
}
else
{
	hint localize "STR_NOTF_InvFull";
};