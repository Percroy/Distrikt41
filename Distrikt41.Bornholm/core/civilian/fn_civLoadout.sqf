/*
	File: fn_civLoadout.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
	
	Description:
	Loads the civs out with the default gear, with randomized clothing.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

_clothings = ["U_C_Poor_1","D41_uniform_Woodlander1","U_Rangemaster","U_PMC_BgPolo_GrnPants","LOP_U_Civ_02","D41_uniform_citizen4","U_C_Journalist","U_PMC_RedPlaidShirt_DenimCords","U_C_Commoner1_1"];
player addUniform (_clothings select (floor(random (count _clothings))));

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";


[] call life_fnc_saveGear;