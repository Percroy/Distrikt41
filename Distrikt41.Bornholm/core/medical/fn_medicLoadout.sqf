/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

removeAllContainers player;
removeAllWeapons player;
removeGoggles player;
removeHeadGear player;
removeBackpack player;

if(!license_med_adac && playerSide == independent) then {
	player forceAddUniform "D41_medic_man_uniform";
	player addHeadgear "D41_Medic_Beret_01";
	player addBackpack "B_MedicBergen_sgg";

	player addItem "D41_MediKit";
	player addItem "D41_Dietrich";
	player addItem "D41_Dietrich";
	player addItem "D41_Dietrich";
	player addItem "D41_Dietrich";
	player addItem "D41_Dietrich";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";
	player addItem "ItemWatch";
	player assignItem "ItemWatch";
	player addItem "ItemGPS";
	player assignItem "ItemGPS";
	player addItem "D41_Handy";
	player assignItem "D41_Handy";
	player addItem "pmc_earpiece";
	player assignItem "pmc_earpiece";
};

if(license_med_adac && playerSide == independent) then {
	player forceAddUniform "D41_ADAC_man_uniform2";
	player addBackpack "rhs_assault_umbts_engineer";

	player addItem "D41_ToolKit";
	player addItem "D41_Dietrich";
	player addItem "D41_Dietrich";
	player addItem "D41_Dietrich";
	player addItem "D41_Dietrich";
	player addItem "D41_Dietrich";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";
	player addItem "ItemWatch";
	player assignItem "ItemWatch";
	player addItem "ItemGPS";
	player assignItem "ItemGPS";
	player addItem "D41_Handy";
	player assignItem "D41_Handy";
	player addItem "pmc_earpiece";
	player assignItem "pmc_earpiece";
};

if(hmd player != "") then {
	player unlinkItem (hmd player);
};

[3] call SOCK_fnc_updatePartial;