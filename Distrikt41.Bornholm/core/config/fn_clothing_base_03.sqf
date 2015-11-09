/*
	File: fn_clothing_gangdlo.sqf
	Author: Tobi "Cosmo" Distrikt41
	
	Description:
	Master configuration file for Base 3.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Base 3 Kleidung"];


switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[	
			["U_PMC_CombatUniformLS_BSSPSB",nil,450],
			["LOP_U_Afg_civ_03",nil,450],
			["TFA_us_des_RS",nil,1450],
			["TFA_us_des",nil,1450],
			["TFA_jpn_wdl",nil,1450],
			["TFA_jpn_wdl_RS",nil,1450]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["LOP_H_Turban",nil,80],
			["H_ShemagOpen_khk",nil,65],
			["rhs_gssh18",nil,65],
			["H_Booniehat_dgtl",nil,80],
			["H_Booniehat_mcamo",nil,80],
			["H_Cap_tan",nil,80],			
			["TFAX_H_HelmetIA_US_des2",nil,300],
			["TFAX_H_HelmetIA_jpn",nil,300]
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
			["TFAx_PlateCarrierH_Tan",nil,1750]

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
			["B_Carryall_mcamo",nil,500]
		];
	};
};