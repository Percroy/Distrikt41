/*
	File: fn_clothing_work.sqf
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
			["D41_uniform_Woodlander1",localize "STR_D41_Leather_jacket_1",85],
			["D41_uniform_Woodlander2",localize "STR_D41_Leather_jacket_2",87],
			["D41_uniform_Woodlander3",localize "STR_D41_Leather_jacket_3",85],
			["D41_uniform_Woodlander4",localize "STR_D41_Leather_jacket_4",87],
			["D41_uniform_Villager1",localize "STR_D41_Shirt_Blue",62],
			["D41_uniform_Villager2",localize "STR_D41_Shirt_brown",65],
			["D41_uniform_Villager3",localize "STR_D41_Shirt_green",65],
			["D41_uniform_Villager4",localize "STR_D41_shirt_White",65],
			["D41_uniform_schoolteacher",nil,130],
			["D41_uniform_assistant",nil,150],
			["U_C_WorkerCoveralls",nil,250],
			["D41_uniform_Policeman",localize "STR_D41_security",550],
			["D41_uniform_priest",nil,890]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_MilCap_blue",localize "STR_D41_Security_Cap",52],
			["H_Cap_marshal",localize "STR_D41_Hearing_hat",42],
			["H_HelmetCrew_I",localize "STR_D41_Safety_helmet",442],
			["H_Hat_grey",nil,32]
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