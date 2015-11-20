/*
	File: fn_clothing_base_05.sqf
	Author: Tobi "Cosmo" Distrikt41
	
	Description:
	Master configuration file for Base 5 HERO.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Base 5 Kleidung"];


switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[	
			["U_PMC_CombatUniformRS_ChckLB_GPBB",nil,1050],
			["U_PMC_CombatUniformLS_ChckLB_GPBB",nil,1050],
			["U_PMC_WTShirt_DJeans",nil,850],
			["D41_uniform_Functionary2",nil,2000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["LOP_H_Beret_blue",nil,65],
			["H_Hat_blue",nil,65],
			["H_Cap_blu",nil,65],
			["rhs_Booniehat_ucp",nil,65],
			["H_Cap_pmc_headphones",nil,65],
			["H_MilCap_blue",nil,65],
			["rhsusf_mich_bare_norotos_arc_tan_headset",nil,300]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["rhs_googles_clear",nil,2],
			["G_Shades_Blue",nil,2],
			["G_Sport_Blackred",nil,2],
			["G_Sport_Checkered",nil,2],
			["G_Sport_Blackyellow",nil,2],
			["G_Sport_BlackWhite",nil,2],
			["G_Squares",nil,1],
			["G_Lowprofile",nil,20],
			["G_Combat",nil,55],
			["G_Aviator",nil,20]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["LOP_V_Carrier_BLU",nil,1750],
			["rhsusf_iotv_ucp_Medic",nil,2050],
			["V_TacVestIR_blk",nil,860]

		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_Kitbag_rgr",nil,450],
			["B_Kitbag_cbr",nil,450],
			["B_Carryall_oucamo",nil,500],
			["B_Carryall_khk",nil,500],
			["D41_Hero_Backpack_l",nil,2000],
			["D41_Hero_Backpack_d",nil,2000]
		];
	};
};