#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: D41 Cosmo
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Police Clothing"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 0 && __GETC__(life_coplevel) < 3) then
		{
			_ret pushback ["D41_police_suit_1","Suit Rank 1-2",300];
			_ret pushback ["D41_police_combat_uniform","Combat Uniform",300];
		};
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 2 && __GETC__(life_coplevel) < 5) then
		{
			_ret pushback ["D41_police_suit_2","Suit Rank 3-4",100];
			_ret pushback ["D41_police_combat_uniform","Combat Uniform",300];
		};		
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 4 && __GETC__(life_coplevel) < 8) then
		{
			_ret pushback ["D41_police_suit_3","Suit Rank 5-7",100];
			_ret pushback ["D41_police_combat_uniform","Combat Uniform",300];
		};
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 7 && __GETC__(life_coplevel) < 10) then
		{
			_ret pushback ["D41_police_suit_4","Suit Rank 8-9",100];
			_ret pushback ["D41_police_combat_uniform","Combat Uniform",300];
		};
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 9) then
		{
			_ret pushback ["D41_police_suit_5","Suit Rank 10-11",100];
			_ret pushback ["D41_police_combat_uniform","Combat Uniform",300];
		};
		if(!license_cop_gangfirma && license_cop_air) then
		{
			_ret pushback ["D41_pilot_uniform","Pilot Uniform",1000];
		};
		_ret pushback ["U_O_Wetsuit","Diving Suit",1000];
	};
	
	//Hats
	case 1:
	{
		_ret pushback ["H_Cap_police","Rookie Cap",75];
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 0 && __GETC__(life_coplevel) < 3) then
		{
			_ret pushback ["D41_Police_Beret_01","Beret Rank 1-2",75];
		};
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 2 && __GETC__(life_coplevel) < 5) then
		{
			_ret pushback ["D41_Police_Beret_02","Beret Rank 3-4",100];
		};		
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 4 && __GETC__(life_coplevel) < 8) then
		{
			_ret pushback ["D41_Police_Beret_03","Beret Rank 5-7",200];
		};
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 7 && __GETC__(life_coplevel) < 10) then
		{
			_ret pushback ["D41_Police_Beret_04","Beret Rank 8-9",500];
		};
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 9) then
		{
			_ret pushback ["D41_Police_Beret_05","Beret Rank 10-11",500];
		};
		if(!license_cop_gangfirma && license_cop_air) then
		{
			_ret pushback ["D41_pilot_helmet",nil,1000];
		};
		_ret pushback ["D41_Police_Helmet","Combat Helmet",75]; 
		_ret pushback ["H_PilotHelmetHeli_B","High Risk Helmet Open",75];
		_ret pushback ["H_CrewHelmetHeli_B","High Risk Helmet Closed",75];
	};
	
	//Glasses
	case 2:
	{
			_ret pushback ["G_Shades_Black",nil,25];
			_ret pushback ["G_Aviator","Aviator",25];
			_ret pushback ["G_Squares","Squares",25];
			_ret pushback ["G_Lowprofile","Low Profile",25];
			_ret pushback ["G_Combat","Combat Googles 1",25];
			_ret pushback ["Pomi_Goggles","Combat Googles 2",25];
			_ret pushback ["rhs_googles_black","Ballistic Glasses Black",25];
			_ret pushback ["rhs_googles_clear","Ballistic Glasses Clear",25];
			_ret pushback ["G_Tactical_Clear","Tactical Shades",25];
			_ret pushback ["G_Diving","Diving Googles",75];
	};
	
	//Vest
	case 3:
	{
		_ret pushback ["D41_police_belt","Police Belt",500];
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 0) then
		{
			_ret pushback ["D41_police_vest","Routine Vest",1000];
		};
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 2) then
		{
			_ret pushback ["D41_police_vest_combat","Combat Vest",5000];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret pushback ["V_PlateCarrierSpec_blk","High Risk Vest",10000];
		};
		_ret pushback ["V_RebreatherIA",nil,5000];
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["D41_Cop_BackBelt",nil,300],
			["B_TacticalPack_blk",nil,300],
			["PMC_B_Kitbag_blk",nil,300],
			["B_Kitbag_rgr",nil,300],
			["B_Parachute",nil,300]
		];
	};
};

_ret;