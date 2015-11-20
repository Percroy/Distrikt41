/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_PMC_GTShirt_DJeans","Shirt Jeans",250],
			["U_PMC_RedPlaidShirt_DenimCords",localize "STR_D41_Red_check",250],
			["LOP_U_ChDKZ_Fatigue_04",nil,250],
			["D41_uniform_citizen1",localize "STR_D41_Leather_Jacket_1",25],
			["D41_uniform_citizen2",(localize "STR_D41_Leather_Jacket_2"),25],
			["D41_uniform_citizen3",localize "STR_D41_Leather_Jacket_3",25],
			["D41_uniform_citizen4",(localize "STR_D41_Leather_Jacket_4"),25],
			["U_C_Journalist","Polo Shirt",250],
			["D41_uniform_Profiteer1","Joging Jacke 1",25],
			["D41_uniform_Profiteer2","Joging Jacke 2",25],
			["D41_uniform_Profiteer3","Joging Jacke 3",25],
			["D41_uniform_Profiteer4","Joging Jacke 4",25],
			["LOP_U_Civ_01","African Shirts 1",25],
			["LOP_U_Civ_02","African Shirts 2",25],
			["LOP_U_Civ_03","African Shirts 3",25],
			["LOP_U_Civ_04","African Shirts 4",25],
			["LOP_U_Civ_05","African Shirts 5",25],
			["LOP_U_Civ_06","African Shirts 6",25],
			["U_Rangemaster",nil,25],
			["U_PMC_BluTShirt_SJeans",nil,25],
			["D41_uniform_Villager1",nil,250],
			["D41_uniform_Villager2",nil,250],
			["D41_uniform_Villager3",nil,250],
			["D41_uniform_Villager4",nil,250],
			["D41_uniform_Woodlander1",nil,250],
			["D41_uniform_Woodlander2",nil,250],
			["D41_uniform_Woodlander4",nil,250],
			["U_C_Poor_2",nil,25],
			["U_IG_Guerilla2_2",localize "STR_D41_Green_Striped_Shirt",650],
			["U_IG_Guerilla3_1",localize "STR_D41_Beown_Jacket",730],
			["U_IG_Guerilla2_3",localize "STR_D41_HillBilly",720],
			["U_C_HunterBody_grn",nil,750],
			["U_OrestesBody","Skaterboy",810]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Bandanna_camo",nil,12],
			["H_Bandanna_surfer",nil,13],
			["H_Bandanna_gry",nil,15],
			["H_Bandanna_cbr",nil,16],
			["H_Bandanna_surfer",nil,13],
			["H_Bandanna_khk",nil,14],
			["H_Bandanna_sgg",nil,16],
			["H_StrawHat",nil,22],
			["H_BandMask_blk",nil,30],
			["H_Booniehat_tan",nil,42],
			["rhs_tsh4",localize "STR_D41_Leather_Cap",80],
			["LOP_H_Pakol",nil,15],
			["H_Capbw_pmc",nil,31],
			["H_Hat_blue",nil,31],
			["H_Hat_brown",nil,27],
			["H_Hat_checker",nil,34],
			["H_Hat_grey",nil,28],
			["H_Hat_tan",nil,26],
			["H_Cap_blu",nil,15],
			["H_Cap_grn",nil,15],
			["H_Cap_grn_BI",nil,15],
			["H_Cap_oli",nil,15],
			["H_Cap_red",nil,15],
			["H_Cap_tan",nil,15]
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
			["G_Aviator",nil,10],
			["G_Lady_Mirror",nil,15],
			["G_Lady_Dark",nil,15],
			["G_Lady_Blue",nil,15],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
		["rhs_6sh46",nil,250],
		["rhs_vest_commander",nil,350],
		["V_Rangemaster_belt",nil,450],
		["rhs_vydra_3m",nil,650],
		["V_TacVest_brn",nil,650],
		["V_TacVest_blk",nil,650]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["rhs_sidor",nil,200],
			["B_AssaultPack_cbr",nil,250],
			["B_Kitbag_mcamo",nil,450],
			["B_TacticalPack_oli",nil,350],
			["B_FieldPack_ocamo",nil,300],
			["B_Bergen_sgg",nil,450],
			["B_Kitbag_cbr",nil,450],
			["B_Carryall_oli",nil,500],
			["B_Carryall_khk",nil,500],
			["B_Parachute",nil,500]
		];
	};
};