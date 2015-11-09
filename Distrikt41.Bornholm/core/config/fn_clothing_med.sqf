#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Medical Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushback ["D41_medic_man_uniform",nil,30];
		_ret pushback ["D41_medic_man_uniform2",nil,30];
		_ret pushback ["D41_uniform_doctor",nil,300];
		_ret pushback ["U_B_Wetsuit",nil,400];
	};
	
	//Hats
	case 1:
	{
		_ret pushback ["D41_Medic_Beret_01",nil,75];
		_ret pushback ["H_Cap_red",nil,75];
		_ret pushback ["H_Cap_blk",nil,75];
		_ret pushback ["LOP_H_SLA_beret",nil,75];
		_ret pushback ["D41_pilot_helmet",nil,120];
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Aviator",nil,75],
			["G_Diving",nil,75],
			["G_Squares",nil,10]
		];
	};
	
	//Vest
	case 3:
	{
		_ret = 
		[
			["rhs_6sh46",nil,50],
			["V_RebreatherB",nil,50]
		];
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_MedicBergen_sgg",nil,400]
		];
	};
};

_ret;