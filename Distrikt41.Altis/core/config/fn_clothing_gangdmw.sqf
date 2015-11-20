/*
	File: fn_clothing_gangdmw.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for DMW Gang.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"DMW Kleidung"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[	
			["U_PMC_CombatUniformRS_IndPBSBB",nil,1150],
			["LOP_U_ChDKZ_Fatigue_02",nil,1150],
			["LOP_U_UA_Fatigue_04",nil,1450],
			["TFA_fra_cce",nil,1450],
			["TFA_fra_cce_rs",nil,1450],
			["U_O_GhillieSuit",nil,5000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["D41_dmw_Beret",nil,85],
			["H_Shemag_khk",nil,85],
			["H_Shemag_tan",nil,85],
			["H_Shemag_olive_hs",nil,80],
			["LOP_H_Shemag_IT",nil,80],
			["H_Bandanna_khk_hs",nil,65],
			["H_Bandanna_camo",nil,65],
			["H_MilCap_oucamo",nil,120],
			["H_MilCap_dgtl",nil,120],
			["H_Cap_brn_SPECOPS",nil,130],
			["H_Watchcap_camo",nil,130],
			["H_Booniehat_mcamo",nil,120],
			["H_Booniehat_indp",nil,130],
			["H_Booniehat_khk",nil,130],
			["H_Booniehat_khk_hs",nil,130],
			["rhs_Booniehat_m81",nil,130],
			["rhsusf_opscore_04_ocp",nil,300],
			["rhsusf_opscore_03_ocp",nil,300],
			["H_HelmetB_light_desert",nil,300],
			["TFAX_H_HelmetIA_fra",nil,300]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["rhs_googles_black",nil,2],
			["G_Shades_Black",nil,2],
			["G_Shades_Blue",nil,2],
			["G_Sport_Blackred",nil,2],
			["G_Sport_Checkered",nil,2],
			["G_Sport_Blackyellow",nil,2],
			["G_Sport_BlackWhite",nil,2],
			["G_Squares",nil,1],
			["G_Lowprofile",nil,20],
			["G_Combat",nil,55],
			["G_Aviator",nil,20],
			["G_Balaclava_oli",nil,220],
			["G_Bandanna_aviator",nil,220],
			["G_Bandanna_blk",nil,220],
			["G_Bandanna_khk",nil,220],
			["G_Bandanna_oli",nil,220],
			["G_Bandanna_shades",nil,220],
			["G_Bandanna_sport",nil,220],
			["G_Bandanna_tan",nil,220],
			["G_Bandanna_beast",nil,1300],
			["G_Balaclava_oli",nil,220],
			["G_Balaclava_combat",nil,200],
			["G_Balaclava_lowprofile",nil,200]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_TacVest_khk",nil,1250],
			["V_TacVest_camo",nil,1250],
			["V_PlateCarrier2_rgr",nil,450],
			["V_PlateCarrierH_CTRG",nil,450],
			["V_PlateCarrier1_blk",nil,450],
			["V_PlateCarrier_Kerry",nil,1750],
			["TFAx_PlateCarrierH_fol",nil,750]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_TacticalPack_ocamo",nil,350],
			["B_FieldPack_ocamo",nil,300],
			["B_Kitbag_rgr",nil,450],
			["B_Kitbag_cbr",nil,450],
			["B_Kitbag_mcamo",nil,450],
			["B_Carryall_oli",nil,500],
			["B_Carryall_khk",nil,500],
			["rhs_assault_umbts_demo",nil,500]
		];
	};
};