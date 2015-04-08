#include <macro.h>
/*
	File: fn_clothing_gangfirma.sqf

	
	Description:
	Firma-Security Kleidung
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Firma Kleidung"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(license_cop_gangfirma) then
		{
			_ret set[count _ret,["U_PMC_CombatUniformLS_BSGPSB","Streife 1",500]];
			_ret set[count _ret,["U_PMC_CombatUniformRS_BSGPSB","Streife 2",500]];
			_ret set[count _ret,["U_PMC_BlckPolo_BluPants","Zivil 1",500]];
			_ret set[count _ret,["LOP_U_ISIS_Fatigue_01","Zivil 2",500]];
			_ret set[count _ret,["rds_uniform_Functionary1","Anzug",500]];
		};
		if(license_cop_gangfirma && license_cop_air) then
		{
			_ret set[count _ret,["U_B_HeliPilotCoveralls","Pilotenuniform 1",1000]];
			_ret set[count _ret,["U_O_PilotCoveralls","Pilotenuniform 2",1000]];
		};
	};
	
	//Hats
	case 1:
	{
		if((call life_coplevel) > 4) then
		{
			_ret set[count _ret,["H_Beret_02",nil,200]];
		};
		if(license_cop_gangfirma) then
		{
			_ret set[count _ret,["H_Cap_pmc_headphones",nil,75]];
			_ret set[count _ret,["H_Booniehat_khk_hs",nil,75]];
			_ret set[count _ret,["D41_sniper_cap",nil,75]];
			_ret set[count _ret,["H_Beret_02",nil,300]];
			_ret set[count _ret,["D41_swat_leader_helmet","Einsatzhelm 1",1000]];
			_ret set[count _ret,["LOP_H_PASGTHelmet_OLV","Einsatzhelm 2",1000]];
		};
		if(license_cop_gangfirma && license_cop_air) then
		{
			_ret set[count _ret,["H_Cap_headphones","Muetze Kopfhoerer",300]];
			_ret set[count _ret,["H_CrewHelmetHeli_B","Pilotenhelm 1",1000]];
			_ret set[count _ret,["H_PilotHelmetHeli_B","Pilotenhelm 2",1000]];
		};
	};
	
	//Glasses
	case 2:
	{
			_ret set[count _ret,["G_Shades_Black",nil,25]];
			_ret set[count _ret,["G_Aviator",nil,25]];
			_ret set[count _ret,["G_Squares",nil,25]];
			_ret set[count _ret,["G_Lowprofile",nil,25]];
			_ret set[count _ret,["G_Combat",nil,25]];
			_ret set[count _ret,["G_Tactical_Clear",nil,25]];
			_ret set[count _ret,["Pomi_Goggles",nil,25]];
			_ret set[count _ret,["G_Bandanna_shades",nil,25]];
			_ret set[count _ret,["G_Balaclava_lowprofile",nil,25]];
	};
	
	//Vest
	case 3:
	{
		if(license_cop_gangfirma) then
		{
			_ret set[count _ret,["D41_police_belt","Tiefziehholster",2000]];
			_ret set[count _ret,["V_PlateCarrier1_PMC_blk","Streifenweste",2000]];
			_ret set[count _ret,["V_PlateCarrierInd_PMC_blk","Einsatzweste",4000]];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_blk",nil,300],
			["B_Parachute",nil,300],
			["B_UAV_01_backpack_F",nil,15000]
		];
	};
};

_ret;