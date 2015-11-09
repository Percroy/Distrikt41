/*
	File: fn_copDefault.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Default cop configuration.
*/
//Strip the player down
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

//Load player with default cop gear.
player addUniform "D41_police_man_uniform";
player addVest "D41_police_belt";
player addHeadGear "H_Cap_blk";
player addMagazine "D41_10Rnd_22LR_mk2";
player addMagazine "D41_10Rnd_22LR_mk2";
player addMagazine "D41_10Rnd_22LR_mk2";
player addMagazine "D41_10Rnd_22LR_mk2";
player addMagazine "D41_10Rnd_22LR_mk2";
player addMagazine "D41_10Rnd_22LR_mk2";
player addWeapon "D41_mk2";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";

[] call life_fnc_saveGear;