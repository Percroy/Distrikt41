/*
	File: fn_clothing_gangpow.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Base 2.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Base 2 Kleidung"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[	
			["LOP_U_AFR_Fatigue_01",nil,450],
			["U_PMC_CombatUniformLS_IndPBSBB",nil,950],
			["U_PMC_CombatUniformRS_IndPBSBB",nil,950],
			["LOP_U_AFR_Fatigue_04",nil,1450],
			["LOP_U_AFR_Fatigue_04_slv",nil,1450]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["LOP_H_Shemag_IT",nil,80],
			["H_ShemagOpen_tan",nil,80],
			["H_MilCap_dgtl",nil,65],
			["H_Bandanna_camo",nil,65],
			["H_Booniehat_dgtl",nil,80],
			["rhs_Booniehat_m81",nil,80],
			["rhsusf_ach_bare_des_headset_ess",nil,300],
			["rhsusf_ach_bare_des",nil,300]
		];
	};
	
	//Glasses
	case 2:
	{
		[
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
			["G_Balaclava_oli",nil,220]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_PlateCarrier1_PMC_marpat",nil,1750],
			["rhs_6b13_6sh92_vog",nil,2550]

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
			["B_Carryall_khk",nil,500]
		];
	};
};