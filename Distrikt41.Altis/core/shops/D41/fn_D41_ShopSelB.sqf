//::::::::::::  ::::::::::::\\
//	Filename: core/shops/D41/fn_D41_ShopSelB.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Setzt Name und Verkaufspreis (SpielerInv) in D41_Shop_GUI
//::::::::::::  ::::::::::::\\

private["_control","_index","_NameTag","_PriceTag","_item","_SellIndex","_sell_array","_priceSell","_name","_picture"];

_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _control OR _index == -1) exitWith {closeDialog 0;}; //Bad data

_NameTag = ((findDisplay 1813999) displayCtrl 2202);
_PriceTag = ((findDisplay 1813999) displayCtrl 2203);
_PicTag = ((findDisplay 1813999) displayCtrl 2212);

_item = _control lbData _index;
_SellIndex = 0;
_sell_array = call sell_array;

disableSerialization;

if(isClass (configFile >> "CfgMagazines" >> _item)) then
{
	//Name
	_name = [_item] call life_fnc_D41_GetMagName;
	_picture = [_item] call life_fnc_D41_GetMagPic;
	_NameTag ctrlSetStructuredText parseText format
	["
	<t size='1'>Name:<br/>%1</t>
	",
	_name
	];
	_PicTag ctrlSetStructuredText parseText format["<img size='3.5' image='%1'/>",_picture];
	
	_Cnt = count(_sell_array);
	for "_i" from 0 to _Cnt do
	{
		if(_item in (_sell_array select _i)) exitWith {_SellIndex = _i;};
		
	};
	_priceSell = ((_sell_array select _SellIndex) select 1);
	if((call life_coplevel) > 0) then {_priceSell = _priceSell * 0.8;};
	if(life_shop_type in ["export_metall","export_oil","export_mineralien","export_baumaterial"]) then {_priceSell = _priceSell * 1.5;};
	_PriceTag ctrlSetStructuredText parseText format
	["
	<t size='1'>Verkaufspreis:<br/>€%1</t>
	",
	_priceSell
	];
};

if(isClass (configFile >> "CfgWeapons" >> _item)) then
{
	//Name
	_name = [_item] call life_fnc_D41_GetWpnName;
	_picture = [_item] call life_fnc_D41_GetWpnPic;
	_NameTag ctrlSetStructuredText parseText format
	["
	<t size='1'>Name:<br/>%1</t>
	",
	_name
	];
	_PicTag ctrlSetStructuredText parseText format["<img size='3.5' image='%1'/>",_picture];
	
	_Cnt = count(_sell_array);
	for "_i" from 0 to _Cnt do
	{
		if(_item in (_sell_array select _i)) exitWith {_SellIndex = _i;};
	};
	_priceSell = ((_sell_array select _SellIndex) select 1);
	if((call life_coplevel) > 0) then {_priceSell = _priceSell * 0.8;};
	if(life_shop_type in ["export_metall","export_oil","export_mineralien","export_baumaterial"]) then {_priceSell = _priceSell * 1.5;};
	_PriceTag ctrlSetStructuredText parseText format
	["
	<t size='1'>Verkaufspreis:<br/>€%1</t>
	",
	_priceSell
	];
};
if(isClass (configFile >> "CfgVehicles" >> _item)) then
{
};