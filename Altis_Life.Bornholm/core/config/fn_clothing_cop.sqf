#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Polizei Bekleidung"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret set[count _ret,["U_O_Wetsuit",nil,1000]];
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 0) then
		{
			_ret set[count _ret,["D41_police_man_uniform",nil,300]];
		};
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 5) then
		{
			_ret set[count _ret,["LOP_U_ISIS_Fatigue_04","Zivilfahnder 1",600]];
			_ret set[count _ret,["U_PMC_CombatUniformRS_GSBPBB","Zivilfahnder 2",600]];
		};
		if(!license_cop_gangfirma && license_cop_swat) then
		{
			_ret set[count _ret,["D41_swat_man_uniform",nil,1000]];
			_ret set[count _ret,["D41_swat_leader_uniform",nil,1000]];
			_ret set[count _ret,["D41_swat_sniper_uniform",nil,1000]];
			_ret set[count _ret,["TFA_ger_trop",nil,1000]];
			_ret set[count _ret,["TFA_ger_trop_rs",nil,1000]];
			_ret set[count _ret,["U_O_GhillieSuit",nil,3000]];
		};
		if(!license_cop_gangfirma && license_cop_air) then
		{
			_ret set[count _ret,["D41_pilot_uniform","Pilotenuniform",1000]];
		};
	};
	
	//Hats
	case 1:
	{
		_ret set[count _ret,["H_Cap_blk",nil,75]];
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["H_Beret_blk_POLICE",nil,100]];
			_ret set[count _ret,["LOP_H_PASGTHelmet_BLU","Schutzhelm",1000]];
		};		
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["H_Beret_02",nil,200]];
		};
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 9) then
		{
			_ret set[count _ret,["H_Beret_Colonel",nil,500]];
		};
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 10) then
		{
			_ret set[count _ret,["D41_police_cap",nil,500]];
		};
		if(!license_cop_gangfirma && license_cop_swat) then
		{
			_ret set[count _ret,["D41_sniper_cap","Sniper Cap",1000]];
			_ret set[count _ret,["D41_swat_helmet","Swat Helmet 1",1000]];
			_ret set[count _ret,["H_Watchcap_blk",nil,500]];
			_ret set[count _ret,["H_Watchcap_camo",nil,500]];
			_ret set[count _ret,["H_Cap_oli_hs",nil,500]];
			_ret set[count _ret,["rhs_Booniehat_ocp",nil,500]];
			_ret set[count _ret,["H_Bandanna_khk_hs",nil,500]];
			_ret set[count _ret,["TFAX_H_HelmetIA_ger",nil,1000]];
			_ret set[count _ret,["TFAX_H_HelmetIA_US_wood",nil,1000]];
		};
		if(!license_cop_gangfirma && license_cop_air) then
		{
			_ret set[count _ret,["D41_pilot_helmet","Pilotenhelm",1000]];
			_ret set[count _ret,["H_CrewHelmetHeli_B","Pilotenhelm 2",1000]];
			_ret set[count _ret,["H_PilotHelmetHeli_B","Pilotenhelm 3",1000]];
		};
	};
	
	//Glasses
	case 2:
	{
			_ret set[count _ret,["G_Shades_Black",nil,25]];
			_ret set[count _ret,["G_Aviator",nil,25]];
			_ret set[count _ret,["G_Squares",nil,25]];
			_ret set[count _ret,["G_Lowprofile",nil,25]];
			_ret set[count _ret,["G_Combat",nil,25]];
			_ret set[count _ret,["G_Diving",nil,75]];
		if(!license_cop_gangfirma && license_cop_swat) then
		{
			_ret set[count _ret,["G_Balaclava_blk",nil,200]];
			_ret set[count _ret,["G_Balaclava_combat",nil,200]];
			_ret set[count _ret,["G_Balaclava_lowprofile",nil,200]];
			_ret set[count _ret,["G_Bandanna_blk",nil,200]];
			_ret set[count _ret,["G_Balaclava_lowprofile",nil,200]];
		};
	};
	
	//Vest
	case 3:
	{
		_ret set[count _ret,["D41_police_belt","Tiefziehholster",500]];
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 0) then
		{
			_ret set[count _ret,["D41_police_vest","Schutzweste",1000]];
		};
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["V_PlateCarrier2_rgr",nil,5000]];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_ret set[count _ret,["V_PlateCarrierIAGL_dgtl",nil,10000]];
		};
		if(!license_cop_gangfirma && license_cop_swat) then
		{
			_ret set[count _ret,["D41_swat_vest","SWAT Weste",8000]];
			_ret set[count _ret,["D41_sniper_vest","Sniper Weste",4000]];
			_ret set[count _ret,["V_PlateCarrier1_blk",nil,8000]];
			_ret set[count _ret,["TFAx_PlateCarrierH_Ger_Wdl",nil,8000]];
			_ret set[count _ret,["TFAx_PlateCarrier_fol",nil,8000]];
		};
		_ret set[count _ret,["V_RebreatherIA",nil,5000]];
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_TacticalPack_blk",nil,300],
			["B_Kitbag_blk",nil,300],
			["B_Kitbag_rgr",nil,300],
			["B_Parachute",nil,300],
			["B_UAV_01_backpack_F",nil,15000]
		];
	};
};

_ret;