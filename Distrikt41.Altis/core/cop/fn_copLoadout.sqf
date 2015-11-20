/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};
life_skillReperatur = 0;

if(!license_cop_gangfirma && playerSide == west) then {
//Load player with default cop gear.
		player addUniform "D41_police_suit_1";
		player addHeadgear "D41_Police_Beret_01";
		player addVest "D41_police_belt";

		player addWeapon "D41_mk2";
		player addMagazine "D41_10Rnd_22LR_mk2";
		player addMagazine "D41_10Rnd_22LR_mk2";
		player addMagazine "D41_10Rnd_22LR_mk2";


		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addItem "D41_Handy_cop";
		player assignItem "D41_Handy_cop";
};

if(license_cop_gangfirma && playerSide == west) then {
//Load player with default security gear.
		player addUniform "D41_security_combat_uniform";
		player addHeadgear "D41_security_Beret";
		player addVest "D41_security_vest_combat";

		player addWeapon "D41_mk2";
		player addMagazine "D41_10Rnd_22LR_mk2";
		player addMagazine "D41_10Rnd_22LR_mk2";
		player addMagazine "D41_10Rnd_22LR_mk2";


		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
		player addItem "ItemGPS";
		player assignItem "ItemGPS";
		player addItem "D41_Handy_cop";
		player assignItem "D41_Handy_cop";
};

[] call life_fnc_saveGear;