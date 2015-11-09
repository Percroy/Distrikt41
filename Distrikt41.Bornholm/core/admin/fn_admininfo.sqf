/*
	File: fn_admininfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Output information received to admin menu.
*/
private["_display","_ret","_text","_unit","_prim","_sec","_vest","_uni","_bp","_attach","_tmp"];
_ret = _this;
disableSerialization;
_display = findDisplay 2900;
_text = _display displayCtrl 2903;
_unit = _ret select 3;
_prim = if(primaryWeapon _unit != "") then { getText(configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "DisplayName")} else {"Keine"};
_sec = if(handgunWeapon _unit != "") then { getText(configFile >> "CfgWeapons" >> (handgunWeapon _unit) >> "DisplayName")} else {"Keine"};
_vest = if(vest _unit != "") then { getText(configFile >> "CfgWeapons" >> (vest _unit) >> "DisplayName")} else {"Keine"};
_uni = if(uniform _unit != "") then { getText(configFile >> "CfgWeapons" >> (uniform _unit) >> "DisplayName")} else {"NAGGISCH!"};
_bp = if(backpack _unit != "") then { getText(configFile >> "CfgWeapons" >> (backpack _unit) >> "DisplayName")} else {"Keinen"};

_attach = [];
if(primaryWeapon _unit != "") then
{
	{
		if(_x != "") then
		{
			_tmp = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_attach pushBack _tmp;
		};
	} foreach (primaryWeaponItems _unit);
};

if(count _attach == 0) then {_attach = "Keines"};
_text ctrlSetStructuredText parseText format["Name: %1<br/>Bank: %2<br/>Geld: %3<br/>Uniform: %4<br/>Weste: %5<br/>Rucksack: %6<br/>Primärwaffe: %7<br/>Sekundärwaffe: %8<br/><t align='center'>Primär Aufsätze</t><br/>%9",
_unit getVariable["realname",name _unit],[_ret select 0] call life_fnc_numberText,[_ret select 1] call life_fnc_numberText, _uni,_vest,_bp,_prim,_sec,_attach];