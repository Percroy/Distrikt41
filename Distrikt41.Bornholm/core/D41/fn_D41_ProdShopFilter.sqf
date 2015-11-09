/*
	File: fn_D41_ProdShopFilter.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Distrikt41 - Dscha
	Description:
	Applies the filter selected and changes the list. (Modifiziert für D41 WaffenProduktion)
*/
private["_itemList","_index","_config","_priceTag"];
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_shop = uiNamespace getVariable ["Weapon_Shop",""];
if(_index == -1 OR _shop == "") exitWith {systemChat "Bad Data Filter"; closeDialog 0;}; //Bad data passing.

uiNamespace setVariable["Weapon_Prod_Filter",_index];
//Setup List Control & Purge it.

_priceTag = ((findDisplay 138400) displayCtrl 38404);
_priceTag ctrlSetStructuredText parseText "";
_itemList = ((findDisplay 138400) displayCtrl 38403);
lbClear _itemList;

switch (_index) do
{
	case 0:
	{
		_config = [_shop] call life_fnc_D41_weaponProdCfg;
		{
			_itemInfo = [_x select 0] call life_fnc_fetchCfgDetails;
			_itemList lbAdd format["%1",if(isNil {_x select 1}) then {_itemInfo select 1} else {_x select 1}];
			_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
			_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			_itemList lbSetValue[(lbSize _itemList)-1,_x select 2];
		} foreach (_config select 1);
		
		((findDisplay 138400) displayCtrl 38405) ctrlSetText "Buy";
	};
	
	case 1:
	{
		private["_listedItems"];
		_config = [];
		_listedItems = [];
		//Go through weapons
		if(primaryWeapon player != "") then {_config pushback (primaryWeapon player)};
		if(secondaryWeapon player != "") then {_config pushback (secondaryWeapon player)};
		if(handgunWeapon player != "") then {_config pushback (handgunWeapon player)};
		
		//Go through items
		_config = _config + primaryWeaponItems player;
		_config = _config + (assignedItems player);
		_config = _config + (uniformItems player);
		_config = _config + (vestItems player);
		_config = _config + (backPackItems player);
		
		((findDisplay 138400) displayCtrl 38405) ctrlSetText "Sell";
		{
			if(!(_x in _listedItems) && _x != "") then
			{
				_itemInfo = [_x] call life_fnc_fetchCfgDetails;
				_listedItems pushback _x;
				
				_itemCount = {_x == (_itemInfo select 0)} count _config;
				if(_itemCount > 1) then
				{
					_itemList lbAdd format["[%2] %1",_itemInfo select 1,_itemCount];
				}
					else
				{
					_itemList lbAdd format["%1",_itemInfo select 1];
				};
				_itemList lbSetData[(lbSize _itemList)-1,_itemInfo select 0];
				_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			};
		} foreach _config;
	};
};

if(isNil {_this select 0}) then {_itemList lbSetCurSel 0;};