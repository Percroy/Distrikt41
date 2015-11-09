/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.
	
	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.

switch (life_veh_shop select 0) do
{
	
	case "kart_shop": {_ret = license_civ_driver;};
	case "civ_car": {_ret = license_civ_driver;};
	case "civ_lux_car": {_ret = license_civ_driver;};
	case "civ_truck":	{_ret = license_civ_truck;};
	case "civ_container":	{_ret = license_civ_truck;};
	case "reb_car": {_ret = license_civ_rebel;};
	case "reb_ship": {_ret = license_civ_rebel;};
	case "base_01_car": {_ret = license_civ_base01;};
	case "base_02_car": {_ret = license_civ_base02;};
	case "base_03_car": {_ret = license_civ_base03;};
	case "base_04_car": {_ret = license_civ_base04;};
	case "base_05_car": {_ret = license_civ_base05;};
	case "base_06_car": {_ret = license_civ_base06;};
	case "cop_car": {_ret = true;};
	case "cop_air": {_ret = license_cop_air;};
	case "security_car": {_ret = license_cop_gangfirma;};
	case "security_air": {_ret = license_cop_gangfirma;};
	case "med_shop": {_ret = true;};
	case "med_air_hs": {_ret = license_med_air;};
	case "adac_shop": {_ret = true;};
	case "civ_air": {_ret = license_civ_air;};
	case "civ_ship": {_ret = license_civ_boat;};
	case "cop_ship": 
	{
		if(_veh == "B_Boat_Armed_01_minigun_F") then
		{
			_ret = license_cop_cg;
		}
			else
		{
			_ret = true;
		};
	};
};

_ret;