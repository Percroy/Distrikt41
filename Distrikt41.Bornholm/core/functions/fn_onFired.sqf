/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles various different ammo types being fired.
*/
private["_Gun","_ammoType","_projectile","_removeWeapon"];
_Gun = _this select 1;
_ammoType = _this select 4; 
_projectile = _this select 6;

_removeWeapon = {player removeWeapon _Gun; _holder = "GroundWeaponHolder" createVehicle position player; _holder addWeaponCargoGlobal [_Gun,1]; hint "Nicht genügend Karma für diese Waffe!";};
if((life_D41_Karma < 2000) && (_Gun == "D41_TTrackerGummi"))then{call _removeWeapon;};

if(_ammoType == "GrenadeHand_stone") then {
	_projectile spawn {
		private["_position"];
		while {!isNull _this} do {
			_position = getPosATL _this;
			sleep 0.1;
		};
		[[_position],"life_fnc_flashbang",true,false] call life_fnc_MP;
	};
};