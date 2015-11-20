#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
_players = _display displayCtrl 2406;
lbClear _list;
_units = [];

lbClear _players;

{
    _side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; default {"Unknown"};};
    _players lbAdd format["%1 - %2", name _x,_side];
    _players lbSetdata [(lbSize _players)-1,str(_x)];
} foreach playableUnits;

_list2 = getControl(2400,2407);
lbClear _list2; //Purge the list

_crimes = [[localize "STR_D41_Crime_No_Driving_license","1500","1"],[localize "STR_D41_Crime_Drugged_Driving","2000","2"],[localize "STR_D41_Crime_No_Toolkit","500","7"],[localize "STR_D41_Crime_No_Light","350","4"],[localize "STR_D41_Crime_to_Fast","1000","5"],[localize "STR_D41_Crime_parking","500","11"],[localize "STR_D41_Crime_careless_driving","2500","6"],[localize "STR_D41_Crime_drug_transport","30000","482"],[localize "STR_D41_Crime_fleeing_Police","7500","12"],[localize "STR_D41_Crime_HitandRun","3500","480"],[localize "STR_D41_Crime_insulting","1000","17"],[localize "STR_D41_Crime_Molesting","2000","18"],[localize "STR_D41_Crime_illegal_Firearm","7500","26"],[localize "STR_D41_Crime_no_Firearm_licence","7500","24"],[localize "STR_D41_Crime_Firearm_City","4000","25"],[localize "STR_D41_Crime_distrubance","1000","33"],[localize "STR_D41_Crime_Civil_disorder","10000","15"],[localize "STR_D41_Crime_restricted_Zone","5000","19"],[localize "STR_D41_Crime_complicity","5000","3"],[localize "STR_D41_Crime_Fire_on_Officials","15000","21"],[localize "STR_D41_Crime_destruction","15000","22"],[localize "STR_D41_Crime_attack_person","15000","29"],[localize "STR_D41_Crime_maltreatment","15000","261"],[localize "STR_D41_Crime_tried_maltreatment","7500","261A"],[localize "STR_D41_Crime_illegal_veh","5000","10"],[localize "STR_D41_Crime_hostages","3500","28"],[localize "STR_D41_Crime_roadblock","10000","14"],[localize "STR_D41_Crime_terror","100000","32"],[localize "STR_D41_Crime_noPilot","5000","35"],[localize "STR_D41_Crime_landing_no_fly","5000","9"]];

{
	_list2 lbAdd format["%1 - €%2 (%3)",(_x select 0),(_x select 1),(_x select 2)];
	_list2 lbSetData [(lbSize _list2)-1,(_x select 2)];
} foreach _crimes;

ctrlSetText[2404,"Establishing connection..."];

if(__GETC__(life_coplevel) < 3 && __GETC__(life_adminlevel) == 0) then
{
	ctrlShow[2405,false];
};

[[player],"life_fnc_wantedFetch",false,false] spawn life_fnc_MP; 