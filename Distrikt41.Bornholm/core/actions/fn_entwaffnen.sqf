/*
	Author: Dscha
	filename: fn_entwaffnen.sqf
	Description: Entwaffnet Spieler!
*/
_holder = "GroundWeaponHolder" createVehicle position player;
hint localize "STR_D41_Entwaffnen";

if(primaryWeapon player != "") then
{
	_Gun = primaryWeapon player;
	player removeWeapon _Gun;
	_holder addWeaponCargoGlobal [_Gun,1];
	
};

if(handgunWeapon player != "") then
{	
	_Gun = handgunWeapon player;
	player removeWeapon _Gun;
	_holder addWeaponCargoGlobal [_Gun,1];
};

if(secondaryWeapon player != "") then
{	
	_Gun = secondaryWeapon player;
	player removeWeapon _Gun;
	_holder addWeaponCargoGlobal [_Gun,1];
};