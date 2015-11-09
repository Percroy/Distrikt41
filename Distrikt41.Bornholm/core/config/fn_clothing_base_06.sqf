/*
	File: fn_clothing_base_06.sqf
	Author: Tobi "Cosmo" Distrikt41
	
	Description:
	Master configuration file for Base 06 = IHV Gang.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"IHV Kleidung"];


switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[	
			["U_PMC_CombatUniformLS_SSBPBB",nil,1050],
			["U_PMC_CombatUniformRS_SSBPBB",nil,1050],
			["D41_IHV_uniform","IHV Uniform",1050],
			["D41_uniform_Functionary1",nil,2000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["LOP_H_SLA_beret",nil,65],
			["H_Cap_tan",nil,65],
			["H_Booniehat_tan",nil,65],
			["H_Cap_pmc_headphones",nil,65],
			["H_MilCap_gry",nil,65],
			["rhs_tsh4",nil,50],			
			["TFAX_H_HelmetIA_US_des",nil,300],
			["rhsusf_cvc_ess",nil,300]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["rhs_googles_clear",nil,2],
			["G_Shades_Black",nil,2],
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
			["TFAx_PlateCarrierH_Black",nil,1750],
			["V_BandollierB_blk",nil,860]

		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_Kitbag_rgr",nil,450],
			["B_Kitbag_cbr",nil,450],
			["B_Carryall_oucamo",nil,500],
			["B_Carryall_oli",nil,500],
			["B_Carryall_khk",nil,500],
			["D41_Hero_Backpack_l",nil,2000],
			["D41_Hero_Backpack_d",nil,2000]
		];
	};
};