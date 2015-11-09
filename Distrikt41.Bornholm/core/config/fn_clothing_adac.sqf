/*
	File: fn_clothing_gangadac.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for ADAC.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"ADAC Kleidung"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["D41_ADAC_man_uniform",nil,10],
			["D41_ADAC_man_uniform2",nil,10],
			["rds_uniform_assistant","Werkstatt Kittel",50]
			
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_marshal",nil,85],
			["H_Cap_tan",nil,85],
			["H_Cap_blk",nil,85],
			["LOP_H_Bardak_beret",nil,85],
			["H_Beret_blk",nil,85],
			["D41_worker_cap2",nil,85],
			["H_RacingHelmet_1_yellow_F",nil,85],
			["rhs_gssh18",nil,55]
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
			["Pomi_Goggles_Snd",nil,2],
			["G_Tactical_Black",nil,2],
			["G_Squares",nil,1],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["rhs_6sh46",nil,50]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["rhs_assault_umbts_engineer",nil,250],
			["B_Carryall_khk",nil,500]
		];
	};
};