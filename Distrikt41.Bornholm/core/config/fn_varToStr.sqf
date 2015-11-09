/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//License Block
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_diamond": {(localize "STR_License_Diamond")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_salt": {(localize "STR_License_Salt")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_med_adac": {(localize "STR_D41_DMV_Staff")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_cop_swat": {(localize "STR_D41_SWAT_Member")};
	//D41Lizenzen
	case "license_civ_bjerky": {(localize "STR_D41_Skill_Raw_Meat")};
	case "license_civ_coal": {(localize "STR_D41_Skill_Coal")};
	case "license_civ_meth": {(localize "STR_D41_Meth_Licence")};
	case "license_civ_Bruchstein": {(localize "STR_D41_Skill_Stone")};
	case "license_civ_Schnaps": {(localize "STR_D41_Skill_Brandy")};
	case "license_civ_Saft": {(localize "STR_D41_Skill_Juice")};
	case "license_civ_Zement": {(localize "STR_D41_Skill_Cement")};
	case "license_civ_Stahl": {(localize "STR_D41_Skill_steel")};
	case "license_civ_Krabben": {(localize "STR_D41_Licence_Crap")};
	case "license_civ_Dosenfisch": {(localize "STR_D41_Licence_Dosenfisch")};
	case "license_civ_WKompL": {(localize "STR_D41_Skill_weaponComp")};
	case "license_civ_FahrzeugT": {(localize "STR_D41_Skill_Vehicle_Parts")};
	case "license_civ_Kerosin": {(localize "STR_D41_Skill_kerosene")};
	case "license_civ_Ton": {(localize "STR_D41_Skill_Clay")};
	//D41Gruppen
	case "license_civ_gangdmw": {(localize "STR_D41_Gang_DMW")};
	case "license_cop_gangfirma": {(localize "STR_D41_Gang_Firma")};
	case "license_civ_base01": {(localize "STR_D41_Base_01")};
	case "license_civ_base02": {(localize "STR_D41_Base_02")};
	case "license_civ_base03": {(localize "STR_D41_Base_03")};
	case "license_civ_base04": {(localize "STR_D41_Base_04")};
	case "license_civ_base05": {(localize "STR_D41_Base_05")};
	case "license_civ_base06": {(localize "STR_D41_Base_06")};
};
