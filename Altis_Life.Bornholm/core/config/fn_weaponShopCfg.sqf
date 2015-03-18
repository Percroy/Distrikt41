#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "Waffendealer_Pistolen": //Masterwaffenliste für alle Pistolen inkl. Preisen und Magazinen
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (__GETC__(life_adminlevel) < 3): {"Du bist kein Admin!"};
			default
			{
				["Waffendealel Pistolen",
					[
                    //Leichte Pistolen (9mm)
						["RH_m9","Beretta M9",3200],
                        ["RH_15Rnd_9x19_M9",nil,500],
                        ["RH_m9c","Beretta M9 Camo",3200],
                        ["RH_15Rnd_9x19_M9",nil,500],
						["RH_cz75","CZ 75 ",3200],
                        ["RH_16Rnd_9x19_CZ",nil,500],
						["RH_fn57","FN Five-seven",3200],
                        ["RH_fn57_t","FN Five-seven FDE",3200],
                        ["RH_fn57_g","FN Five-seven ODG",3200],
                        ["RH_20Rnd_57x28_FN",nil,500],
						["RH_g17","Glock 17",3200],
                        ["RH_17Rnd_9x19_g17",nil,500],
                        ["RH_g18","Glock 18",3200],
						["RH_33Rnd_9x19_g18",nil,500],
                        ["RH_g19","Glock 19",3200],
                        ["RH_g19t","Glock 19 Tan",3200],
                        ["RH_19Rnd_9x19_g18",nil,500],
						["RH_gsh18","GSH-18",3200],
                        ["RH_18Rnd_9x19_gsh",nil,500],
						["RH_mak","Makarov PM",3200],
                        ["RH_8Rnd_9x18_Mak",nil,500],
						["hgun_P07_F","P07 9mm",3200],
                        ["16Rnd_9x21_Mag",nil,500],
                        ["hgun_Rook40_F","Rook-40 9mm",3200],
                        ["16Rnd_9x21_Mag",nil,500],
						["RH_mk2","Ruger Mk2",3200],
                        ["RH_10Rnd_22LR_mk2",nil,500],
						["RH_p226","Sig P226",3200],
                        ["RH_p226s","Sig P226 Silver",3200],
                        ["RH_15Rnd_9x19_SIG",nil,500],
                        ["RH_sw659","SW 659",3200],
                        ["RH_14Rnd_9x19_sw",nil,500],
						["RH_tt33","TT33",3200],
                        ["RH_8Rnd_762_tt33",nil,500],
						["RH_vp70","VP70",3200],
                        ["RH_18Rnd_9x19_VP",nil,500],
					//Mittlere Pistolen (45er)
						["hgun_Pistol_heavy_01_F","4-five .45",5000],
                        ["11Rnd_45ACP_Mag",nil,1000],
                        ["hgun_ACPC2_F","ACP-C2 .45",5000],
                        ["9Rnd_45ACP_Mag",nil,1000],
						["RH_fnp45","FNP45 Tactical",5000],
                        ["RH_fnp45t","FNP45 Tactical Tan",5000],
                        ["RH_15Rnd_45cal_fnp",nil,1000],
						["RH_kimber","1911 Desert",5000],
                        ["RH_kimber_nw","1911 Black",5000],
                        ["RH_7Rnd_45cal_m1911",nil,1000],
                        ["RH_m1911","M1911",5000],
                        ["RH_7Rnd_45cal_m1911",nil,1000],
						["RH_ttracker","Tracker 455",5000],
                        ["RH_ttracker_g","Tracker 455 Gold",5000],
                        ["RH_6Rnd_45ACP_Mag",nil,1000],
						["RH_usp","USP",5000],
                        ["RH_12Rnd_45cal_usp",nil,1000],
                        ["RH_uspm","USP Match",5000],
                        ["RH_16Rnd_40cal_usp",nil,1000],
						["hgun_Pistol_heavy_02_F","Zubr .45",5000],
                        ["6Rnd_45ACP_Cylinder",nil,1000],
					//Schwere Pistolen (50er)
						["RH_python","Colt Python",8000],
                        ["RH_6Rnd_357_Mag",nil,2000],
                        ["RH_deagle","Desert Eagle",8000],
                        ["RH_Deagleg","Desert Eagle Gold",8000],
                        ["RH_Deaglem","Desert Eagle Modern",8000],
                        ["RH_Deagles","Desert Eagle Silver",8000],
                        ["RH_7Rnd_50_AE",nil,2000],
						["RH_mp412","MP412 REX",8000],
                        ["RH_6Rnd_357_Mag",nil,2000],
						["RH_bull","Raging Bull",8000],
                        ["RH_bullb","Raging Bull Black",8000],
                        ["RH_6Rnd_454_Mag",nil,2000],
						["RH_mateba","Mateba",8000],
                        ["RH_6Rnd_44_Mag",nil,2000],
                    //Attachments
                        ["optic_MRD",nil,1000],
                        ["optic_Yorris",nil,1000],
                        ["RH_docter",nil,1000],
                        ["RH_M6X",nil,1000],
                        ["RH_X2",nil,1000],
                        ["RH_X300",nil,1000],
                        ["RH_Deflash",nil,1000],
						["RH_pmIR",nil,1000],
                        ["muzzle_snds_acp",nil,3200],
                        ["RH_m9qd",nil,3200],
                        ["RH_gemtech9",nil,3200],
                        ["muzzle_snds_L",nil,3200],
                        ["RH_demz",nil,3200],
                        ["RH_sfn57",nil,3200],
                        ["RH_gemtech45",nil,3200],
                        ["RH_osprey",nil,3200],
                        ["RH_pmsd",nil,3200],
                        ["RH_suppr9",nil,3200],
                        ["RH_aacusp",nil,3200],
                        ["RH_fhusp",nil,3200],
                        ["RH_matchsd",nil,3200]
					]
				];
			};
		};
	};
	
	case "Waffendealer_MPs": //Masterwaffenliste für alle MPs inkl. Preisen und Magazinen
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (__GETC__(life_adminlevel) < 3): {"Du bist kein Admin!"};
			default
			{
				["Waffendealel MPs",
					[
					//Leichte MPs
						["RH_vz61","VZ 61 Skorpion",18000],
						["RH_20Rnd_32cal_vz61",nil,3000],
						["RH_muzi","Micro Uzi",18000],
						["RH_30Rnd_9x19_UZI",nil,3000],
						["RH_tec9","Intratec TEC-9",18000],
						["RH_32Rnd_9x19_tec",nil,3000],
					//Mittlere MPs
						["hlc_smg_mp5k_PDW",nil,21000],
						["hlc_30Rnd_9x19_GD_MP5","9mm Hohlspitz",4000],
						["hgun_PDW2000_F","PDW",21000],
						["SMG_02_F","Sting",21000],
						["30Rnd_9x21_Mag",nil,4000],
						["hlc_smg_mp5a2",nil,21000],
						["hlc_smg_mp5a3",nil,21000],
						["hlc_smg_mp5a4",nil,21000],
						["hlc_smg_MP5N",nil,21000],
						["hlc_30Rnd_9x19_B_MP5","9mm Ball",4000],
					//Schwere MPs
						["SMG_01_F","Vermin",25000],
						["30Rnd_45ACP_Mag_SMG_01",nil,5000],
						["hlc_smg_mp510",nil,25000],
						["hlc_30Rnd_10mm_B_MP5",nil,5000],
						["hlc_30Rnd_10mm_JHP_MP5",nil,5000],
						["hlc_smg_mp5sd5",nil,25000],
						["hlc_smg_mp5sd6",nil,25000],
						["hlc_30Rnd_9x19_SD_MP5","9mm Subsonic",5000],
					//Attachments
						["optic_ACO_grn",nil,2000],
						["optic_Aco",nil,2000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["muzzle_snds_L",nil,5000],
						["muzzle_snds_acp",nil,5000],
						["RH_tecsd",nil,5000],
						["hlc_muzzle_Agendasix10mm",nil,5000],
						["hlc_muzzle_Agendasix",nil,5000],
						["hlc_muzzle_Tundra",nil,5000],
						["RH_muzisd",nil,5000]
					]
				];
			};
		};
	};
	
	case "Waffendealer_Sturm_leicht": //Masterwaffenliste für alle leichten Sturmgewehre inkl. Preisen und Magazinen
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (__GETC__(life_adminlevel) < 3): {"Du bist kein Admin!"};
			default
			{
				["Waffendealel Sturm Leicht",
					[	
						["rhs_weap_ak74m_2mag",nil,35000],
						["rhs_weap_ak74m_2mag_camo",nil,35000],
						["rhs_weap_ak74m",nil,35000],
						["rhs_weap_ak74m_folded",nil,35000],
						["rhs_weap_ak74m_camo",nil,35000],
						["rhs_weap_ak74m_desert",nil,35000],
						["rhs_acc_pso1m2",nil,5000],
						["rhs_acc_1p29",nil,5000],
						["rhs_acc_pkas",nil,3500],
						["rhs_30Rnd_545x39_AK",nil,7500],
						["rhs_30Rnd_545x39_AK_green",nil,7500],
						["hlc_rifle_ak12","AK12",35000],
						["hlc_rifle_ak74","IzmAK74",35000],
						["hlc_rifle_ak74_dirty","IzmAK74 Dirty",35000],
						["hlc_rifle_aks74","IzmAKS74",35000],
						["hlc_rifle_aks74u","IzmAKS74U",35000],
						["hlc_rifle_aek971","AEK",35000],
						["hlc_30Rnd_545x39_B_AK",nil,7500],
						["hlc_30Rnd_545x39_EP_ak",nil,7500],
						["hlc_30Rnd_545x39_t_ak",nil,7500],
						["arifle_Mk20_plain_F","MK20",35000],
						["arifle_Mk20_F","MK20Camo",35000],
						["arifle_Mk20C_plain_F","MK20C",35000],
						["arifle_Mk20C_F","MK20CCamo",35000],
						["arifle_TRG20_F","TRG20",35000],
						["30Rnd_556x45_Stanag",nil,7500],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,7500],
						["arifle_TRG21_F","TRG21",35000],
						["arifle_SDAR_F","SDAR",35000],
						["20Rnd_556x45_UW_mag",nil,7500]
					]
				];
			};
		};
	};
	
	case "Waffendealer_Sturm_mittel": //Masterwaffenliste für alle mittleren Sturmgewehre inkl. Preisen und Magazinen
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (__GETC__(life_adminlevel) < 3): {"Du bist kein Admin!"};
			default
			{
				["Waffendealel Sturm Mittel",
					[
						["rhs_weap_m16a4",nil,42000],
						["rhs_weap_m16a4_carryhandle",nil,42000],
						["rhs_weap_m16a4_grip",nil,42000],
						["rhs_weap_m4",nil,42000],
						["rhs_weap_m4_carryhandle",nil,42000],
						["rhs_weap_m4_grip",nil,42000],
						["rhs_weap_m4a1",nil,42000],
						["rhs_weap_m4a1_grip",nil,42000],
						["hlc_rifle_RU5562","AR15Mpul",42000],
						["hlc_rifle_RU556","AR15Sanit",42000],
						["hlc_rifle_bcmjack","BCM",42000],
						["hlc_rifle_Colt727","Colt",42000],
						["RH_M16A2","M16A2",42000],
						["RH_M16A3","M16A3",42000],
						["RH_M16A4","M16A4",42000],
						["RH_M16A4_m","M16A4MT",42000],
						["RH_m4","M4",42000],
						["RH_M4_ris","M4RIS",42000],
						["RH_M4A1_ris","M4A1RIS",42000],
						["RH_M4sbr_b","SBR",42000],
						["RH_M4sbr_g","SBR G",42000],
						["RH_M4sbr","SBR T",42000],
						["30Rnd_556x45_Stanag",nil,7500],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,7500],
						["arifle_Katiba_F","Katiba",42000],
						["arifle_Katiba_C_F","KatibaC",42000],
						["30Rnd_65x39_caseless_green",nil,8000],
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,8000],
						["arifle_MX_F","MX",42000],
						["arifle_MX_Black_F","MXBlack",42000],
						["arifle_MXC_F","MXC",42000],
						["arifle_MXC_Black_F","MXCBlack",42000],
						["arifle_MXM_F","MXM",42000],
						["arifle_MXM_Black_F","MXMBlack",42000],
						["30Rnd_65x39_caseless_mag",nil,8000],
						["30Rnd_65x39_caseless_mag_Tracer",nil,8000]
					]
				];
			};
		};
	};
	
	case "Waffendealer_Sturm_schwer": //Masterwaffenliste für alle schweren Sturmgewehre inkl. Preisen und Magazinen
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (__GETC__(life_adminlevel) < 3): {"Du bist kein Admin!"};
			default
			{
				["Waffendealel Sturm Schwer",
					[
						["hlc_rifle_honeybadger","Honey Badger",50000],
						["muzzle_HBADGER",nil,8000],
						["hlc_rifle_Bushmaster300","AR15 .300",10000],
						["29rnd_300BLK_STANAG",nil,10000],
						["29rnd_300BLK_STANAG_T",nil,10000],
						["29rnd_300BLK_STANAG_S",nil,10000],
						["RH_ar10"," AR10",50000],
						["RH_Delft",nil,5000],
						["RH_20Rnd_762x51_AR10",nil,10000],
						["hlc_rifle_falosw","FAL OSW",50000],
						["hlc_rifle_L1A1SLR","L1A1 SLR",50000],
						["hlc_rifle_STG58F","Steyr STG.58",50000],
						["hlc_rifle_c1A1","FN C1A1",50000],
						["hlc_rifle_FAL5061","FN FAL PARA",50000],
						["hlc_rifle_SLR","Lithgow SLR",50000],
						["hlc_rifle_SLRchopmod","Lithgow SLR Chop",50000],
						["hlc_rifle_LAR","FN LAR",50000],
						["hlc_20rnd_762x51_b_fal",nil,10000],
						["hlc_20Rnd_762x51_T_fal",nil,10000],
						["hlc_20rnd_762x51_s_fal",nil,10000],
						["hlc_rifle_hk51","FR Ordnance",50000],
						["hlc_rifle_g3sg1","HK G3 New",50000],
						["hlc_rifle_g3a3","HK G3A3",50000],
						["hlc_rifle_g3ka4","HK G3KA4",50000],
						["hlc_20rnd_762x51_b_G3",nil,10000],
						["hlc_20rnd_762x51_T_G3",nil,10000],
						["hlc_20rnd_762x51_S_G3",nil,10000],
						["hlc_rifle_ak47","AK47",50000],
						["hlc_rifle_akm","AKM",50000],
						["hlc_30Rnd_762x39_b_ak",nil,10000],
						["hlc_30Rnd_762x39_t_ak",nil,10000],
						["hlc_30rnd_762x39_s_ak",nil,10000],
						["srifle_EBR_F","MK18 ABR",50000],
						["20Rnd_762x51_Mag",nil,10000],
						["srifle_DMR_01_F","Rahim",50000],
						["10Rnd_762x51_Mag",nil,10000],
						["hlc_rifle_M14","M14",50000],
						["hlc_rifle_m14sopmod","M14 SOPMOD",50000],
						["hlc_20Rnd_762x51_B_M14",nil,10000],
						["hlc_20Rnd_762x51_T_M14",nil,10000],
						["hlc_20Rnd_762x51_S_M14",nil,10000]
					]
				];
			};
		};
	};
	
	case "Waffendealer_Sniper": //Masterwaffenliste für alle Sniperwaffen inkl. Preisen und Magazinen
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (__GETC__(life_adminlevel) < 3): {"Du bist kein Admin!"};
			default
			{
				["Waffendealel Sniper",
					[
					//Sniper leicht
						["hlc_rifle_SAMR","RRA LAR-15 Anim",42000],
						["hlc_rifle_samr2","RRA LAR-15 Digital",42000],
						["hlc_rifle_samr","RRA LAR-15",42000],
						["hlc_30rnd_556x45_S",nil,8000],
						["hlc_30rnd_556x45_SPR","Stanag Long Rang",8000],
						["hlc_30rnd_556x45_SOST","Stanag Short Barrel",8000],
						["hlc_30rnd_556x45_EPR","Stanag AP",8000],
						["RH_Mk12mod1","Mk 12 Mod 1",42000],
						["RH_SAMR","SAM R",42000],
						["30rnd_556x45_STANAG",nil,8000],
						["30Rnd_556x45_Stanag_Tracer_Yellow",nil,8000],
					//Sniper mittel
						["hlc_rifle_psg1","HK PSG-1",50000],
						["hlc_20rnd_762x51_b_G3",nil,10000],
						["hlc_20rnd_762x51_T_G3",nil,10000],
						["hlc_20rnd_762x51_S_G3",nil,10000],
						["hlc_rifle_m14dmr","M 14 DMR",50000],
						["hlc_rifle_M21","M 21",50000],
						["hlc_20Rnd_762x51_B_M14",nil,10000],
						["hlc_20Rnd_762x51_T_M14",nil,13000],
						["hlc_20Rnd_762x51_S_M14",nil,13000],
						["rhs_weap_m14ebrri",nil,50000],
						["20Rnd_762x51_Mag",nil,10000],
						["rhs_weap_svdp",nil,50000],
						["rhs_weap_svdp_wd",nil,50000],
						["rhs_weap_svds",nil,50000],
						["rhs_10Rnd_762x54mmR_7N1",nil,10000],
					//Sniper schwer
						["srifle_GM6_F","GM6 Lynx",75000],
						["srifle_GM6_camo_F","GM6 Lynx Camo",75000],
						["5Rnd_127x108_Mag",nil,15000],
						["srifle_LRR_F","M320 LRR",75000],
						["srifle_LRR_camo_F","M320 LRR Camo",75000],
						["7Rnd_408_Mag",nil,15000],
					//Attachments
						["optic_LRPS","LRPS",5000],
						["optic_DMS","DMS",5000],
						["optic_SOS","SOS",5000],
						["optic_NVS","NVS",7500],	
						["RH_m3lr","TS A-2",5000],
						["rhsusf_acc_HAMR",nil,3500],
						["rhsusf_acc_LEUPOLDMK4",nil,5000],
						["rhsusf_acc_LEUPOLDMK4_2",nil,5000],
						["rhsusf_acc_ACOG3",nil,3500],
						["rhsusf_acc_compm4",nil,3500],
						["rhsusf_acc_anpeq15",nil,3500],
						["rhs_acc_pso1m2",nil,5000],
						["RH_spr_mbs","Silencer SAM R/ MK 12",8000]				
					]
				];
			};
		};
	};
	
	case "Waffendealer_MGs": //Masterwaffenliste für alle MGs und sonstige Waffen inkl. Preisen und Magazinen
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (__GETC__(life_adminlevel) < 3): {"Du bist kein Admin!"};
			default
			{
				["Waffendealel MGs u Sonstige",
					[
					//Maschinengewehre Leicht
						["rhs_weap_m249_pip",nil,50000],
						["rhsusf_100Rnd_556x45_soft_pouch",nil,10000],
					//Maschinengewehre Mittel
						["LMG_Mk200_F","Mk200",75000],
						["200Rnd_65x39_cased_Box",nil,18000],
						["200Rnd_65x39_cased_Box_Tracer",nil,18000],
						["arifle_MX_SW_F","MX SW",75000],
						["arifle_MX_SW_Black_F","MX SW Black",75000],
						["100Rnd_65x39_caseless_mag",nil,18000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,18000],
					//Maschinengewehre Schwer
						["hlc_rifle_rpk","Izhmash RPK",100000],
						["hlc_75Rnd_762x39_m_rpk",nil,25000],
						["hlc_45Rnd_762x39_m_rpk",nil,25000],
						["hlc_45Rnd_762x39_t_rpk",nil,25000],
						["hlc_lmg_m60","M60",100000],
						["hlc_lmg_M60E4","M60E4",100000],
						["hlc_100Rnd_762x51_B_M60E4",nil,25000],
						["hlc_100Rnd_762x51_M_M60E4",nil,25000],
						["hlc_100Rnd_762x51_T_M60E4",nil,25000],
						["LMG_Zafir_F","LMG_Zafir_F",100000],
						["150Rnd_762x51_Box",nil,25000],
                        ["150Rnd_762x51_Box_Tracer",nil,25000],
					//Raketenwerfer
						["rhs_weap_rpg7",nil,75000],
						["rhs_acc_pgo7v",nil,10000],
						["rhs_rpg7_OG7V_mag",nil,225000],
						["rhs_rpg7_PG7VL_mag",nil,225000],
						["rhs_weap_M136",nil,60000],
						["rhs_m136_mag",nil,180000],
						["rhs_weap_rshg2",nil,60000],
						["rhs_rshg2_mag",nil,180000],
					//Schrotflinte
						["hlc_rifle_saiga12k","Saiga 12",15000],
						["hlc_10rnd_12g_slug_S12",nil,2500],
						["hlc_10rnd_12g_buck_S12",nil,2500],
					//Sonstiges
						["rhs_weap_M320",nil,30000],
						["3Rnd_SmokeGreen_Grenade_shell",nil,5000],
						["3Rnd_UGL_FlareWhite_F",nil,5000],
						["3Rnd_UGL_FlareCIR_F",nil,5000],
						["DemoCharge_Remote_Mag",nil,50000],
						["SatchelCharge_Remote_Mag",nil,150000]
						
					]
				];
			};
		};
	};
	
	case "Waffendealer_attachments": //Masterwaffenliste für alle Visiere, Lampen, Schalldämpfer etc
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (__GETC__(life_adminlevel) < 3): {"Du bist kein Admin!"};
			default
			{
				["Waffendealel Zubehör",
					[	
					//Schalldämpfer
						["hlc_muzzle_545SUP_AK",nil,8000],
						["muzzle_snds_B",nil,8000],
						["muzzle_snds_H",nil,8000],
						["RH_qdss_nt4",nil,8000],
						["RH_saker",nil,8000],
						["muzzle_snds_M",nil,8000],
						["hlc_muzzle_snds_M14",nil,8000],
						["hlc_muzzle_snds_fal",nil,8000],
						["RH_spr_mbs",nil,8000],
						["hlc_muzzle_556NATO_KAC",nil,8000],
						["hlc_muzzle_762SUP_AK",nil,8000],
						["hlc_muzzle_snds_HK33",nil,8000],
						["hlc_muzzle_snds_g3",nil,8000],
						["hlc_muzzle_300blk_KAC",nil,8000],
						["rhs_acc_tgpa",nil,8000],
					//LL-M Rails
						["acc_pointer_IR",nil,500],
						["acc_flashlight",nil,500],
						["RH_m16covers_f",nil,500],
						["RH_m16covers_s",nil,500],
						["RH_peq15",nil,500],
						["RH_peq15_top",nil,500],
						["RH_peq2",nil,500],
						["RH_peq2_top",nil,500],
						["RH_SFM952V",nil,500],
						["RH_SFM952V_tan",nil,500],
						["RH_m4covers_f",nil,500],
						["RH_m4covers_s",nil,500],
					//CQB Scopes
						["hlc_optic_kobra",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_Aco",nil,2000],
						["optic_Holosight",nil,2000],
						["optic_ACO_grn_smg",nil,2000],
						["optic_Aco_smg",nil,2000],
						["optic_Holosight_smg",nil,2000],
						["RH_compm4s",nil,2000],
						["RH_t1",nil,2000],
						["RH_eotech553",nil,2000],
						["RH_shortdot",nil,2000],
						["RH_reflex",nil,2000],
						["FHQ_optic_AC12136",nil,2000],
						["FHQ_optic_AC11704_tan",nil,2000],
						["FHQ_optic_AC11704",nil,2000],
						["FHQ_optic_AIM",nil,2000],
						["FHQ_optic_AIM_tan",nil,2000],
						["RH_compm4s",nil,2000],
						["RH_t1",nil,2000],
						["RH_eotech553",nil,2000],
						["RH_reflex",nil,2000],
						["rhs_acc_pkas",nil,2000],
						["FHQ_optic_MARS",nil,2000],
						["FHQ_optic_MARS_tan",nil,2000],
						["FHQ_optic_MicroCCO",nil,2000],
						["FHQ_optic_MicroCCO_tan",nil,2000],
						["FHQ_optic_MicroCCO_low",nil,2000],
						["FHQ_optic_MicroCCO_low_tan",nil,2000],
						["FHQ_optic_HWS",nil,2000],
						["FHQ_optic_HWS_tan",nil,2000],
					//Mid Range Scopes
						["rhsusf_acc_ACOG",nil,3500],
						["rhsusf_acc_ACOG3",nil,3500],
						["FHQ_optic_ACOG_tan",nil,3500],
						["FHQ_optic_ACOG",nil,3500],
						["FHQ_optic_HWS_G33",nil,3500],
						["FHQ_optic_HWS_G33_tan",nil,3500],
						["HLC_Optic_1p29",nil,3500],
						["optic_Hamr",nil,3500],
						["optic_MRCO",nil,3500],
						["optic_Arco",nil,3500],
						["RH_m3lr",nil,3500],
						["hlc_optic_PVS4M14",nil,3500],
						["hlc_optic_artel_m14",nil,3500],
						["hlc_optic_PVS4FAL",nil,3500],
						["hlc_optic_suit",nil,3500],
						["hlc_optic_accupoint_g3",nil,3500],
						["hlc_optic_PVS4G3",nil,3500],
						["HLC_Optic_ZFSG1",nil,3500],
						["rhsusf_acc_compm4",nil,3500],
						["rhsusf_acc_HAMR",nil,3500],
						["rhs_acc_1p29",nil,3500],
						["RH_m3lr",nil,3500],
					//Long Range Scopes
						["HLC_Optic_PSO1",nil,5000],
						["optic_LRPS","LRPS",5000],
						["optic_DMS","DMS",5000],
						["optic_SOS","SOS",5000],
						["optic_NVS","NVS",5000],	
						["RH_m3lr","TS A-2",5000],
						["hlc_optic_LRT_m14",nil,5000],
						["rhs_acc_pso1m2",nil,5000],
						["rhsusf_acc_LEUPOLDMK4",nil,5000],
						["rhsusf_acc_LEUPOLDMK4_2",nil,5000],
						["FHQ_optic_LeupoldERT_tan",nil,5000],
						["FHQ_optic_LeupoldERT",nil,5000],
					//Nightvision	
						["NVGoggles",nil,200], //beige
						["NVGoggles_OPFOR",nil,200], //schwarz
						["NVGoggles_INDEP",nil,200] //grün
					]
				];
			};
		};
	};
	
	
	case "cop_stufe1":
	{
		switch(true) do
		{
			case (!license_cop_gangfirma && playerSide != west): {"Du bist kein Polizist!"};
			default
			{
				["Rekruten Shop",
					[
						["RH_mk2","Ruger Mk2 Tazer",800],
                        ["RH_10Rnd_22LR_mk2","Tazer Muni",100],
						["hlc_rifle_saiga12k","Saiga 12k",3000],
						["hlc_10rnd_12g_slug_S12","Gummigeschosse",300],
						["hlc_optic_kobra","Kobravisier",500],
						["hlc_smg_mp5a2",nil,4000],
						["hlc_30Rnd_9x19_B_MP5","9mm Ball",500],
						["Rangefinder",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,25],
						["FirstAidKit",nil,75],
						["Medikit",nil,100],
						["ItemRadio","Handy",100],
						["NVGoggles",nil,200]
					]
				];
			};
		};
	};
	
	case "cop_stufe2":
	{
		switch(true) do
		{
			case (!license_cop_gangfirma && playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 2): {"Dein Rang ist zu niedrig."};
			default
			{
				["Officer Shop",
					[
						["RH_mk2","Ruger Mk2 Tazer",800],
                        ["RH_10Rnd_22LR_mk2","Tazer Muni",100],
						["hlc_rifle_saiga12k","Saiga 12k",3000],
						["hlc_10rnd_12g_slug_S12","Gummigeschosse",300],
						["hlc_optic_kobra","Kobravisier",500],
						["hlc_smg_mp510",nil,5000],
						["hlc_30Rnd_10mm_B_MP5",nil,600],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["optic_MRCO",nil,1000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["Rangefinder",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,25],
						["FirstAidKit",nil,75],
						["Medikit",nil,100],
						["ItemRadio","Handy",100],
						["NVGoggles",nil,200]
					]
				];
			};
		};
	};
	
	case "cop_stufe3":
	{
		switch(true) do
		{
			case (!license_cop_gangfirma && playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 3): {"Dein Rang ist zu niedrig."};
			default
			{
				["Patrol Officer Shop",
					[
						["RH_mk2","Ruger Mk2 Tazer",800],
                        ["RH_10Rnd_22LR_mk2","Tazer Muni",100],
						["hlc_rifle_saiga12k","Saiga 12k",3000],
						["hlc_10rnd_12g_slug_S12","Gummigeschosse",300],
						["hlc_optic_kobra","Kobravisier",500],
						["hlc_smg_mp510",nil,5000],
						["hlc_30Rnd_10mm_B_MP5",nil,600],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["hlc_rifle_hk53","HK 53",6000],
						["hlc_30rnd_556x45_b_HK33",nil,800],
						["hlc_optic_accupoint_g3","TR20",800],
						["optic_MRCO",nil,1000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["Rangefinder",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,25],
						["FirstAidKit",nil,75],
						["Medikit",nil,100],
						["ItemRadio","Handy",100],
						["NVGoggles",nil,200]
					]
				];
			};
		};
	};
	
	case "cop_stufe4":
	{
		switch(true) do
		{
			case (!license_cop_gangfirma && playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 4): {"Dein Rang ist zu niedrig."};
			default
			{
				["Master Patrol Officer Shop",
					[
						["RH_mk2","Ruger Mk2 Tazer",800],
                        ["RH_10Rnd_22LR_mk2","Tazer Muni",100],
						["hlc_rifle_saiga12k","Saiga 12k",3000],
						["hlc_10rnd_12g_slug_S12","Gummigeschosse",300],
						["hlc_optic_kobra","Kobravisier",500],
						["hlc_smg_mp510",nil,5000],
						["hlc_30Rnd_10mm_B_MP5",nil,600],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["hlc_rifle_hk53","HK 53",6000],
						["hlc_30rnd_556x45_b_HK33",nil,800],
						["hlc_optic_accupoint_g3","TR20",800],
						["hlc_rifle_Colt727","Colt727",7500],
						["30rnd_556x45_STANAG",nil,1000],
						["FHQ_optic_AC11704",nil,500],
						["FHQ_optic_AC12136",nil,500],
						["optic_MRCO",nil,1000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["Rangefinder",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,25],
						["FirstAidKit",nil,75],
						["Medikit",nil,100],
						["ItemRadio","Handy",100],
						["NVGoggles",nil,200]
					]
				];
			};
		};
	};
	
	case "cop_stufe5":
	{
		switch(true) do
		{
			case (!license_cop_gangfirma && playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 5): {"Dein Rang ist zu niedrig."};
			default
			{
				["Sergeant Shop",
					[
						["RH_mk2","Ruger Mk2 Tazer",800],
                        ["RH_10Rnd_22LR_mk2","Tazer Muni",100],
						["hlc_rifle_saiga12k","Saiga 12k",3000],
						["hlc_10rnd_12g_slug_S12","Gummigeschosse",300],
						["hlc_10rnd_12g_buck_S12",nil,300],
						["hlc_optic_kobra","Kobravisier",500],
						["hlc_smg_mp510",nil,5000],
						["hlc_30Rnd_10mm_B_MP5",nil,600],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["hlc_rifle_hk53","HK 53",6000],
						["hlc_30rnd_556x45_b_HK33",nil,800],
						["hlc_optic_accupoint_g3","TR20",800],
						["hlc_rifle_Colt727","Colt727",7500],
						["rhs_weap_m16a4_grip",nil,7500],
						["30rnd_556x45_STANAG",nil,1000],
						["RH_m4sbr_b","Vitor SBR",7500],
						["RH_compM4s",nil,1000],
						["RH_SFM952V",nil,200],
						["30rnd_556x45_STANAG",nil,1000],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,1000],
						["RH_m3lr",nil,1000],
						["FHQ_optic_AC11704",nil,500],
						["FHQ_optic_AC12136",nil,500],
						["optic_MRCO",nil,1000],
						["optic_Arco",nil,1000],
						["optic_Hamr",nil,1000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["HandGrenade_Stone","Flashbang",800],
						["Rangefinder",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,25],
						["FirstAidKit",nil,75],
						["Medikit",nil,100],
						["ItemRadio","Handy",100],
						["NVGoggles",nil,200],
						["B_UavTerminal",nil,15],
						["B_UAV_01_backpack_F","Drohne",5000]
					]
				];
			};
		};
	};
	
	case "cop_stufe6":
	{
		switch(true) do
		{
			case (!license_cop_gangfirma && playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 6): {"Dein Rang ist zu niedrig."};
			default
			{
				["Lieutenant Shop",
					[
						["RH_mk2","Ruger Mk2 Tazer",800],
                        ["RH_10Rnd_22LR_mk2","Tazer Muni",100],
						["hlc_rifle_saiga12k","Saiga 12k",3000],
						["hlc_10rnd_12g_slug_S12","Gummigeschosse",300],
						["hlc_10rnd_12g_buck_S12",nil,300],
						["hlc_optic_kobra","Kobravisier",500],
						["hlc_smg_mp510",nil,5000],
						["hlc_30Rnd_10mm_B_MP5",nil,600],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["hlc_rifle_hk53","HK 53",6000],
						["hlc_30rnd_556x45_b_HK33",nil,800],
						["hlc_optic_accupoint_g3","TR20",800],
						["hlc_rifle_Colt727","Colt727",7500],
						["rhs_weap_m16a4_grip",nil,7500],
						["30rnd_556x45_STANAG",nil,1000],
						["RH_m4sbr_b","Vitor SBR",7500],
						["RH_compM4s",nil,1000],
						["RH_SFM952V",nil,200],
						["30rnd_556x45_STANAG",nil,1000],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,1000],
						["hlc_rifle_vendimus","Dissipator",8000],
						["29rnd_300BLK_STANAG",nil,1200],						
						["RH_m3lr",nil,1000],
						["rhsusf_acc_ACOG3",nil,1000],
						["FHQ_optic_AC11704",nil,500],
						["FHQ_optic_AC12136",nil,500],
						["optic_MRCO",nil,1000],
						["optic_Arco",nil,1000],
						["optic_Hamr",nil,1000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["HandGrenade_Stone","Flashbang",800],
						["Rangefinder",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,25],
						["FirstAidKit",nil,75],
						["Medikit",nil,100],
						["ItemRadio","Handy",100],
						["NVGoggles",nil,200],
						["B_UavTerminal",nil,15],
						["B_UAV_01_backpack_F","Drohne",5000]
					]
				];
			};
		};
	};
	
	case "cop_stufe7":
	{
		switch(true) do
		{
			case (!license_cop_gangfirma && playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 7): {"Dein Rang ist zu niedrig."};
			default
			{
				["Captain Shop",
					[
						["RH_mk2","Ruger Mk2 Tazer",800],
                        ["RH_10Rnd_22LR_mk2","Tazer Muni",100],
						["hlc_rifle_saiga12k","Saiga 12k",3000],
						["hlc_10rnd_12g_slug_S12","Gummigeschosse",300],
						["hlc_10rnd_12g_buck_S12",nil,300],
						["hlc_optic_kobra","Kobravisier",500],
						["hlc_smg_mp510",nil,5000],
						["hlc_30Rnd_10mm_B_MP5",nil,600],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["hlc_rifle_hk53","HK 53",6000],
						["hlc_30rnd_556x45_b_HK33",nil,800],
						["hlc_optic_accupoint_g3","TR20",800],
						["hlc_rifle_Colt727","Colt727",7500],
						["rhs_weap_m16a4_grip",nil,7500],
						["30rnd_556x45_STANAG",nil,1000],
						["RH_m4sbr_b","Vitor SBR",7500],
						["RH_compM4s",nil,1000],
						["RH_SFM952V",nil,200],
						["30rnd_556x45_STANAG",nil,1000],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,1000],
						["hlc_rifle_vendimus","Dissipator",8000],
						["hlc_rifle_Bushmaster300","Bushmaster",8000],
						["29rnd_300BLK_STANAG",nil,1200],
						["RH_m3lr",nil,1000],
						["rhsusf_acc_ACOG3",nil,1000],
						["FHQ_optic_HWS_G33",nil,1000],
						["FHQ_optic_AC11704",nil,500],
						["FHQ_optic_AC12136",nil,500],
						["optic_Holosight",nil,500],
						["optic_Hamr",nil,1000],
						["optic_Arco",nil,1000],
						["optic_MRCO",nil,1000],
						["optic_SOS",nil,2000],
						["optic_DMS",nil,2000],
						["optic_LRPS",nil,2000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["HandGrenade_Stone","Flashbang",800],
						["Rangefinder",nil,15],
						["Laserdesignator",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,25],
						["FirstAidKit",nil,75],
						["Medikit",nil,100],
						["ItemRadio","Handy",100],
						["NVGoggles",nil,200],
						["B_UavTerminal",nil,15],
						["B_UAV_01_backpack_F","Drohne",5000]
					]
				];
			};
		};
	};
	
	case "cop_stufe8":
	{
		switch(true) do
		{
			case (!license_cop_gangfirma && playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 8): {"Dein Rang ist zu niedrig."};
			default
			{
				["Inspector Shop",
					[
						["RH_mk2","Ruger Mk2 Tazer",800],
                        ["RH_10Rnd_22LR_mk2","Tazer Muni",100],
						["hlc_rifle_saiga12k","Saiga 12k",3000],
						["hlc_10rnd_12g_slug_S12","Gummigeschosse",300],
						["hlc_10rnd_12g_buck_S12",nil,300],
						["hlc_optic_kobra","Kobravisier",500],
						["hlc_smg_mp510",nil,5000],
						["hlc_30Rnd_10mm_B_MP5",nil,600],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["hlc_rifle_hk53","HK 53",6000],
						["hlc_30rnd_556x45_b_HK33",nil,800],
						["hlc_optic_accupoint_g3","TR20",800],
						["hlc_rifle_Colt727","Colt727",7500],
						["rhs_weap_m16a4_grip",nil,7500],
						["30rnd_556x45_STANAG",nil,1000],
						["RH_m4sbr_b","Vitor SBR",7500],
						["RH_compM4s",nil,1000],
						["RH_SFM952V",nil,200],
						["30rnd_556x45_STANAG",nil,1000],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,1000],
						["hlc_rifle_vendimus","Dissipator",8000],
						["hlc_rifle_Bushmaster300","Bushmaster",8000],
						["29rnd_300BLK_STANAG",nil,1200],
						["rhs_weap_m14ebrri",nil,12000],
						["20Rnd_762x51_Mag",nil,2000],
						["rhsusf_acc_LEUPOLDMK4_2",nil,2000],
						["RH_m3lr",nil,1000],
						["rhsusf_acc_ACOG3",nil,1000],
						["FHQ_optic_HWS_G33",nil,1000],
						["FHQ_optic_AC11704",nil,500],
						["FHQ_optic_AC12136",nil,500],
						["optic_Holosight",nil,500],
						["optic_Hamr",nil,1000],
						["optic_Arco",nil,1000],
						["optic_MRCO",nil,1000],
						["optic_SOS",nil,2000],
						["optic_DMS",nil,2000],
						["optic_LRPS",nil,2000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["HandGrenade_Stone","Flashbang",800],
						["Rangefinder",nil,15],
						["Laserdesignator",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,25],
						["FirstAidKit",nil,75],
						["Medikit",nil,100],
						["ItemRadio","Handy",100],
						["NVGoggles",nil,200],
						["B_UavTerminal",nil,15],
						["B_UAV_01_backpack_F","Drohne",5000]
					]
				];
			};
		};
	};
	
	case "cop_stufe9":
	{
		switch(true) do
		{
			case (!license_cop_gangfirma && playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 9): {"Dein Rang ist zu niedrig."};
			default
			{
				["Detective Shop",
					[
						["RH_mk2","Ruger Mk2 Tazer",800],
                        ["RH_10Rnd_22LR_mk2","Tazer Muni",100],
						["hlc_rifle_saiga12k","Saiga 12k",3000],
						["hlc_10rnd_12g_slug_S12","Gummigeschosse",300],
						["hlc_10rnd_12g_buck_S12",nil,300],
						["hlc_optic_kobra","Kobravisier",500],
						["hlc_smg_mp510",nil,5000],
						["hlc_30Rnd_10mm_B_MP5",nil,600],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["hlc_rifle_hk53","HK 53",6000],
						["hlc_30rnd_556x45_b_HK33",nil,800],
						["hlc_optic_accupoint_g3","TR20",800],
						["hlc_rifle_Colt727","Colt727",7500],
						["rhs_weap_m16a4_grip",nil,7500],
						["30rnd_556x45_STANAG",nil,1000],
						["RH_m4sbr_b","Vitor SBR",7500],
						["RH_compM4s",nil,1000],
						["RH_SFM952V",nil,200],
						["30rnd_556x45_STANAG",nil,1000],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,1000],
						["hlc_rifle_vendimus","Dissipator",8000],
						["hlc_rifle_Bushmaster300","Bushmaster",8000],
						["29rnd_300BLK_STANAG",nil,1200],
						["rhs_weap_m14ebrri",nil,12000],
						["20Rnd_762x51_Mag",nil,2000],
						["rhsusf_acc_LEUPOLDMK4_2",nil,2000],
						["hlc_rifle_psg1","HK PSG-1",17000],
						["hlc_20rnd_762x51_b_G3",nil,2000],
						["RH_m3lr",nil,1000],
						["rhsusf_acc_ACOG3",nil,1000],
						["FHQ_optic_HWS_G33",nil,1000],
						["FHQ_optic_AC11704",nil,500],
						["FHQ_optic_AC12136",nil,500],
						["optic_Holosight",nil,500],
						["optic_Hamr",nil,1000],
						["optic_Arco",nil,1000],
						["optic_MRCO",nil,1000],
						["optic_SOS",nil,2000],
						["optic_DMS",nil,2000],
						["optic_LRPS",nil,2000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["HandGrenade_Stone","Flashbang",800],
						["Rangefinder",nil,15],
						["Laserdesignator",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,25],
						["FirstAidKit",nil,75],
						["Medikit",nil,100],
						["ItemRadio","Handy",100],
						["NVGoggles",nil,200],
						["B_UavTerminal",nil,15],
						["B_UAV_01_backpack_F","Drohne",5000]
					]
				];
			};
		};
	};
	
	case "cop_swat":
	{
		switch(true) do
		{
			case (!license_cop_gangfirma && playerSide != west): {"Du bist kein Polizist!"};
			case (!license_cop_swat): {"Du bist kein SWAT Mitglied!"};
			default
			{
				["Altis SWAT Shop",
					[
						["RH_p226","Sig 226",2000],
						["RH_15Rnd_9x19_SIG",nil,500],
						["RH_suppr9",nil,1000],
						["RH_g18","Glock 18",3200],
						["RH_33Rnd_9x19_g18",nil,800],
						["RH_gemtech9",nil,1000],
						["RH_usp","USP",4000],
						["RH_12Rnd_45cal_usp",nil,1000],
						["RH_aacusp",nil,1000],
						["RH_gemtech45",nil,1000],
						["RH_osprey",nil,1000],
						["RH_fhusp",nil,600],
						["RH_x2",nil,200],
						["RH_m6x",nil,200],
						["RH_x300",nil,200],
						["RH_mk2","Ruger Mk2 Tazer",800],
                        ["RH_10Rnd_22LR_mk2","Tazer Muni",100],
						["hlc_rifle_saiga12k","Saiga 12k",3000],
						["hlc_10rnd_12g_slug_S12","Gummigeschosse",300],
						["hlc_10rnd_12g_buck_S12",nil,300],
						["hlc_optic_kobra","Kobravisier",500],
						["hlc_smg_mp510",nil,5000],
						["hlc_30Rnd_10mm_B_MP5",nil,600],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["hlc_rifle_hk53","HK 53",6000],
						["hlc_30rnd_556x45_b_HK33",nil,800],
						["hlc_optic_accupoint_g3","TR20",800],
						["hlc_rifle_Colt727","Colt727",7500],
						["rhs_weap_m16a4_grip",nil,7500],
						["RH_m4sbr_b","Vitor SBR",7500],
						["RH_qdss_nt4",nil,4000],
						["RH_compM4s",nil,1000],
						["RH_SFM952V",nil,200],
						["30rnd_556x45_STANAG",nil,1000],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,1000],
						["arifle_MXC_Black_F","MXCBlack",7000],
						["30Rnd_65x39_caseless_mag_Tracer",nil,1500],
						["hlc_rifle_g3ka4","HK G3KA4",9000],
						["hlc_20rnd_762x51_b_G3",nil,1200],
						["hlc_20rnd_762x51_T_G3",nil,1200],
						["hlc_20rnd_762x51_S_G3",nil,1200],
						["hlc_muzzle_snds_g3",nil,4000],
						["hlc_rifle_vendimus","Dissipator",8000],
						["hlc_rifle_Bushmaster300","Bushmaster",8000],
						["29rnd_300BLK_STANAG",nil,1200],
						["rhs_weap_m14ebrri",nil,12000],
						["20Rnd_762x51_Mag",nil,2000],
						["rhsusf_acc_LEUPOLDMK4_2",nil,2000],
						["hlc_rifle_psg1","HK PSG-1",17000],
						["hlc_20rnd_762x51_b_G3",nil,2000],
						["arifle_SDAR_F","SDAR",3000],
						["20Rnd_556x45_UW_mag",nil,3000],
						["srifle_LRR_F","M320 LRR",25000],
						["7Rnd_408_Mag",nil,5000],
						["RH_m3lr",nil,1000],
						["rhsusf_acc_ACOG3",nil,1000],
						["arifle_MX_SW_Black_F","MX SW Black",25000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,4000],
						["FHQ_optic_HWS_G33",nil,1000],
						["FHQ_optic_ACOG",nil,2000],
						["optic_Holosight",nil,500],
						["FHQ_optic_AC11704",nil,500],
						["FHQ_optic_AC12136",nil,500],
						["optic_Hamr",nil,1000],
						["optic_Arco",nil,1000],
						["optic_MRCO",nil,1000],
						["optic_SOS",nil,2000],
						["optic_DMS",nil,2000],
						["optic_LRPS",nil,2000],
						["acc_flashlight",nil,100],
						["acc_pointer_IR",nil,100],
						["RH_peq2",nil,100],
						["HandGrenade_Stone","Flashbang",800],
						["SmokeShellBlue","Smoke Blue",800],
						["Rangefinder",nil,15],
						["Laserdesignator",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,25],
						["FirstAidKit",nil,75],
						["Medikit",nil,100],
						["ItemRadio","Handy",500],
						["NVGoggles",nil,200],
						["NVGoggles_OPFOR",nil,200],
						["rhs_weap_M320",nil,7500],
						["3Rnd_SmokeGreen_Grenade_shell",nil,2500],
						["3Rnd_UGL_FlareWhite_F",nil,1000],
						["3Rnd_UGL_FlareCIR_F",nil,1000],
						["rhs_weap_rpg7",nil,15000],
						["rhs_acc_pgo7v",nil,1000],
						["rhs_rpg7_OG7V_mag",nil,35000],
						["rhs_rpg7_PG7VL_mag",nil,35000],
						["hlc_smg_mp5sd6",nil,7000],
						["hlc_30Rnd_9x19_SD_MP5","9mm Subsonic",500],
						["B_UavTerminal",nil,15],
						["B_UAV_01_backpack_F","Drohne",5000]
					]
				];
			};
		};
	};
	
	case "cop_firma_rekrut":
	{
		switch(true) do
		{
			case (license_cop_gangfirma && playerSide == west && (__GETC__(life_coplevel) == 1)):
			{
				["Die Firma Security - Rekruten",
					[
						["RH_mk2","Ruger Mk2 Tazer",800],
                        ["RH_10Rnd_22LR_mk2","Tazer Muni",100],
						["hlc_smg_mp510",nil,5000],
						["hlc_30Rnd_10mm_B_MP5",nil,600],
						["optic_Holosight",nil,500],
						["optic_Hamr",nil,1000],
						["optic_Arco",nil,1000],
						["optic_MRCO",nil,1000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["Rangefinder",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,25],
						["FirstAidKit",nil,75],
						["Medikit",nil,100],
						["ItemRadio","Handy",100],
						["NVGoggles_OPFOR",nil,200],
						["NVGoggles",nil,200]
					]
				];
			};
			default {"Du bist kein Firma Mitglied!"};
		};
	};
	
	case "cop_firma":
	{
		switch(true) do
		{
			case (license_cop_gangfirma && playerSide == west && (__GETC__(life_coplevel) == 2)):
			{
				["Die Firma Security",
					[
						["hlc_rifle_RU5562","AR15Mpul",10000],
						["30Rnd_556x45_Stanag",nil,1000],
						["arifle_MXM_Black_F","MXMBlack",17000],
						["30Rnd_65x39_caseless_mag",nil,3000],
						["optic_Holosight",nil,500],
						["optic_Hamr",nil,1000],
						["optic_Arco",nil,1000],
						["optic_MRCO",nil,1000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["Rangefinder",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,25],
						["FirstAidKit",nil,75],
						["Medikit",nil,100],
						["ItemRadio","Handy",100],
						["NVGoggles_OPFOR",nil,200],
						["NVGoggles",nil,200]
					]
				];
			};
			default {"Dein Rang ist zu niedrig."};
		};
	};
	
	case "cop_firma_chef":
	{
		switch(true) do
		{
			case (license_cop_gangfirma && playerSide == west && (__GETC__(life_coplevel) == 4)):
			{
				["Die Firma Security",
					[
						["hlc_rifle_bcmjack","BCM",8000],
						["hlc_rifle_RU5562","AR15Mpul",10000],
						["30Rnd_556x45_Stanag",nil,1000],
						["arifle_MXM_Black_F","MXMBlack",17000],
						["30Rnd_65x39_caseless_mag",nil,3000],
						["LMG_Mk200_F","Mk200",32000],
						["200Rnd_65x39_cased_Box_Tracer",nil,5000],
						["optic_Holosight",nil,500],
						["optic_Hamr",nil,1000],
						["optic_Arco",nil,1000],
						["FHQ_optic_HWS_G33_tan",nil,1000],
						["optic_MRCO",nil,1000],
						["optic_SOS",nil,2000],
						["optic_DMS",nil,2000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500],
						["RH_peq15_top",nil,500],
						["Rangefinder",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,25],
						["FirstAidKit",nil,75],
						["Medikit",nil,100],
						["ItemRadio","Handy",100],
						["NVGoggles_OPFOR",nil,200],
						["NVGoggles",nil,200]
					]
				];
			};
			default {"Dein Rang ist zu niedrig."};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein Sanitäter!"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,10],
						["Binocular",nil,15],
						["ToolKit",nil,250],
						["FirstAidKit",nil,15],
						["ItemRadio","Handy",100],
						["Medikit",nil,50],
						["NVGoggles",nil,120],
						["B_FieldPack_ocamo",nil,100]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_rebel): {"Du hast keine Rebellenlizenz!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["RH_vp70","VP70",3200],
                        ["RH_18Rnd_9x19_VP",nil,500],
						["hgun_Pistol_heavy_02_F","Zubr .45",5000],
                        ["6Rnd_45ACP_Cylinder",nil,1000],
						["RH_vz61","VZ 61 Skorpion",18000],
						["RH_20Rnd_32cal_vz61",nil,3000],
						["RH_muzi","Micro Uzi",18000],
						["RH_30Rnd_9x19_UZI",nil,3000],
						["hlc_rifle_aks74u","IzmAKS74U",35000],
						["hlc_rifle_ak74_dirty","IzmAK74",35000],
						["hlc_30Rnd_545x39_t_ak",nil,7500],
						["hlc_optic_kobra","Kobravisier",3000],
						["HLC_Optic_PSO1",nil,5000],
						["rhs_weap_svds",nil,50000],
						["rhs_10Rnd_762x54mmR_7N1",nil,10000],
						["rhs_acc_pso1m2",nil,5000],
						["Binocular",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ItemRadio","Handy",100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,75],
						["rhs_weap_rshg2",nil,60000],
						["rhs_rshg2_mag",nil,180000],
						["NVGoggles",nil,200], //beige
						["NVGoggles_OPFOR",nil,200], //schwarz
						["NVGoggles_INDEP",nil,200] //grün
					]
				];
			};
		};
	};
	
	case "rebelinsel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_rebel): {"Du hast keine Rebellenlizenz!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["RH_g17","Glock 17",3200],
                        ["RH_17Rnd_9x19_g17",nil,500],
						["RH_m1911","M1911",5000],
                        ["RH_7Rnd_45cal_m1911",nil,1000],
						["RH_tec9","Intratec TEC-9",18000],
						["RH_32Rnd_9x19_tec",nil,3000],
						["arifle_TRG20_F","TRG20",35000],
						["arifle_TRG21_F","TRG21",35000],
						["RH_M16A3","M16A3",42000],
						["RH_Mk12mod1","Mk 12 Mod 1",42000],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,7500],
						["hlc_rifle_c1A1",nil,50000],
						["hlc_20rnd_762x51_t_fal",nil,13000],
						["hlc_optic_suit",nil,5000],
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_Holosight",nil,2000],
						["optic_Hamr",nil,3500],
						["optic_Arco",nil,3500],
						["optic_MRCO",nil,3500],
						["optic_SOS",nil,5000],
						["optic_DMS",nil,5000],
						["optic_LRPS",nil,5000],
						["acc_flashlight",nil,500],
						["Binocular",nil,15],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ItemRadio","Handy",100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,75],
						["rhs_weap_M136",nil,60000],
						["rhs_m136_mag",nil,180000],
						["NVGoggles",nil,200], //beige
						["NVGoggles_OPFOR",nil,200], //schwarz
						["NVGoggles_INDEP",nil,200] //grün
					]
				];
			};
		};
	};
	
	case "gangdmw":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_gangdmw): {"Du gehörst nicht zu DMW!"};
			default
			{
				["DMW Ausrüstung",
					[
						["RH_m9c","Beretta M9 Camo",3200],
						["RH_m9qd",nil,1000],
						["RH_X300","X300 Light",1000],
						["RH_15Rnd_9x19_M9",nil,500],
						["RH_fnp45t","FNP45 Tactical Tan",5000],
						["RH_osprey","Schalldämpfer",1000],
						["RH_X300",nil,5000],
						["optic_MRD","MRD RedDot",1000],
						["RH_15Rnd_45cal_fnp",nil,1000],
						["RH_Deaglem","Desert Eagle Modern",8000],
						["RH_demz","DE Muzzle",1000],
						["RH_X300","X300 Light",1000],
						["RH_7Rnd_50_AE",nil,500],
						["RH_M4sbr_b","Vitor SBR",42000],
						["RH_M4sbr","Vitor SBR Tan",42000],
						["RH_qdss_nt4","Vitor SD",1500],
						["RH_m4covers_f","Railcovers",1000],
						["RH_SFM952V_tan",nil,1000],
						["RH_eotech553",nil,3000],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,5000],
						["hlc_rifle_honeybadger","Honey Badger",50000],
						["29rnd_300BLK_STANAG_T",nil,1500],
						["muzzle_HBADGER",nil,8000],
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_Holosight",nil,2000],
						["optic_Hamr",nil,3000],
						["optic_Arco",nil,3000],
						["optic_MRCO",nil,3000],
						["optic_SOS",nil,5000],
						["optic_DMS",nil,5000],
						["optic_LRPS",nil,5000],
						["acc_flashlight",nil,1000],
						["Rangefinder",nil,200],
						["ItemRadio","Handy",100],
						["ItemGPS",nil,10],
						["ItemMap","Karte",30],
						["ItemCompass","Kompass",50],
						["ItemWatch","Uhr",10],
						["ToolKit",nil,250],
						["FirstAidKit",nil,75],
						["NVGoggles_INDEP",nil,200],
						["NVGoggles_OPFOR",nil,200],
						["NVGoggles",nil,200]
					]
				];
			};
		};
	};
		
	case "gangadac":
	{
		["ADAC Ausrüstung",
			[
				["Binocular","Fernglas",15],
				["ItemMap","Karte",30],
				["ItemCompass","Kompass",50],
				["ItemWatch","Uhr",10],
				["ItemGPS","GPS",100],
				["ItemRadio","Handy",100],
				["ToolKit",nil,10],
				["FirstAidKit",nil,150],
				["NVGoggles","Nachtsichtgerät",400]
			]
		];
	};
		
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du bist kein Zivilist!"};
			case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["RH_mak","Makarov PM",3200],
						["RH_8Rnd_9x18_Mak",nil,500],
						["RH_tt33","TT33",3200],
                        ["RH_8Rnd_762_tt33",nil,500],
						["hgun_Rook40_F","Rook-40 9mm",3200],
                        ["16Rnd_9x21_Mag",nil,500],
						["RH_ttracker","Tracker 455",5000],
						["RH_6Rnd_45ACP_Mag",nil,1000],
						["RH_sw659","SW 659",3200],
                        ["RH_14Rnd_9x19_sw",nil,500],
						["RH_m1911","M1911",5000],
                        ["RH_7Rnd_45cal_m1911",nil,1000],
						["hgun_ACPC2_F","ACP-C2 .45",5000],
                        ["9Rnd_45ACP_Mag",nil,1000],
						["RH_gsh18","GSH-18",3200],
                        ["RH_18Rnd_9x19_gsh",nil,500],
						["SMG_01_F","Vermin",25000],
						["30Rnd_45ACP_Mag_SMG_01",nil,700],
						["hlc_smg_MP5N",nil,21000],
						["hlc_30Rnd_9x19_GD_MP5",nil,650],
						["optic_Aco_smg",nil,2000],
						["optic_ACO_grn_smg",nil,2000],
						["optic_Holosight_smg",nil,2000],
						["acc_flashlight",nil,1000],
						["G_Bandanna_khk",nil,3200],
						["G_Bandanna_tan",nil,3200],
						["V_Rangemaster_belt",nil,600],
						["V_Press_F",nil,1200]
					]
				];
			};
		};
	};
		
	case "genstore":
	{
		["Needful Things",
			[
				["Binocular","Fernglas",15],
				["ItemMap","Karte",30],
				["ItemCompass","Kompass",50],
				["ItemWatch","Uhr",10],
				["ItemGPS","GPS",500],
				["ItemRadio","Handy",100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles","Nachtsichtgerät",400]
			]
		];
	};
};
