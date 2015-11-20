/*
	File: fn_clothing_ganghda.sqf
	Author: Tobi "Cosmo" Distrikt41
	
	Description:
	Master configuration file for Base 4.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Base 4 Kleidung"];


switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[	
			["U_PMC_BluPolo_GrnPants",nil,450],
			["U_PMC_BluTShirt_SJeans",nil,450],
			["U_PMC_CombatUniformRS_GSBPBB",nil,1050],
			["U_PMC_CombatUniformLS_GSBPBB",nil,1050],
			["TFA_US_Tiger_RS",nil,1450]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_ShemagOpen_tan",nil,80],
			["H_Cap_blk",nil,65],
			["H_Bandanna_gry",nil,65],
			["rhs_Booniehat_digi",nil,80],
			["H_HelmetB_light",nil,300],			
			["H_HelmetB_snakeskin",nil,300],
			["TFAX_H_HelmetIA_US_tiger",nil,300]
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
			["TFAx_PlateCarrier_grn",nil,1750],
			["V_PlateCarrierIA2_dgtl",nil,1550]

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