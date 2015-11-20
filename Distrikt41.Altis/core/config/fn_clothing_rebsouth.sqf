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
ctrlSetText[3103,"Rebellenlager Süd"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		if(life_D41_Karma < -2000) then
		{
			_ret pushback ["LOP_U_ChDKZ_Bardak",nil,550];
			_ret pushback ["LOP_U_ChDKZ_Fatigue_01",nil,550];
			_ret pushback ["LOP_U_ChDKZ_Fatigue_02",nil,550];
			_ret pushback ["LOP_U_ChDKZ_Fatigue_03",nil,550];
			_ret pushback ["LOP_U_ChDKZ_Fatigue_04",nil,550];
			_ret pushback ["rhs_uniform_msv_emr",nil,1150];
		};
		if(life_D41_Karma < -5000) then
		{
			_ret pushback ["rhs_uniform_vdv_flora",nil,1150];
			_ret pushback ["rhs_uniform_FROG01_wd",nil,1234];
		};
		if(life_D41_Karma < -8000) then
		{
			_ret pushback ["U_O_CombatUniform_ocamo",nil,8000];
		};
		if(life_D41_Karma < -10000) then
		{
			_ret pushback ["U_I_GhillieSuit",nil,15000];
		};
	};


	//Hats
	case 1:
	
	{
		if(life_D41_Karma < -2000) then
		{
			_ret pushback ["rhs_fieldcap",nil,120];
			_ret pushback ["D41_worker_cap4",nil,120];
			_ret pushback ["D41_worker_cap3",nil,120];
			_ret pushback ["H_Booniehat_mcamo",nil,120];
			_ret pushback ["H_Booniehat_dgtl",nil,130];
			_ret pushback ["H_Bandanna_camo",nil,65];
			_ret pushback ["H_Bandanna_khk_hs",nil,120];
			_ret pushback ["rhs_tsh4_ess",nil,120];
		};
		if(life_D41_Karma < -5000) then
		{
			_ret pushback ["H_MilCap_ocamo",nil,120];
			_ret pushback ["rhs_beanie",nil,120];
			_ret pushback ["H_ShemagOpen_khk",nil,80];
			_ret pushback ["H_ShemagOpen_tan",nil,85];
			_ret pushback ["H_Shemag_olive",nil,85];
			_ret pushback ["LOP_H_SSh68Helmet_BLK",nil,320];
			_ret pushback ["rhs_6b27m_ess",nil,550];
		};
		if(life_D41_Karma < -8000) then
		{
			_ret pushback ["rhs_6b27m_ess_bala",nil,700];
			_ret pushback ["rhsusf_ach_bare_wood_headset",nil,600];
			_ret pushback ["rhsusf_ach_helmet_M81",nil,620];
			_ret pushback ["LOP_H_Bardak_beret",nil,350];
		};
	};
	

	//Glasses
	case 2:
	{
		if(life_D41_Karma < -2000) then
		{
			_ret pushback ["G_Shades_Black",nil,2];
			_ret pushback ["G_Shades_Blue",nil,2];
			_ret pushback ["G_Sport_Blackred",nil,2];
			_ret pushback ["G_Sport_Checkered",nil,2];
			_ret pushback ["G_Sport_Blackyellow",nil,2];
			_ret pushback ["G_Sport_BlackWhite",nil,20];
			_ret pushback ["G_Aviator",nil,20];
			_ret pushback ["G_Squares",nil,1];
			_ret pushback ["G_Balaclava_oli",nil,220];
			_ret pushback ["G_Bandanna_shades",nil,220];
			_ret pushback ["G_Bandanna_sport",nil,220];
			_ret pushback ["G_Bandanna_tan",nil,220];
			_ret pushback ["G_Bandanna_beast",nil,1300];
			_ret pushback ["G_Combat",nil,55];
		};
	};
	
	//Vest
	case 3:
	{
		if(life_D41_Karma < -2000) then
		{
			_ret pushback ["V_TacVest_khk",nil,1250];
			_ret pushback ["V_TacVest_camo",nil,1250];
			_ret pushback ["V_I_G_resistanceLeader_F",nil,450];
			_ret pushback ["V_BandollierB_cbr",nil,450];
			_ret pushback ["V_BandollierB_blk",nil,450];
			_ret pushback ["V_BandollierB_khk",nil,450];
			_ret pushback ["V_BandollierB_rgr",nil,450];
		};
		if(life_D41_Karma < -5000) then
		{
			_ret pushback ["V_HarnessOGL_brn",nil,750];
			_ret pushback ["V_HarnessO_brn",nil,750];
			_ret pushback ["rhs_6b23_6sh92_headset",nil,4500];
			_ret pushback ["rhs_6b23_digi_6sh92_radio",nil,4500];
		};
		if(life_D41_Karma < -8000) then
		{
			_ret pushback ["V_PlateCarrier1_rgr",nil,5500];
			_ret pushback ["V_PlateCarrier1_blk",nil,5500];
		};
		if(life_D41_Karma < -10000) then
		{
			_ret pushback ["V_PlateCarrier2_rgr",nil,12000];
		};
	};


	//Backpacks
	case 4:
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
};

_ret;