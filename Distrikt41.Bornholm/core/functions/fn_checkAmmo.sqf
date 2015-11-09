/*
	File: fn_checkAmmo.sqf
	Author: Distrikt41 - Avka / Dscha
	Description:
	Checks the Ammo Count in the Magazine of the Current Weapon and returns a Hint:
*/


_muzzle = currentMuzzle player;
_weapon = currentWeapon player;
_magazine = currentMagazine player;
_picture = getText (configFile >> "CfgMagazines" >> _magazine >> "picture");
player playMove "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSrasWrflDnon";

sleep 1;
//not a grenade launcher
if (_muzzle == _weapon) then {
	_maxRounds = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count") max 1;

	_count = player ammo _weapon;
	_prozent =((_count/_maxRounds) * 100);
	if(_prozent == 100) then 
	{
		_msg = "[][][][][][][][][][]";
		hint parseText format ["<img size='3' color='#FFFFFF' image='%1'/><br/><t color='#00FF22'>%2</t>",_picture,_msg];

	};
	if(_prozent <= 99 && _prozent > 75) then 
	{
		_msg = "[][][][][][][][]";
		hint parseText format ["<img size='3' color='#FFFFFF' image='%1'/><br/><t color='#89FF00'>%2</t>",_picture,_msg];
	};
	if(_prozent <= 75 && _prozent > 50) then 
	{
		_msg = "[][][][][][]";
		hint parseText format ["<img size='3' color='#FFFFFF' image='%1'/><br/><t color='#DEFF00'>%2</t>",_picture,_msg];
	};
	if(_prozent <= 50 && _prozent > 25) then 
	{
		_msg = "[][][][";
		hint parseText format ["<img size='3' color='#FFFFFF' image='%1'/><br/><t color='#FFA600'>%2</t>",_picture,_msg];
	};
	if(_prozent <= 25) then 
	{
		_msg = "[][]";
		hint parseText format ["<img size='3' color='#FFFFFF' image='%1'/><br/><t color='#FF0000'>%2</t>",_picture,_msg];
	};
	if(_prozent == 0) then 
	{
		_msg = localize "STR_D41_Mag_Empty";
		hint parseText format ["<img size='3' color='#FFFFFF' image='%1'/><br/><t color='#FFFFFF'>%2</t>",_picture,_msg];
	};
//grenade launcher
} else {
	_count = player ammo _muzzle;
	if (_count == "1") then 
	{
		_msg = localize "STR_D41_Grenade_launcher_Full";
		hint parseText format ["<img size='3' color='#FFFFFF' image='%1'/><br/>%2",_picture,_msg];
	}
	else
	{
		_msg = localize "STR_D41_Grenade_launcher_Empty";
		hint parseText format ["<img size='3' color='#FFFFFF' image='%1'/><br/>%2",_picture,_msg];
	};
};



