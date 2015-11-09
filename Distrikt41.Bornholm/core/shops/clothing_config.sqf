/*
	File: fn_clothingConfig.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config for clothing shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["U_C_Poloshirt_blue","Poloshirt Blue",25],
		["U_C_Poloshirt_burgundy","Poloshirt Burgundy",27],
		["U_C_Poloshirt_redwhite","Poloshirt Red/White",15],
		["U_C_Poloshirt_salmon","Poloshirt Salmon",17],
		["U_C_Poloshirt_stripped","Poloshirt stripped",12],
		["U_C_Poloshirt_tricolour","Poloshirt Tricolor",35],
		["U_C_Poor_2","Rag tagged clothes",25],
		["U_IG_Guerilla2_2","Green stripped shirt & Pants",65],
		["U_IG_Guerilla3_1","Brown Jacket & Pants",73],
		["U_IG_Guerilla2_3","The Outback Rangler",120],
		["U_C_HunterBody_grn","The Hunters Look",150],
		["U_C_WorkerCoveralls","Mechanic Coveralls",250],
		["U_OrestesBody","Surfing On Land",110]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Bandanna_camo","Camo Bandanna",12],
			["H_Bandanna_surfer","Surfer Bandanna",13],
			["H_Bandanna_gry","Grey Bandanna",15],
			["H_Bandanna_khk","Khaki Bandanna",14],
			["H_Bandanna_sgg","Sage Bandanna",16],
			["H_StrawHat","Straw Fedora",22],
			["H_BandMask_blk","Hat & Bandanna",30]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,0],
			["G_Shades_Blue",nil,0],
			["G_Sport_Blackred",nil,0],
			["G_Sport_Checkered",nil,0],
			["G_Sport_Blackyellow",nil,0],
			["G_Sport_BlackWhite",nil,0],
			["G_Squares",nil,0],
			["G_Lowprofile",nil,0],
			["G_Combat",nil,0]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_PlateCarrierIA1_dgtl",nil,250],
			["V_PlateCarrierIA2_dgtl",nil,150]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_Kitbag_mcamo",nil,125],
			["B_FieldPack_ocamo",nil,300],
			["B_Bergen_sgg",nil,500]
		];
	};
};