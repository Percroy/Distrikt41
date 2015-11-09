/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Hero Kleidung"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(life_D41_Karma > 2000) then
		{
			_ret pushback ["U_PMC_WTShirt_DJeans",nil,550];
			_ret pushback ["U_PMC_WhtPolo_BgPants",nil,550];
			_ret pushback ["U_PMC_BluePlaidShirt_BeigeCords",nil,550];
			_ret pushback ["U_PMC_GTShirt_SJeans",nil,550];
			_ret pushback ["U_PMC_BgPolo_GrnPants",nil,550];
			_ret pushback ["U_PMC_BlkTShirt_SJeans",nil,550];
			_ret pushback ["U_PMC_BgPolo_GrnPants",nil,550];
		};
		if(life_D41_Karma > 5000) then
		{
			_ret pushback ["U_PMC_CombatUniformLS_ChckDBS_GPSB",nil,1234];
			_ret pushback ["U_PMC_CombatUniformLS_ChckLR_SPBB",nil,1234];
			_ret pushback ["U_PMC_CombatUniformRS_SSGPBB",nil,1234];
			_ret pushback ["U_PMC_CombatUniformLS_ChckP_BPBB",nil,1234];
			_ret pushback ["U_PMC_CombatUniformRS_ChckLR_SPBB",nil,1234];
			_ret pushback ["U_PMC_CombatUniformLS_ChckP_BPBB",nil,1234];
		};
		if(life_D41_Karma > 8000) then
		{
			_ret pushback ["TFA_uk_des",nil,3000];
		};
	};
	
	//Hats
	case 1:
	{
		if(life_D41_Karma > 2000) then
		{
			_ret pushback ["H_Booniehat_DMARPAT",nil,85];
			_ret pushback ["H_Cap_blu",nil,85];
			_ret pushback ["H_MilCap_gry",nil,80];
			_ret pushback ["rhsusf_patrolcap_ucp",nil,85];
			
		};
		if(life_D41_Karma > 5000) then
		{
			_ret pushback ["LOP_H_PASGTHelmet_TAN",nil,320];
		};
		if(life_D41_Karma > 8000) then
		{
			_ret pushback ["rhsusf_ach_helmet_ucp",nil,520];
			_ret pushback ["rhsusf_ach_helmet_headset_ucp",nil,530];
			_ret pushback ["rhsusf_ach_helmet_headset_ess_ucp",nil,565];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret pushback ["G_Shades_Black",nil,2];
		_ret pushback ["G_Shades_Blue",nil,2];
		_ret pushback ["G_Sport_Blackred",nil,2];
		_ret pushback ["G_Sport_Checkered",nil,2];
		_ret pushback ["G_Sport_Blackyellow",nil,2];
		_ret pushback ["G_Sport_BlackWhite",nil,20];
		_ret pushback ["G_Tactical_Black",nil,20];
		_ret pushback ["Pomi_Goggles",nil,55];
		_ret pushback ["Pomi_Goggles_Snd",nil,55];
	};
	
	//Vest
	case 3:
	{
		if(life_D41_Karma > 2000) then
		{
			_ret pushback ["V_TacVest_brn",nil,1250];
			_ret pushback ["V_TacVest_darkblck",nil,1250];
			_ret pushback ["LOP_V_Carrier_BLU",nil,2500];
			_ret pushback ["LOP_V_Carrier_TAN",nil,2500];
			_ret pushback ["LOP_V_Carrier_OLV",nil,2500];
			
		};
		if (life_D41_Karma > 6000) then
		{
			_ret pushback ["rhsusf_iotv_ucp",nil,3000];
		};
		if (life_D41_Karma > 10000) then
		{
			_ret pushback ["V_PlateCarrier1_PMC_coyote",nil,4000];
		};
	};
	
	//Backpacks
	case 4:
	{
		if(life_D41_Karma > 2000) then
		{
			_ret pushback ["B_AssaultPack_cbr",nil,250];
			_ret pushback ["B_Kitbag_mcamo",nil,450];
			_ret pushback ["B_TacticalPack_oli",nil,350];
			_ret pushback ["B_TacticalPack_ocamo",nil,350];
			_ret pushback ["B_FieldPack_ocamo",nil,300];
			_ret pushback ["B_Bergen_sgg",nil,450];
			_ret pushback ["B_Kitbag_cbr",nil,450];
			_ret pushback ["B_Kitbag_mcamo",nil,450];
			_ret pushback ["B_Carryall_oli",nil,500];
			_ret pushback ["B_Carryall_khk",nil,500];
		};
		if (life_D41_Karma > 6000) then
		{
			_ret pushback ["D41_Hero_Backpack_l",nil,2000];
			_ret pushback ["D41_Hero_Backpack_d",nil,2000];
		};	
	};
};

_ret;