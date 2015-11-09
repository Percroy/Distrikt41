#include <macro.h>
/*
	File: fn_D41_weaponShopSelection.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks the weapon & adds the price tag.
*/
private["_control","_index","_priceTag","_price","_item"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _control OR _index == -1) exitWith {closeDialog 0;}; //Bad data

_priceTag = ((findDisplay 138400) displayCtrl 38404);
_item = _control lbData _index;

_type = "D41_WaffenKomponenten";
_WKompCountPlayer = 0;
_WKompListe = magazines player;
{
	if(_x == _type) then {_WKompCountPlayer = _WKompCountPlayer + 1;};
}forEach _WKompListe;


if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then
{
	_iS = [_item,__GETC__(life_weapon_shop_array)] call TON_fnc_index;
	if(_iS == -1) then 
	{
		_price = 0;
	}
		else
	{
		_price = (__GETC__(life_weapon_shop_array) select _iS) select 1;
	};
	_priceTag ctrlSetStructuredText parseText format [localize "TR_D41_WeapComps_Needed_1",[(_price)] call life_fnc_numberText];
	_control lbSetValue[_index,_price];
}
	else
{
	_price = _control lbValue _index;
	if(_price > _WKompCountPlayer) then
	{
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'><t color='#FFFFFF'>Produktionskosten: </t><t color='#FF0000'>%1/%2</t>",_price, _WKompCountPlayer];
	}
		else
	{
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'><t color='#FFFFFF'>Produktionskosten: </t><t color='#FFFFFF'>%1/%2</t>",_price, _WKompCountPlayer];
	};
};