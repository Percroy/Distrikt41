#include <macro.h>
/*
	File: fn_clothing_cop_swat.sqf
	Author: D41 Cosmo
	
	Description:
	Master config file for SWAT clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"SWAT Clothing"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(!license_cop_gangfirma && license_cop_swat) then
		{
			_ret pushback ["D41_swat_man_uniform","Swat Uniform",1000];
			_ret pushback ["D41_swat_leader_uniform","Swat Leader",1000];
			_ret pushback ["D41_swat_sniper_uniform","Swat Sniper",1000];
			_ret pushback ["TFA_ger_trop","Swat Green",1000];
			_ret pushback ["TFA_ger_trop_rs","Swat Green Short",1000];
			_ret pushback ["U_O_FullGhillie_lsh","Full Ghillie Dark",3000];
			_ret pushback ["U_O_FullGhillie_sard","Full Ghillie Light",3000];
		};
	};
	
	//Hats
	case 1:
	{
		if(!license_cop_gangfirma && license_cop_swat) then
		{
			_ret pushback ["D41_sniper_cap",nil,1000];
			_ret pushback ["D41_swat_helmet",nil,1000];
			_ret pushback ["H_Watchcap_blk",nil,500];
			_ret pushback ["H_Watchcap_camo",nil,500];
			_ret pushback ["H_Cap_oli_hs",nil,500];
			_ret pushback ["rhs_Booniehat_marpatwd",nil,500];
			_ret pushback ["H_Bandanna_khk_hs",nil,500];
			_ret pushback ["TFAX_H_HelmetIA_ger",nil,1000];
		};
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
		if(!license_cop_gangfirma && license_cop_swat) then
		{
			_ret pushback ["G_Bandanna_shades",nil,200];
			_ret pushback ["G_Bandanna_sport",nil,200];
			_ret pushback ["G_Balaclava_blk",nil,200];
			_ret pushback ["G_Balaclava_combat",nil,200];
			_ret pushback ["G_Balaclava_lowprofile",nil,200];
		};
	};
	
	//Vest
	case 3:
	{
		if(!license_cop_gangfirma && license_cop_swat) then
		{
			_ret pushback ["D41_swat_vest","Swat Vest",6000];
			_ret pushback ["D41_sniper_vest","Swat Sniper",4000];
			_ret pushback ["TFAx_PlateCarrierH_Ger_Wdl","Swat Vest Green",6000];
			_ret pushback ["V_PlateCarrierGL_blk","High Risk Black",12000];
			_ret pushback ["V_PlateCarrierGL_mtp","High Risk Green",12000];
		};
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