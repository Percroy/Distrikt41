/*
	File: fn_clothing_luxus.sqf
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
			["D41_uniform_Profiteer1",localize "STR_D41_Suitjacket_sweatpants_4",250],
			["D41_uniform_Profiteer2",localize "STR_D41_Suitjacket_sweatpants_3",270],
			["D41_uniform_Profiteer3",localize "STR_D41_Suitjacket_sweatpants_2",260],
			["D41_uniform_Profiteer4",localize "STR_D41_Suitjacket_sweatpants_1",260],
			["U_Marshal",localize "STR_D41_white_polo_shirt",2400],
			["U_NikosBody","Playboy",2400],
			["U_NikosAgedBody",localize "STR_D41_Shirt_Tie",4500],
			["D41_uniform_Functionary2",localize "STR_D41_Suit_Gray",9000],
			["D41_uniform_Functionary1",localize "STR_D41_Suit_Black",12000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Hat_brown",localize "STR_D41_Brown_Hat",12],
			["H_Hat_grey",localize "STR_D41_Hat_Green",13]
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
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,250],
			["B_Kitbag_mcamo",nil,450],
			["B_TacticalPack_oli",nil,350],
			["B_FieldPack_ocamo",nil,300],
			["B_Bergen_sgg",nil,450],
			["B_Kitbag_cbr",nil,450],
			["B_Carryall_oli",nil,500],
			["B_Carryall_khk",nil,500]
		];
	};
};