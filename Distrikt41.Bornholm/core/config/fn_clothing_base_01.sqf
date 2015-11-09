/*
	File: fn_clothing_gangbl.sqf
	Author: Tobi "Cosmo" Distrikt41
	
	Description:
	Master clothing configuration file for Base1.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Base 1 Kleidung"];


switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[	
			["U_BG_Guerilla1_1",nil,450],
			["TFA_atac_fg_rs",nil,1450],
			["TFA_wood_rs",nil,1450],
			["TFA_wood",nil,1450]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Shemag_olive_hs",nil,80],
			["H_MilCap_dgtl",nil,65],
			["H_Bandanna_camo",nil,65],
			["H_Booniehat_dgtl",nil,80],
			["rhsusf_ach_helmet_M81",nil,300],			
			["H_HelmetB",nil,300],
			["H_HelmetSpecB_paint1",nil,300]
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
			["TFAx_PlateCarrierH_Grn",nil,1750],
			["V_PlateCarrier_Kerry",nil,1550]

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