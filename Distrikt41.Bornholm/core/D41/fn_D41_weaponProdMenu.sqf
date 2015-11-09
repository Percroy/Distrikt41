/*
	File: fn_weaponShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Distrikt41 - Dscha
	Description:
	Erzeugt Waffen Prod Auswahlmenü.
*/
private["_config","_itemInfo","_itemList"];
uiNamespace setVariable ["Weapon_Shop",_this select 3];

disableSerialization;
if(!(createDialog "life_weapon_Prod")) exitwith {};

_config = [_this select 3] call life_fnc_D41_weaponProdCfg;
if(typeName _config == "STRING") exitWith {hint _config; closeDialog 0;};

ctrlSetText[38401,_config select 0];

_filters = ((findDisplay 138400) displayCtrl 38402);
lbClear _filters;

_filters lbAdd localize "STR_D41_Shop_inv";
//_filters lbAdd "Dein Inventar"; //KEIN Verkauf möglich

_filters lbSetCurSel 0;