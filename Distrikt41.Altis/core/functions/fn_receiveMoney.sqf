/*
	File: fn_receiveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receives money
*/
private["_unit","_val","_from"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_val = [_this,1,"",[""]] call BIS_fnc_param;
_from = [_this,2,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _from OR _val == "") exitWith {hint "1";};
if(player != _unit) exitWith {hint "2a";};
if(!(_from isKindOf "Man"))exitWith{hint "2b"};
if(!(isPlayer _from))exitWith{hint "2c"};
if(!(alive _from))exitWith{hint "2d"};
if(!([_val] call TON_fnc_isnumber)) exitWith {hint "3";};
if(_unit == _from) exitWith {hint "4";}; //Bad boy, trying to exploit his way to riches.

_name = _from getVariable["realname",name _from];
_life_maskiert = false;
if ((goggles _from) in D41_goggles_Array) then {_life_maskiert = true};
if ((uniform _from) in D41_uniform_Array) then {_life_maskiert = true};
if ((headgear _from) in D41_headgear_Array) then {_life_maskiert = true};
if ((hmd _from) in D41_hmd_Array) then {_life_maskiert = true};
if(_life_maskiert)then{_name = localize "STR_D41_MaskiertePerson";};
hint format[localize "STR_NOTF_GivenMoney", _name, [(parseNumber (_val))] call life_fnc_numberText];


D41_Geld = D41_Geld + (parseNumber(_val));
[] call life_fnc_hudUpdate;