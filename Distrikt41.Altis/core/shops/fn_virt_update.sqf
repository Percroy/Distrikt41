#include <macro.h>
/*
	File: fn_virt_update.sqf
	Author: Bryan "Tonic" Boardwine
	EDIT: Distrikt41 - Dscha
	Description:
	Update and fill the shop menu - ReWork (17.11.2014) to Distrikt41 ItemHandle
*/
private["_display","_item_list","_gear_list","_shop_data","_name","_price"];
disableSerialization;

_display = findDisplay 1813999;
_gear_list = _display displayCtrl 2200;
_item_list = _display displayCtrl 2201;

lbClear _item_list;
lbClear _gear_list;

_return = [];
_shop_data = [life_shop_type] call life_fnc_virt_shops;
_shop_data = _return;
if(_shop_data select 0 == "none")exitWith{hint localize "STR_No_Shop"; closeDialog 0;};

ctrlSetText[2208,format["%1", _shop_data select 0]];
ctrlSetText[2209,format["Spieler Inventar", _shop_data select 0]];
ctrlSetText[2210,"1"];
ctrlSetText[2211,"1"];

_name = "";
{
	if(isClass (configFile >> "CfgMagazines" >> _x))then {_name = [_x] call life_fnc_D41_GetMagName;};
	if(isClass (configFile >> "CfgWeapons" >> _x))	then {_name = [_x] call life_fnc_D41_GetWpnName;};
	
	//WpnProd Check
	if(!D41_isWpnProdShop)then
	{ _index = [_x,__GETC__(buy_array)] call TON_fnc_index; _price = (__GETC__(buy_array) select _index) select 1;}
	else
	{ _index = [_x,__GETC__(WpnProd_array)] call TON_fnc_index; _price = (__GETC__(WpnProd_array) select _index) select 1;};
	
	if((call life_coplevel) > 0) then {_price = _price * 0.8;};
	if(life_shop_type in ["export_metall","export_oil","export_mineralien","export_baumaterial"]) then {_price = _price * 1.5;};
	_item_list lbAdd format["%1",_name];
	_item_list lbSetData [(lbSize _item_list)-1,_x];
	_item_list lbSetValue [(lbSize _item_list)-1,_price];
} foreach (_shop_data select 1);

_Inv = Magazines player;
_Inv2 = Items player;
_Counter = 0;
{
	if ( isClass (configFile >> "CfgMagazines" >> _x)) then
	{
		if(_x in _Inv) then
		{
			_val = {_x == (_shop_data select 1 select _Counter)} count magazines player;
			if(_val > 0) exitWith
			{
				_name = [_x] call life_fnc_D41_GetMagName;
				_gear_list lbAdd format["%1x %2",_val,_name];
				_gear_list lbSetData [(lbSize _gear_list)-1,_x];
			};
		};
		_Counter = _Counter + 1;
	};
	
	if ( isClass (configFile >> "CfgWeapons" >> _x)) then
	{
		if(_x in _Inv2) then
		{
			_val = {_x == (_shop_data select 1 select _Counter)} count Items player;
			if(_val > 0) exitWith
			{
				_name = [_x] call life_fnc_D41_GetWpnName;
				_gear_list lbAdd format["%1x %2",_val,_name];
				_gear_list lbSetData [(lbSize _gear_list)-1,_x];
			};
		};
		_Counter = _Counter + 1;
	};	
} foreach (_shop_data select 1);