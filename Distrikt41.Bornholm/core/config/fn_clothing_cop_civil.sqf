#include <macro.h>
/*
	File: fn_clothing_cop_civil.sqf
	Author: D41 Cosmo
	
	Description:
	Master config file for Cop CivUndercover clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Undercover Clothing"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 4) then
		{
			_ret pushback ["U_PMC_CombatUniformRS_GSBPBB",nil,600];
			_ret pushback ["U_IG_Guerilla2_2",nil,600];
			_ret pushback ["U_C_HunterBody_grn",nil,600];
			_ret pushback ["U_OrestesBody",nil,600];
			_ret pushback ["U_PMC_RedPlaidShirt_DenimCords",nil,600];
			_ret pushback ["U_PMC_CombatUniformRS_SSGPBB",nil,600];
			_ret pushback ["U_PMC_WhtPolo_BgPants",nil,600];
			_ret pushback ["U_PMC_CombatUniformLS_ChckLR_SPBB",nil,600];
			_ret pushback ["LOP_U_AFR_Fatigue_03",nil,550];
			_ret pushback ["LOP_U_Afg_civ_03",nil,550];
			_ret pushback ["D41_prisoner_uniform",nil,50];
		};
	};
	
	//Hats
	case 1:
	{
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 4) then
		{
			_ret pushback ["H_Shemag_olive_hs",nil,200];
			_ret pushback ["H_Booniehat_dgtl",nil,200];
			_ret pushback ["H_Bandanna_camo",nil,200];
			_ret pushback ["rhs_tsh4",nil,200];
			_ret pushback ["H_Hat_checker",nil,200];
			_ret pushback ["H_Cap_red",nil,200];
			_ret pushback ["LOP_H_Turban",nil,80];
			_ret pushback ["rhsusf_ach_helmet_ucp",nil,200];
			_ret pushback ["rhsusf_ach_helmet_headset_ess_ucp",nil,200];
			_ret pushback ["H_MilCap_gry",nil,200];
		};
	};
	
	//Glasses
	case 2:
	{
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 4) then
		{
			_ret pushback ["G_Shades_Black",nil,25];
			_ret pushback ["G_Shades_Blue",nil,25];
			_ret pushback ["G_Aviator","Aviator",25];
			_ret pushback ["G_Squares","Squares",25];
			_ret pushback ["G_Lowprofile","Low Profile",25];
			_ret pushback ["G_Combat","Combat Googles 1",25];
			_ret pushback ["Pomi_Goggles","Combat Googles 2",25];
			_ret pushback ["G_Sport_Checkered",nil,25];
			_ret pushback ["G_Sport_BlackWhite",nil,25];
			_ret pushback ["G_Lady_Mirror",nil,25];
			_ret pushback ["G_Lady_Blue",nil,25];
			_ret pushback ["G_Balaclava_oli",nil,75];
			_ret pushback ["G_Bandanna_shades",nil,75];
			_ret pushback ["G_Bandanna_sport",nil,75];
			_ret pushback ["G_Bandanna_tan",nil,75];
		};
	};
	
	//Vest
	case 3:
	{
		if(!license_cop_gangfirma && __GETC__(life_coplevel) > 4) then
		{
			_ret pushback ["rhs_6sh46",nil,300];
			_ret pushback ["rhs_vest_commander",nil,300];
			_ret pushback ["LOP_V_Carrier_TAN",nil,1000];
			_ret pushback ["LOP_V_Carrier_OLV",nil,1000];
			_ret pushback ["V_BandollierB_blk",nil,1000];
			_ret pushback ["V_HarnessOGL_brn",nil,1000];
			_ret pushback ["rhsusf_iotv_ocp_Grenadier",nil,1000];
			_ret pushback ["V_PlateCarrierL_CTRG",nil,1000];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Carryall_oli",nil,300],
			["B_Carryall_khk",nil,300],
			["B_Bergen_sgg",nil,300]
		];
	};
};

_ret;