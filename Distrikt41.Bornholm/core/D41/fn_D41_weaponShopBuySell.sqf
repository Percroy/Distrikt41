#include <macro.h>
/*
	File: fn_D41_weaponShopBuySell.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Distrikt41 - Dscha
	Description:
	Grunddatei für Herstellung von Waffen
*/
disableSerialization;
private["_price","_item","_itemInfo","_ItemList","_counter","_secCheck","_bad","_type","_sum","_ui","_cP","_progress","_pgText","_cPMod"];
if (D41_WaffenProdInUse) exitWith {hint localize "STR_D41_WeaponPrd_already_prod"; closeDialog 0;};

if((lbCurSel 38403) == -1) exitWith {hint localize "STR_D41_WeaponProd_Select"};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;
_type = "D41_WaffenKomponenten";
_sum = _price;

_bad = "";

if((_itemInfo select 6) != "CfgVehicles") then
{
	if((_itemInfo select 4) in [4096,131072]) then
	{
		if(!(player canAdd _item) && (uiNamespace getVariable["Weapon_Prod_Filter",0]) != 1) exitWith {_bad = localize "STR_D41_WeaponProd_NoEnough_Space"};
	};
};

if(_bad != "") exitWith {hint _bad};


_counter = 0;
_secCheck = 1;
_WKompListe = magazines player;
{
	if(_x == _type) then {_counter = _counter + 1;};
}forEach _WKompListe;


if((uiNamespace getVariable["Weapon_Prod_Filter",0]) == 1) then
{
	D41_Geld = D41_Geld + _price;
	[_item,false] call life_fnc_handleItem;
	hint parseText format[localize "STR_D41_WeaponProd_Sell",_itemInfo select 1,[_price] call life_fnc_numberText];
	[nil,(uiNamespace getVariable["Weapon_Prod_Filter",0])] call life_fnc_D41_ProdShopFilter; //Update the menu.
}
	else
{
		if(_counter < _sum) exitWith {5 cutText [localize "STR_D41_WeaponProd_NotEnough","PLAIN"]; closeDialog 0;};
		//::::::::::::::::::
		D41_WaffenProdInUse = true;
		//Setup our progress bar. taken from tonic.
			disableSerialization;
			closeDialog 0;
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNameSpace getVariable "life_progress";
			_progress = _ui displayCtrl 38201;
			_pgText = _ui displayCtrl 38202;
			_pgText ctrlSetText format["%2 (1%1)...","%",localize "STR_D41_WeaponProd_processing"];
			_progress progressSetPosition 0.01;
			_cP = 0.01;
			//Zeitschalter Munition/Handfeuerwaffe oder Großkaliber
			switch(true) do
			{
				case(_sum <= 9):	{_cPMod = 0.03;};
				case(_sum >= 10):	{_cPMod = 0.01;};
			};
		//progress bar. taken from tonic.
		while{true} do
			{
				sleep  0.3;
				_cP = _cP + _cPMod;
				_progress progressSetPosition _cP;
				_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",localize "STR_D41_WeaponProd_processing"];
				if(_cP >= 1) exitWith {_secCheck = 0};
			};
		if(_cP < 1)exitWith {hint "Ni abbrechen! Ni gut!"; 5 cutText ["","PLAIN"];};
		
		//::::::::::::::::::
  		hint parseText format["Du hast eine %1 aus <t color='#8cff9b'>%2 Waffenkomponenten</t> hergestellt.",_itemInfo select 1,[_price] call life_fnc_numberText];
		5 cutText ["","PLAIN"];
		if(_secCheck == 0) then
		{
			for "_i" from 1 to _sum do
			{
				if(!(_type in (magazines player)))exitWith {_secCheck = 1; hint "Bescheissen is nich! Lass genügend Items im Inventar! Die bisherigen (falls vorhanden) hast Du zur Strafe verloren!"; 5 cutText ["","PLAIN"];};
				player removeMagazine _type;
			};
		};
		if(_secCheck == 1)exitWith {};
		//if(isClass (configFile >> "CfgWeapons" >> _item)) then {if(getNumber (configFile >> "CfgWeapons" >> _item >> "type") == 1)then {if(currentWeapon player == "")then {player addWeapon _item;} else {player addItem _item;};} else {player addItem _item;}} else {player addMagazine _item;};
		if(isClass (configFile >> "CfgWeapons" >> _item))then {_ItemType = getNumber (configFile >> "CfgWeapons" >> _item >> "type"); if(_ItemType == 1)then {if(currentWeapon player == "")then {player addWeapon _item;} else {if(player canAdd _item)then {player addItem _item;} else {for "_i" from 1 to _sum do{player addMagazine _type;}; hint "Nicht genug Platz im Inventar";};};}; if(_ItemType == 4)then {if(secondaryWeapon player == "")then {player addWeapon _item;} else {for "_i" from 1 to _sum do{player addMagazine _type;}; hint "Nicht genug Platz im Inventar";};}; if(_ItemType != 1 && _ItemType != 4)then {player addItem _item;};} else {player addMagazine _item;};
};

D41_WaffenProdInUse = false;
//Hotfix in for cop gear
if(playerSide == west) then
{
	[] call life_fnc_saveGear;
};