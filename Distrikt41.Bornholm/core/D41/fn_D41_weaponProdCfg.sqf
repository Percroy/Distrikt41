#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Distrikt41 - Dscha
	Description:
	Preisliste für Waffenproduktion
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[Klassenname,Custom Name (set nil for default),Kosten]
	]]
*/
private["_shop"];
	_shop = [_this,0,"",[""]] call BIS_fnc_param;
	if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

	if(playerSide != civilian)exitWith{localize "STR_Shop_NotaCiv"};
	if(!license_civ_WKompL)exitWith{localize "STR_D41_WeaponProd_licence"};
	
	if((playerSide in [civilian]) && (life_D41_Karma > 2000))exitWith
		{
			[localize "STR_D41_WeaponProd", //Waffenproduktion Heros und Zivis
				[
					//Handfeuerwaffen
					["D41_Schuerfgeschirr","Schuerfgeschirr",2],
					["D41_Bohrausruestung","Bohrausruestung",7],
					["Chemlight_red","Knicklicht Rot",2],
					["RH_g19t","Glock 19 Tan",3],
					["RH_19Rnd_9x19_g18",nil,1],
					["RH_kimber_nw","1911 Black",5],
					["RH_7Rnd_45cal_m1911",nil,2],
				
					//Schusswaffen
					["SMG_01_F","Vermin SMG",24],
					["30Rnd_45ACP_Mag_SMG_01",nil,4],
					["D41_sgun_M1014","Beneli Shotgun",20],
					["D41_8Rnd_B_Beneli_Pepperbag","Gummigeschoss",3],
					["CUP_arifle_Mk16_CQC_SFG","Mk16 CQC SFG",50],
					["CUP_arifle_Mk16_SV","Mk16 SV",70],
					["CUP_20Rnd_556x45_Stanag",nil,5],
					["CUP_1Rnd_SmokeGreen_M203","Smoke Shell Green",3],
					["CUP_srifle_LeeEnfield","Lee Enfield",45],
					["CUP_10x_303_M",nil,3],

					//Zubehör
					["optic_Arco","RCO Visier",14],	
					["RH_eotech553mag_tan","Eotech 553 Visier",10],
					["bipod_02_F_tan","Bipod Tan",7]
				]
			];
		};
	if((playerSide in [civilian]) && (license_civ_rebel))exitWith
	{
		[localize "STR_D41_WeaponProd", //Waffenproduktion Rebellen und Banditen
			[
				["D41_Bolzenschneider","Bolzenschneider",2],
				["D41_Sprengladung","Sprengladung Bank",15],
				["Rangefinder","Rangefinder",3],
				
				//Handfeuerwaffen
				["RH_g19t","Glock 19 Tan",3],
				["RH_19Rnd_9x19_g18",nil,1],
				["RH_uspm","1911 Black",5],
				["RH_16Rnd_40cal_usp",nil,2],
				["RH_X300","Licht Pistole",1],
				["hlc_smg_mp5k_PDW","MP5K PDW",22],
				["hlc_30Rnd_9x19_GD_MP5",nil,4],
				["CUP_optic_CompM2_Black","CCO Visier Schwarz",2],
			
				//Sturmgewehr
				["CUP_arifle_L85A2","L85 A2",38],
				["CUP_arifle_L86A2","L86 A2",38],
				["30Rnd_556x45_Stanag",nil,7],
				["rhs_weap_ak74m_camo_npz","AK74M Camo NPZ",50],
				["rhs_30Rnd_545x39_AK_green",nil,7],
				
				//Sniper
				["CUP_srifle_M40A3","M40A3",80],
				["CUP_5Rnd_762x51_M24",nil,14],
				["hlc_rifle_SAMR","RRA LLR-15",40],
				["30Rnd_556x45_Stanag_Tracer_Red",nil,7],
				["optic_Arco",nil,14],
				
				//Battlerifle
				["RH_ar10","AR-10",60], 
				["RH_Delft",nil,8],
				["RH_20Rnd_762x51_AR10",nil,8],						
				
				//MG
				["hlc_rifle_RPK12","RPK12",160], 
				["hlc_45Rnd_545x39_t_rpk",nil,20],
				["bipod_02_F_hex","Bipod Hex",7]						
			]
		];
	};
	if(true)then{""};