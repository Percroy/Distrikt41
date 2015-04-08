#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_siren_active = false;
life_clothing_filter = 0;
life_energydrink_effect = time;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;

life_respawn_timer = 3; //Scaled in minutes

life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_action_gathering = false;
life_action_gather = false;
life_fatigue = 0.6; //Set the max fatigue limit (60%)
delay_pickaxe = false;

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?

//Revive constant variables.
__CONST__(life_revive_cops,FALSE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,2500); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,3); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_enableFatigue,true); //Enable / Disable the ARMA 3 Fatigue System
 __CONST__(life_gangPrice,25000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
 __CONST__(life_gangUpgradeBase,75000);
 __CONST__(life_gangUpgradeMultipler,2);

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];


/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
D41_pos_delivery_in_progress = false;
D41_neg_delivery_in_progress = false;
D41_AfkCheck = getPos player;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,5); //Five minutes
D41_Geld = 0;
__CONST__(life_impound_car,350);
__CONST__(life_impound_boat,250);
__CONST__(life_impound_air,850);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];


switch (playerSide) do
{
	case west: 
	{
		D41_atmGeld = 15000; //Starting Bank Money
		life_paycheck = 500; //Paycheck Amount
	};
	case civilian: 
	{
		D41_atmGeld = 15000; //Starting Bank Money
		life_paycheck = 350; //Paycheck Amount
	};
	
	case independent:
	{
		D41_atmGeld = 15000;
		life_paycheck = 3500;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_med_air","med"],
	["license_med_adac","med"],
	["license_civ_bjerky","civ"],
	["license_civ_home","civ"],
	["license_civ_coal","civ"],
	//D41
	["license_civ_Bruchstein","civ"],
	["license_civ_hunt","civ"],
	["license_civ_Schnaps","civ"],
	["license_civ_Saft","civ"],
	["license_civ_Zement","civ"],
	["license_civ_Stahl","civ"],
	["license_civ_Krabben","civ"],
	["license_civ_WKompL","civ"],
	["license_civ_FahrzeugT","civ"],
	["license_civ_Kerosin","civ"],
	["license_civ_Ton","civ"],
	//D41 - Gruppen " , " Am ende beachten!
	["license_civ_gangdmw","civ"],
	["license_civ_ganglast","civ"],
	["license_cop_gangfirma","cop"],
	["license_civ_gangrr","civ"],
	["license_civ_gangpow","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

//life_pd_points = [];
//Karma Missionen Ziel Arrays erstmal nur für + und - kann man später aufteilen um bessere ziele für items einzugrenzen
D41_pos_karma_points = ["pd_pos_01","pd_pos_02","pd_pos_03","pd_pos_04","pd_pos_05","pd_pos_06","pd_pos_07","pd_pos_08","pd_pos_09","pd_pos_10","pd_pos_11","pd_pos_12","pd_pos_13","pd_pos_14"];
D41_neg_karma_points = ["pd_neg_01","pd_neg_02","pd_neg_03","pd_neg_04","pd_neg_05","pd_neg_06","pd_neg_07","pd_neg_08","pd_neg_09","pd_neg_10","pd_neg_11"];

life_illegal_items = [["D41_HeleneFischerCD",2000],["D41_Bankbauplan",2000],["D41_FalscherAusweis",2000],["D41_Faultierhoden",5000],["D41_HeroinRoh",1200],["D41_Heroin",2500],["D41_KokainRoh",1500],["D41_Kokain",3500],["D41_CannabisRoh",1000],["D41_Cannabis",2000],["D41_Schildkroete",3000],["D41_Sprengladung",10000],["D41_Bolzenschneider",5000]];


/*
	Sell / buy arrays
*/

buy_array =   //Was man zahlen muss wenn man einkauft
{[
//Lebensmittel Einkauf
	["D41_WaterBottle",10],
	["D41_Kaffee",10],
	["D41_Apfelsaft",D41_KPreisApfelsaft],
	["D41_Pfirsichsaft",D41_KPreisPfirsichsaft],
	["D41_EnergyDrink",500],
	["D41_Apfelschnaps",D41_KPreisApfelschnaps],
	["D41_Pfirsichschnaps",D41_KPreisPfirsichschnaps],
	["D41_Apfel",D41_KPreisApfel],
	["D41_Pfirsich",D41_KPreisPfirsich],
	["D41_Donuts",100],
	["D41_Hasenfleisch",75],
	["D41_BeefJerky",D41_KPreisbjerky],
	["D41_Salema",55],
	["D41_Ornate",50],
	["D41_Mackrele",200],
	["D41_Tunfisch",900],
	["D41_Mullet",300],
	["D41_Katzenhai",350],
	["D41_Schildkroete",4000],
	["D41_SchildkroetenSuppe",2500],
	
//Verbrauchsgüter Einkauf
	["D41_Dietrich",1000],
	["D41_Kabelbinder",1000],
	["D41_Sprengladung",15000],
	["D41_Bolzenschneider",2000],
	["D41_BenzinKanister",250],
	["D41_LagerkisteKlein",5000],
	["D41_LagerkisteGross",50000],
	["D41_LagerkisteLagerhaus",100000],
	
//Werkzeuge	 Einkauf
	["D41_Spitzhacke",250],
	["D41_Gartenschere",50],
	["D41_Schaufel",200],
	["D41_Schuerfgeschirr",5000],
	["D41_Bohrausruestung",10000],
	
//Copsausrüstung Einkauf
	["D41_Nagelband",100],
	["D41_BombeWegMachtKit",500],
	["D41_Strahler",800],
	["D41_Mauer",1000],
	["D41_Schranke",3500],
	["D41_Blitzer",2000],
	
//Rohstoffe Einkauf
	["D41_GoldBarren",25000],
	["D41_Kalkstein",D41_KPreisKalkstein],
	["D41_Ton",D41_KPreisTon],
	["D41_Glas",D41_KPreisglass],
	["D41_Zement",D41_KPreisZement],
	["D41_Salz",D41_KPreissalt_r],
	["D41_Oel",D41_KPreisoilP],
	["D41_Kerosin",D41_KPreisKerosin],
	["D41_Kupfer",D41_KPreiscopper_r],
	["D41_Eisen",D41_KPreisiron_r],
	["D41_Kohle",D41_KPreiscoal],
	["D41_Diamanten",D41_KPreisdiamondc],
	["D41_Stahl",D41_KPreisStahl],
	["D41_Krabben",D41_KPreisKrabben],
	["D41_WaffenKomponenten",D41_KPreisWKomp],
	["D41_Fahrzeugteile",D41_KPreisFahrzeugteile],
	["D41_Kokain",D41_KPreiscocainep],
	["D41_Cannabis",D41_KPreismarijuana],
	["D41_Heroin",D41_KPreisheroinP],

//Normale Gegenstände Einkauf
	["Binocular",45],
	["ItemMap",75],
	["ItemCompass",45],
	["ItemWatch",75],
	["ItemGPS",45],
	["ItemRadio",45],
	["Medikit",350],
	["FirstAidKit",150],
	["ToolKit",350],
	["B_UavTerminal",350],
	["NVGoggles",350],
	["NVGoggles_INDEP",350],
	["NVGoggles_OPFOR",350],
	["pmc_earpiece",250],
	["TFAx_NVGoggles2",250],
	["HandGrenade_Stone",950],
	["SmokeShellBlue",850],
	["Rangefinder",350],
	["Laserdesignator",1500],
	
//Leichte Pistolen (9mm) Einkauf
						["RH_m9",3200],
                        ["RH_m9c",3200],
                        ["RH_15Rnd_9x19_M9",500],
						["RH_cz75",3200],
                        ["RH_16Rnd_9x19_CZ",500],
						["RH_fn57",3200],
                        ["RH_fn57_t",3200],
                        ["RH_fn57_g",3200],
                        ["RH_20Rnd_57x28_FN",500],
						["RH_g17",3200],
                        ["RH_17Rnd_9x19_g17",500],
                        ["RH_g18",3200],
	                    ["RH_g19",3200],
                        ["RH_g19t",3200],
                        ["RH_19Rnd_9x19_g18",500],
						["RH_33Rnd_9x19_g18",1000],
						["RH_gsh18",3200],
                        ["RH_18Rnd_9x19_gsh",500],
						["RH_mak",3200],
                        ["RH_8Rnd_9x18_Mak",500],
						["hgun_P07_F",3200],
                        ["hgun_Rook40_F",3200],
                        ["16Rnd_9x21_Mag",500],
						["RH_mk2",1200],
                        ["RH_10Rnd_22LR_mk2",500],
						["RH_p226",3200],
                        ["RH_p226s",3200],
                        ["RH_15Rnd_9x19_SIG",500],
                        ["RH_sw659",3200],
                        ["RH_14Rnd_9x19_sw",500],
						["RH_tt33",3200],
                        ["RH_8Rnd_762_tt33",500],
						["RH_vp70",3200],
                        ["RH_18Rnd_9x19_VP",500],
//Mittlere Pistolen (45er) Einkauf
						["CUP_hgun_Phantom",5000],
						["CUP_18Rnd_9x19_Phantom",1000],
						["hgun_Pistol_heavy_01_F",5000],
                        ["11Rnd_45ACP_Mag",1000],
                        ["hgun_ACPC2_F",5000],
                        ["9Rnd_45ACP_Mag",1000],
						["RH_fnp45",5000],
                        ["RH_fnp45t",5000],
                        ["RH_15Rnd_45cal_fnp",1000],
						["RH_kimber",5000],
                        ["RH_kimber_nw",5000],
                        ["RH_m1911",5000],
                        ["RH_7Rnd_45cal_m1911",1000],
						["RH_ttracker",5000],
                        ["RH_ttracker_g",5000],
                        ["RH_6Rnd_45ACP_Mag",1000],
						["RH_usp",5000],
                        ["RH_12Rnd_45cal_usp",1000],
                        ["RH_uspm",5000],
                        ["RH_16Rnd_40cal_usp",1000],
						["hgun_Pistol_heavy_02_F",5000],
                        ["6Rnd_45ACP_Cylinder",1000],
//Schwere Pistolen (50er) Einkauf
						["RH_python",8000],
                        ["RH_6Rnd_357_Mag",2000],
                        ["RH_deagle",8000],
                        ["RH_Deagleg",8000],
                        ["RH_Deaglem",8000],
                        ["RH_Deagles",8000],
                        ["RH_7Rnd_50_AE",2000],
						["RH_mp412",8000],
                        ["RH_6Rnd_357_Mag",2000],
						["RH_bull",8000],
                        ["RH_bullb",8000],
                        ["RH_6Rnd_454_Mag",2000],
						["RH_mateba",8000],
                        ["RH_6Rnd_44_Mag",2000],
//Pistolen Attachments Einkauf
						["CUP_acc_CZ_M3X",1000],
                        ["optic_MRD",1000],
                        ["optic_Yorris",1000],
                        ["RH_docter",1000],
                        ["RH_M6X",1000],
                        ["RH_X2",1000],
                        ["RH_X300",1000],
                        ["RH_Deflash",1000],
						["RH_pmIR",1000],
                        ["muzzle_snds_acp",3200],
                        ["RH_m9qd",3200],
                        ["RH_gemtech9",3200],
                        ["muzzle_snds_L",3200],
                        ["RH_demz",3200],
                        ["RH_sfn57",3200],
                        ["RH_gemtech45",3200],
                        ["RH_osprey",3200],
                        ["RH_pmsd",3200],
                        ["RH_suppr9",3200],
                        ["RH_aacusp",3200],
                        ["RH_fhusp",3200],
                        ["RH_matchsd",3200],
//Leichte MPs Einkauf
						["RH_vz61",18000],
						["RH_20Rnd_32cal_vz61",3000],
						["RH_muzi",18000],
						["RH_30Rnd_9x19_UZI",3000],
						["RH_tec9",18000],
						["RH_32Rnd_9x19_tec",3000],
//Mittlere MPs Einkauf
						["hlc_smg_mp5k_PDW",21000],
						["hlc_30Rnd_9x19_GD_MP5",4000],
						["hgun_PDW2000_F",21000],
						["SMG_02_F",21000],
						["30Rnd_9x21_Mag",4000],
						["hlc_smg_mp5a2",15000],
						["hlc_smg_mp5a3",21000],
						["hlc_smg_mp5a4",21000],
						["hlc_smg_MP5N",21000],
						["hlc_30Rnd_9x19_B_MP5",4000],
//Schwere MPs Einkauf
						["SMG_01_F",25000],
						["30Rnd_45ACP_Mag_SMG_01",5000],
						["hlc_smg_mp510",20000],
						["hlc_30Rnd_10mm_B_MP5",5000],
						["hlc_30Rnd_10mm_JHP_MP5",5000],
						["hlc_smg_mp5sd5",25000],
						["hlc_smg_mp5sd6",25000],
						["hlc_30Rnd_9x19_SD_MP5",5000],
						["hlc_rifle_hk53",25000],
						["hlc_30rnd_556x45_b_HK33",5000],
//MP Attachments Einkauf
						["muzzle_snds_L",5000],
						["muzzle_snds_acp",5000],
						["RH_tecsd",5000],
						["hlc_muzzle_Agendasix10mm",5000],
						["hlc_muzzle_Agendasix",5000],
						["hlc_muzzle_Tundra",5000],
						["RH_muzisd",5000],
//Sturm Leicht Einkauf
						["rhs_weap_ak74m_2mag",35000],
						["rhs_weap_ak74m_2mag_camo",35000],
						["rhs_weap_ak74m",35000],
						["rhs_weap_ak74m_folded",35000],
						["rhs_weap_ak74m_camo",35000],
						["rhs_weap_ak74m_desert",35000],
						["rhs_acc_pso1m2",5000],
						["rhs_acc_1p29",5000],
						["rhs_acc_pkas",3500],
						["rhs_30Rnd_545x39_AK",7500],
						["rhs_30Rnd_545x39_AK_green",7500],
						["hlc_rifle_ak12",35000],
						["hlc_rifle_ak74",35000],
						["hlc_rifle_ak74_dirty",35000],
						["hlc_rifle_aks74",35000],
						["hlc_rifle_aks74u",35000],
						["hlc_rifle_aek971",35000],
						["hlc_rifle_aku12",35000],
						["hlc_30Rnd_545x39_S_AK",7500],
						["hlc_30Rnd_545x39_B_AK",7500],
						["hlc_30Rnd_545x39_EP_ak",7500],
						["hlc_30Rnd_545x39_t_ak",7500],
						["arifle_Mk20_plain_F",35000],
						["arifle_Mk20_F",35000],
						["arifle_Mk20C_plain_F",35000],
						["hlc_rifle_M4",35000],
						["hlc_rifle_CQBR",35000],
						["arifle_Mk20C_F",35000],
						["arifle_TRG20_F",35000],
						["arifle_TRG21_F",35000],
						["arifle_SDAR_F",35000],
						["20Rnd_556x45_UW_mag",7500],
//Sturm Mittel Einkauf
						["rhs_weap_m16a4",42000],
						["rhs_weap_m16a4_carryhandle",42000],
						["rhs_weap_m16a4_grip",42000],
						["rhs_weap_m4",42000],
						["rhs_weap_m4_carryhandle",42000],
						["rhs_weap_m4_carryhandle_pmag",42000],
						["rhs_weap_m4_bipod",42000],
						["rhs_weap_m4_grip",42000],
						["rhs_weap_m4a1",42000],
						["rhs_weap_m4a1_grip",42000],
						["hlc_rifle_RU5562",42000],
						["hlc_rifle_RU556",42000],
						["hlc_rifle_bcmjack",42000],
						["hlc_rifle_Colt727",42000],
						["RH_M16A2",42000],
						["RH_M16A3",42000],
						["RH_M16A4",42000],
						["RH_M16A4_m",42000],
						["RH_m4",42000],
						["RH_M4_ris",42000],
						["RH_M4A1_ris",42000],
						["RH_M4sbr_b",22000],
						["RH_M4sbr_g",42000],
						["RH_M4sbr",42000],
						["CUP_arifle_CZ805_A1",42000],
						["CUP_arifle_CZ805_A2",42000],
						["CUP_arifle_G36A",42000],
						["CUP_arifle_G36A_camo",42000],
						["CUP_arifle_G36C",42000],
						["CUP_arifle_G36C_camo",42000],
						["CUP_arifle_G36K",42000],
						["CUP_arifle_G36K_camo",42000],
						["CUP_arifle_L85A2",42000],
						["CUP_arifle_L86A2",42000],
						["CUP_arifle_Mk16_CQC",42000],
						["CUP_arifle_Mk16_CQC_FG",42000],
						["CUP_arifle_Mk16_CQC_SFG",42000],
						["CUP_arifle_Mk16_CQC_EGLM",42000],
						["CUP_arifle_Mk16_STD",42000],
						["CUP_arifle_Mk16_STD_FG",42000],
						["CUP_arifle_Mk16_SV",42000],	
						["CUP_20Rnd_556x45_Stanag",5000],
						["30Rnd_556x45_Stanag",7500],
						["30Rnd_556x45_Stanag_Tracer_Red",7500],
						["30Rnd_556x45_Stanag_Tracer_Green",7500],
						["arifle_Katiba_F",42000],
						["arifle_Katiba_C_F",42000],
						["30Rnd_65x39_caseless_green",8000],
						["30Rnd_65x39_caseless_green_mag_Tracer",8000],
						["arifle_MX_F",42000],
						["arifle_MX_blk_F",42000],
						["arifle_MX_Black_F",42000],
						["arifle_MXC_F",42000],
						["arifle_MXC_Black_F",42000],
						["arifle_MXM_F",42000],
						["arifle_MXM_Black_F",42000],
						["30Rnd_65x39_caseless_mag",8000],
						["30Rnd_65x39_caseless_mag_Tracer",8000],
//Sturm Schwer Einkauf
						["CUP_arifle_CZ805_B",50000],
						["CUP_20Rnd_762x51_CZ805B",10000],
						["CUP_20Rnd_TE1_White_Tracer_762x51_CZ805B",10000],
						["CUP_arifle_Mk17_CQC",50000],
						["CUP_arifle_Mk17_CQC_FG",50000],
						["CUP_arifle_Mk17_STD",50000],
						["CUP_arifle_Mk17_STD_FG",50000],
						["CUP_arifle_Mk20",50000],
						["CUP_muzzle_mfsup_SCAR_H",8000],
						["CUP_muzzle_snds_SCAR_H",8000],
						["CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR",10000],
						["CUP_20Rnd_762x51_B_SCAR",10000],
						["hlc_rifle_honeybadger",50000],
						["muzzle_HBADGER",8000],
						["hlc_rifle_vendimus",10000],
						["hlc_rifle_Bushmaster300",10000],
						["29rnd_300BLK_STANAG",10000],
						["29rnd_300BLK_STANAG_T",10000],
						["29rnd_300BLK_STANAG_S",10000],
						["RH_ar10",50000],
						["RH_Delft",5000],
						["RH_20Rnd_762x51_AR10",10000],
						["hlc_rifle_falosw",50000],
						["hlc_rifle_L1A1SLR",50000],
						["hlc_rifle_STG58F",50000],
						["hlc_rifle_c1A1",50000],
						["hlc_rifle_FAL5061",50000],
						["hlc_rifle_SLR",50000],
						["hlc_rifle_SLRchopmod",50000],
						["hlc_rifle_LAR",50000],
						["hlc_20rnd_762x51_b_fal",10000],
						["hlc_20Rnd_762x51_T_fal",10000],
						["hlc_20rnd_762x51_s_fal",10000],
						["hlc_rifle_hk51",50000],
						["hlc_rifle_g3sg1",50000],
						["hlc_rifle_g3a3",50000],
						["hlc_rifle_g3ka4",50000],
						["hlc_20rnd_762x51_b_G3",10000],
						["hlc_20rnd_762x51_T_G3",10000],
						["hlc_20rnd_762x51_S_G3",10000],
						["hlc_rifle_ak47",50000],
						["hlc_rifle_akm",50000],
						["hlc_30Rnd_762x39_b_ak",10000],
						["hlc_30Rnd_762x39_t_ak",10000],
						["hlc_30rnd_762x39_s_ak",10000],
						["srifle_EBR_F",50000],
						["20Rnd_762x51_Mag",10000],
						["srifle_DMR_01_F",50000],
						["10Rnd_762x51_Mag",10000],
						["hlc_rifle_M14",50000],
						["hlc_rifle_m14sopmod",50000],
						["hlc_20Rnd_762x51_B_M14",10000],
						["hlc_20Rnd_762x51_T_M14",10000],
						["hlc_20Rnd_762x51_S_M14",10000],
//Sniper Leicht Einkauf
						["hlc_rifle_SAMR",42000],
						["hlc_rifle_samr2",42000],
						["hlc_30rnd_556x45_S",8000],
						["hlc_30rnd_556x45_SPR",8000],
						["hlc_30rnd_556x45_SOST",8000],
						["hlc_30rnd_556x45_EPR",8000],
						["RH_Mk12mod1",42000],
						["RH_SAMR",42000],						
						["CUP_srifle_LeeEnfield",42000],
						["CUP_10x_303_M",8000],
//Sniper Mittel Einkauf
						["CUP_srifle_CZ750",50000],
						["CUP_10Rnd_762x51_CZ750_Tracer",10000],
						["CUP_srifle_LeeEnfield",50000],
						["CUP_10x_303_M",10000],
						["CUP_srifle_VSSVintorez",50000],
						["CUP_10Rnd_9x39_SP5_VSS_M",10000],
						["CUP_optic_PSO_1",5000],
						["CUP_optic_PSO_3",5000],
						["hlc_rifle_psg1",50000],
						["hlc_rifle_m14dmr",50000],
						["hlc_rifle_M21",50000],
						["hlc_20Rnd_762x51_B_M14",10000],
						["hlc_20Rnd_762x51_T_M14",13000],
						["hlc_20Rnd_762x51_S_M14",13000],
						["rhs_weap_m14ebrri",50000],
						["rhs_weap_svdp",50000],
						["rhs_weap_svdp_wd",50000],
						["rhs_weap_svds",50000],
						["rhs_10Rnd_762x54mmR_7N1",10000],
//Sniper Schwer Einkauf
						["CUP_srifle_AWM_des",75000],
						["CUP_srifle_AWM_wdl",75000],
						["CUP_5Rnd_86x70_L115A1",15000],
						["CUP_srifle_CZ550",75000],
						["CUP_5x_22_LR_17_HMR_M",1500],
						["CUP_srifle_M110",75000],
						["CUP_20Rnd_762x51_B_M110",15000],
						["CUP_20Rnd_TE1_White_Tracer_762x51_M110",15000],
						["CUP_muzzle_snds_M110",5000],
						["CUP_srifle_M24_ghillie",75000],
						["CUP_srifle_M24_des",75000],
						["CUP_srifle_M24_wdl",75000],
						["CUP_srifle_M40A3",75000],
						["CUP_5Rnd_762x51_M24",15000],
						["rhs_weap_XM2010",75000],
						["rhs_weap_XM2010_wd",75000],
						["rhs_weap_XM2010_d",75000],
						["rhs_weap_XM2010_sa",75000],
						["rhsusf_5Rnd_300winmag_xm2010",15000],
						["rhsusf_acc_LEUPOLDMK4_2",5000],
						["srifle_GM6_F",75000],
						["srifle_GM6_camo_F",75000],
						["5Rnd_127x108_Mag",15000],
						["srifle_LRR_F",75000],
						["srifle_LRR_camo_F",75000],
						["7Rnd_408_Mag",15000],
//Maschinengewehre Leicht Einkauf
						["rhs_weap_m249_pip",50000],
						["rhsusf_100Rnd_556x45_soft_pouch",10000],	
						["hlc_rifle_RPK12",50000],
						["hlc_45Rnd_545x39_t_rpk",10000],	
						["CUP_arifle_MG36",50000],
						["CUP_arifle_MG36_camo",50000],
						["CUP_100Rnd_556x45_BetaCMag",10000],
						["CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag",10000],
//Maschinengewehre Mittel Einkauf
						["LMG_Mk200_F",75000],
						["200Rnd_65x39_cased_Box",18000],
						["200Rnd_65x39_cased_Box_Tracer",18000],
						["arifle_MX_SW_F",75000],
						["arifle_MX_SW_Black_F",75000],
						["100Rnd_65x39_caseless_mag",18000],
						["100Rnd_65x39_caseless_mag_Tracer",18000],
//Maschinengewehre Schwer Einkauf
						["hlc_rifle_rpk",100000],
						["hlc_75Rnd_762x39_m_rpk",25000],
						["hlc_45Rnd_762x39_m_rpk",25000],
						["hlc_45Rnd_762x39_t_rpk",25000],
						["hlc_lmg_m60",100000],
						["hlc_lmg_M60E4",100000],
						["hlc_100Rnd_762x51_B_M60E4",25000],
						["hlc_100Rnd_762x51_M_M60E4",25000],
						["hlc_100Rnd_762x51_T_M60E4",25000],
						["LMG_Zafir_F",100000],
						["150Rnd_762x51_Box",25000],
                        ["150Rnd_762x51_Box_Tracer",25000],
//Raketenwerfer Einkauf
						["rhs_weap_rpg7",75000],
						["rhs_acc_pgo7v",10000],
						["rhs_rpg7_OG7V_mag",225000],
						["rhs_rpg7_PG7VL_mag",225000],
						["rhs_weap_M136",60000],
						["rhs_m136_mag",180000],
						["rhs_weap_rshg2",60000],
						["rhs_rshg2_mag",180000],
//Schrotflinte Einkauf
						["hlc_rifle_saiga12k",15000],
						["hlc_10rnd_12g_slug_S12",2500],
						["hlc_10rnd_12g_buck_S12",2500],
						["CUP_sgun_M1014",15000],
						["CUP_8Rnd_B_Beneli_74Slug",2500],
//Sonstiges Einkauf
						["D41_TTrackerGummi",2500],
						["Gummigeschiss_Mag",1000],
						["rhs_mag_rdg2_white",800],
						["rhs_mag_rdg2_black",800],
						["CUP_1Rnd_SmokeGreen_M203",2500],
						["SmokeShellGreen",1000],
						["rhs_weap_M320",30000],
						["3Rnd_SmokeGreen_Grenade_shell",5000],
						["3Rnd_UGL_FlareWhite_F",5000],
						["3Rnd_UGL_FlareCIR_F",5000],
						["DemoCharge_Remote_Mag",50000],
						["SatchelCharge_Remote_Mag",150000],
//Schalldämpfer Einkauf
						["hlc_muzzle_545SUP_AK",8000],
						["muzzle_snds_B",8000],
						["muzzle_snds_H",8000],
						["RH_qdss_nt4",8000],
						["RH_saker",8000],
						["muzzle_snds_M",8000],
						["hlc_muzzle_snds_M14",8000],
						["hlc_muzzle_snds_fal",8000],
						["RH_spr_mbs",8000],
						["hlc_muzzle_556NATO_KAC",8000],
						["hlc_muzzle_762SUP_AK",8000],
						["hlc_muzzle_snds_HK33",8000],
						["hlc_muzzle_snds_g3",8000],
						["hlc_muzzle_300blk_KAC",8000],
						["rhs_acc_tgpa",8000],
						["CUP_muzzle_snds_G36_black",8000],
						["CUP_muzzle_snds_G36_desert",8000],
						["CUP_muzzle_mfsup_SCAR_L",8000],
						["CUP_muzzle_snds_SCAR_L",8000],
						
//LL-M Rails Einkauf
						["acc_pointer_IR",500],
						["acc_flashlight",500],
						["RH_m16covers_f",500],
						["RH_m16covers_s",500],
						["RH_peq15",500],
						["rhsusf_acc_anpeq15",1000],
						["RH_peq15_top",500],
						["RH_peq2",500],
						["RH_peq2_top",500],
						["RH_SFM952V",500],
						["RH_SFM952V_tan",500],
						["RH_m4covers_f",500],
						["RH_m4covers_s",500],
						["FHQ_acc_LLM01L",500],
//CQB Scopes Einkauf
						["CUP_optic_CompM2_Woodland",2000],
						["CUP_optic_CompM2_Black",2000],
						["hlc_optic_kobra",2000],
						["rhs_acc_1p63",2000],
						["rhs_acc_ekp1b",2000],
						["optic_ACO_grn",2000],
						["optic_Aco",2000],
						["optic_Holosight",2000],
						["optic_ACO_grn_smg",2000],
						["optic_Aco_smg",2000],
						["optic_Holosight_smg",2000],
						["RH_compm4s",2000],
						["RH_t1",2000],
						["RH_eotech553",2000],
						["RH_shortdot",2000],
						["RH_reflex",2000],
						["FHQ_optic_AC12136",2000],
						["FHQ_optic_AC11704_tan",2000],
						["FHQ_optic_AC11704",2000],
						["FHQ_optic_AIM",2000],
						["FHQ_optic_AIM_tan",2000],
						["RH_t1",2000],
						["RH_eotech553",2000],
						["RH_reflex",2000],
						["rhs_acc_pkas",2000],
						["FHQ_optic_MARS",2000],
						["FHQ_optic_MARS_tan",2000],
						["FHQ_optic_MicroCCO",2000],
						["FHQ_optic_MicroCCO_tan",2000],
						["FHQ_optic_MicroCCO_low",2000],
						["FHQ_optic_MicroCCO_low_tan",2000],
						["FHQ_optic_HWS",2000],
						["FHQ_optic_HWS_tan",2000],
						["CUP_optic_Eotech533",2000],
						["CUP_optic_CompM2_Desert",2000],
						["CUP_optic_CompM2_Woodland2",2000],
//Mid Range Scopes Einkauf
						["rhsusf_acc_ACOG",3500],
						["rhsusf_acc_ACOG3",3500],
						["FHQ_optic_ACOG_tan",3500],
						["RH_ta31rco",3500],
						["FHQ_optic_ACOG",3500],
						["FHQ_optic_HWS_G33",3500],
						["FHQ_optic_HWS_G33_tan",3500],
						["CUP_optic_ELCAN_SpecterDR",3500],
						["HLC_Optic_1p29",3500],
						["optic_Hamr",3500],
						["RH_ta31rco_2D",3500],
						["CUP_optic_SUSAT",3500],
						["optic_MRCO",3500],
						["optic_Arco",3500],
						["RH_m3lr",3500],
						["hlc_optic_PVS4M14",3500],
						["hlc_optic_artel_m14",3500],
						["hlc_optic_PVS4FAL",3500],
						["hlc_optic_suit",3500],
						["hlc_optic_accupoint_g3",3500],
						["hlc_optic_PVS4G3",3500],
						["HLC_Optic_ZFSG1",3500],
						["rhsusf_acc_compm4",3500],
						["rhsusf_acc_HAMR",3500],
						["rhs_acc_1p29",3500],
						["RH_m3lr",3500],
						["CUP_optic_RCO_desert",3500],
						["CUP_optic_RCO",3500],		
						["CUP_optic_ACOG",3500],		
						
//Long Range Scopes Einkauf
						["CUP_optic_SB_11_4x20_PM",5000],
						["CUP_optic_SB_3_12x50_PMII",5000],						
						["HLC_Optic_PSO1",5000],
						["optic_LRPS",5000],
						["optic_DMS",5000],
						["optic_SOS",5000],
						["optic_NVS",5000],	
						["RH_m3lr",5000],
						["CUP_optic_AN_PVS_10",5000],
						["CUP_optic_LeupoldMk4_10x40_LRT_Desert",5000],
						["CUP_optic_LeupoldMk4_10x40_LRT_Woodland",5000],
						["CUP_optic_LeupoldM3LR",5000],
						["CUP_optic_LeupoldMk4",5000],
						["CUP_optic_LeupoldMk4_MRT_tan",5000],
						["CUP_optic_Leupold_VX3",5000],
						["hlc_optic_LRT_m14",5000],
						["rhs_acc_pso1m2",5000],
						["rhsusf_acc_LEUPOLDMK4",5000],
						["rhsusf_acc_LEUPOLDMK4_2",5000],
						["FHQ_optic_LeupoldERT_tan",5000],
						["FHQ_optic_LeupoldERT",5000]
];};

sell_array =   //Die Preise zu denen man verkauft
{[
//Lebensmittel Verkauf
	["D41_WaterBottle",5],
	["D41_Kaffee",5],
	["D41_Apfelsaft",D41_VPreisApfelsaft],
	["D41_Pfirsichsaft",D41_VPreisPfirsichsaft],
	["D41_EnergyDrink",200],
	["D41_Apfelschnaps",D41_VPreisApfelschnaps],
	["D41_Pfirsichschnaps",D41_VPreisPfirsichschnaps],
	["D41_Apfel",D41_VPreisApfel],
	["D41_Pfirsich",D41_VPreisPfirsich],
	["D41_Donuts",40],
	["D41_Hasenfleisch",30],
	["D41_BeefJerky",D41_VPreisbjerky],
	["D41_Salema",25],
	["D41_Ornate",20],
	["D41_Mackrele",75],
	["D41_Tunfisch",300],
	["D41_Mullet",110],
	["D41_Katzenhai",150],
	["D41_Schildkroete",1],
	["D41_SchildkroetenSuppe",1],

//Verbrauchsgüter Verkauf
	["D41_Dietrich",400],
	["D41_Kabelbinder",100],
	["D41_Sprengladung",5000],
	["D41_Bolzenschneider",500],
	["D41_BenzinKanister",100],
	["D41_LagerkisteKlein",1000],
	["D41_LagerkisteGross",10000],
	["D41_LagerkisteLagerhaus",25000],
	
//Werkzeuge Verkauf
	["D41_Spitzhacke",100],
	["D41_Gartenschere",25],
	["D41_Schaufel",100],
	["D41_Schuerfgeschirr",2500],
	["D41_Bohrausruestung",4000],
	
//Copsausrüstung Verkauf
	["D41_Nagelband",10],
	["D41_BombeWegMachtKit",400],
	["D41_Strahler",400],
	["D41_Mauer",500],
	["D41_Schranke",2500],
	["D41_Blitzer",1000],

//Rohstoffe Verkauf
	["D41_GoldBarren",10000],
	["D41_Kalkstein",D41_VPreisKalkstein],
	["D41_Ton",D41_VPreisTon],
	["D41_Glas",D41_VPreisglass],
	["D41_Zement",D41_VPreisZement],
	["D41_Salz",D41_VPreissalt_r],
	["D41_Oel",D41_VPreisoilP],
	["D41_Kerosin",D41_VPreisKerosin],
	["D41_Kupfer",D41_VPreiscopper_r],
	["D41_Eisen",D41_VPreisiron_r],
	["D41_Kohle",D41_VPreiscoal],
	["D41_Diamanten",D41_VPreisdiamondc],
	["D41_Stahl",D41_VPreisStahl],
	["D41_Krabben",D41_VPreisKrabben],
	["D41_WaffenKomponenten",D41_VPreisWKomp],
	["D41_Fahrzeugteile",D41_VPreisFahrzeugteile],
	["D41_Kokain",D41_VPreiscocainep],
	["D41_Cannabis",D41_VPreismarijuana],
	["D41_Heroin",D41_VPreisheroinP],
	
//Normale Gegenstände Verkauf
	["Binocular",15],
	["ItemMap",25],
	["ItemCompass",15],
	["ItemWatch",25],
	["ItemGPS",15],
	["Medikit",50],
	["FirstAidKit",50],
	["ItemRadio",45],
	["ToolKit",50],
	["B_UavTerminal",15],
	["NVGoggles",150],
	["NVGoggles_INDEP",150],
	["NVGoggles_OPFOR",150],
	["pmc_earpiece",150],
	["TFAx_NVGoggles2",150],
	["HandGrenade_Stone",250],
	["SmokeShellBlue",450],
	["Rangefinder",150],
	["Laserdesignator",500],

//Leichte Pistolen (9mm) Verkauf
						["RH_m9",1600],
                        ["RH_m9c",1600],
                        ["RH_15Rnd_9x19_M9",250],
						["RH_cz75",1600],
                        ["RH_16Rnd_9x19_CZ",250],
						["RH_fn57",1600],
                        ["RH_fn57_t",1600],
                        ["RH_fn57_g",1600],
                        ["RH_20Rnd_57x28_FN",250],
						["RH_g17",1600],
                        ["RH_17Rnd_9x19_g17",250],
                        ["RH_g18",1600],
	                    ["RH_g19",1600],
                        ["RH_g19t",1600],
                        ["RH_19Rnd_9x19_g18",250],
						["RH_33Rnd_9x19_g18",500],
						["RH_gsh18",1600],
                        ["RH_18Rnd_9x19_gsh",250],
						["RH_mak",1600],
                        ["RH_8Rnd_9x18_Mak",250],
						["hgun_P07_F",1600],
                        ["hgun_Rook40_F",1600],
                        ["16Rnd_9x21_Mag",250],
						["RH_mk2",1200],
                        ["RH_10Rnd_22LR_mk2",250],
						["RH_p226",1600],
                        ["RH_p226s",1600],
                        ["RH_15Rnd_9x19_SIG",250],
                        ["RH_sw659",1600],
                        ["RH_14Rnd_9x19_sw",250],
						["RH_tt33",1600],
                        ["RH_8Rnd_762_tt33",250],
						["RH_vp70",1600],
                        ["RH_18Rnd_9x19_VP",250],
//Mittlere Pistolen (45er) Verkauf
						["CUP_hgun_Phantom",2500],
						["CUP_18Rnd_9x19_Phantom",500],
						["hgun_Pistol_heavy_01_F",2500],
                        ["11Rnd_45ACP_Mag",500],
                        ["hgun_ACPC2_F",2500],
                        ["9Rnd_45ACP_Mag",500],
						["RH_fnp45",2500],
                        ["RH_fnp45t",2500],
                        ["RH_15Rnd_45cal_fnp",500],
						["RH_kimber",2500],
                        ["RH_kimber_nw",2500],
                        ["RH_m1911",2500],
                        ["RH_7Rnd_45cal_m1911",500],
						["RH_ttracker",2500],
                        ["RH_ttracker_g",2500],
                        ["RH_6Rnd_45ACP_Mag",500],
						["RH_usp",2500],
                        ["RH_12Rnd_45cal_usp",500],
                        ["RH_uspm",2500],
                        ["RH_16Rnd_40cal_usp",500],
						["hgun_Pistol_heavy_02_F",2500],
                        ["6Rnd_45ACP_Cylinder",500],
//Schwere Pistolen (50er) Verkauf
						["RH_python",4000],
                        ["RH_6Rnd_357_Mag",1000],
                        ["RH_deagle",4000],
                        ["RH_Deagleg",4000],
                        ["RH_Deaglem",4000],
                        ["RH_Deagles",4000],
                        ["RH_7Rnd_50_AE",1000],
						["RH_mp412",4000],
                        ["RH_6Rnd_357_Mag",1000],
						["RH_bull",4000],
                        ["RH_bullb",4000],
                        ["RH_6Rnd_454_Mag",1000],
						["RH_mateba",4000],
                        ["RH_6Rnd_44_Mag",1000],
//Pistolen Attachments Verkauf
						["CUP_acc_CZ_M3X",500],
                        ["optic_MRD",500],
                        ["optic_Yorris",500],
                        ["RH_docter",500],
                        ["RH_M6X",500],
                        ["RH_X2",500],
                        ["RH_X300",500],
                        ["RH_Deflash",500],
						["RH_pmIR",500],
                        ["muzzle_snds_acp",800],
                        ["RH_m9qd",1600],
                        ["RH_gemtech9",800],
                        ["muzzle_snds_L",800],
                        ["RH_demz",800],
                        ["RH_sfn57",800],
                        ["RH_gemtech45",800],
                        ["RH_osprey",800],
                        ["RH_pmsd",800],
                        ["RH_suppr9",800],
                        ["RH_aacusp",800],
                        ["RH_fhusp",800],
                        ["RH_matchsd",800],
//Leichte MPs Verkauf
						["RH_vz61",8000],
						["RH_20Rnd_32cal_vz61",1400],
						["RH_muzi",8000],
						["RH_30Rnd_9x19_UZI",1400],
						["RH_tec9",8000],
						["RH_32Rnd_9x19_tec",1400],
//Mittlere MPs Verkauf
						["hlc_smg_mp5k_PDW",9500],
						["hlc_30Rnd_9x19_GD_MP5",1900],
						["hgun_PDW2000_F",9500],
						["SMG_02_F",9500],
						["30Rnd_9x21_Mag",1900],
						["hlc_smg_mp5a2",7500],
						["hlc_smg_mp5a3",9500],
						["hlc_smg_mp5a4",9500],
						["hlc_smg_MP5N",9500],
						["hlc_30Rnd_9x19_B_MP5",1900],
//Schwere MPs Verkauf
						["SMG_01_F",12000],
						["30Rnd_45ACP_Mag_SMG_01",2500],
						["hlc_smg_mp510",12000],
						["hlc_30Rnd_10mm_B_MP5",2500],
						["hlc_30Rnd_10mm_JHP_MP5",2500],
						["hlc_smg_mp5sd5",12000],
						["hlc_smg_mp5sd6",12000],
						["hlc_30Rnd_9x19_SD_MP5",2500],
						["hlc_rifle_hk53",12000],
						["hlc_30rnd_556x45_b_HK33",2500],
//MP Attachments Verkauf
						["muzzle_snds_L",2500],
						["muzzle_snds_acp",2500],
						["RH_tecsd",950],
						["hlc_muzzle_Agendasix10mm",950],
						["hlc_muzzle_Agendasix",950],
						["hlc_muzzle_Tundra",950],
						["RH_muzisd",950],
//Sturm Leicht Verkauf
						["rhs_weap_ak74m_2mag",17000],
						["rhs_weap_ak74m_2mag_camo",17000],
						["rhs_weap_ak74m",17000],
						["rhs_weap_ak74m_folded",17000],
						["rhs_weap_ak74m_camo",17000],
						["rhs_weap_ak74m_desert",17000],
						["rhs_acc_pso1m2",2500],
						["rhs_acc_1p29",2500],
						["rhs_acc_pkas",1700],
						["rhs_30Rnd_545x39_AK",3200],
						["rhs_30Rnd_545x39_AK_green",3200],
						["hlc_rifle_ak12",17000],
						["hlc_rifle_ak74",17000],
						["hlc_rifle_ak74_dirty",17000],
						["hlc_rifle_aks74",17000],
						["hlc_rifle_aks74u",17000],
						["hlc_rifle_aek971",17000],
						["hlc_rifle_aku12",17000],
						["hlc_30Rnd_545x39_S_AK",3200],
						["hlc_30Rnd_545x39_B_AK",3200],
						["hlc_30Rnd_545x39_EP_ak",3200],
						["hlc_30Rnd_545x39_t_ak",3200],
						["arifle_Mk20_plain_F",17000],
						["arifle_Mk20_F",17000],
						["hlc_rifle_M4",17000],
						["hlc_rifle_CQBR",17000],
						["arifle_Mk20C_plain_F",17000],
						["arifle_Mk20C_F",17000],
						["arifle_TRG20_F",17000],
						["arifle_TRG21_F",17000],
						["arifle_SDAR_F",17000],
						["20Rnd_556x45_UW_mag",3200],
//Sturm Mittel Verkauf
						["rhs_weap_m16a4",21000],
						["rhs_weap_m16a4_carryhandle",21000],
						["rhs_weap_m16a4_grip",21000],
						["rhs_weap_m4",21000],
						["rhs_weap_m4_carryhandle",21000],
						["rhs_weap_m4_carryhandle_pmag",21000],
						["rhs_weap_m4_bipod",21000],
						["rhs_weap_m4_grip",21000],
						["rhs_weap_m4a1",21000],
						["rhs_weap_m4a1_grip",21000],
						["hlc_rifle_RU5562",21000],
						["hlc_rifle_RU556",21000],
						["hlc_rifle_bcmjack",21000],
						["hlc_rifle_Colt727",21000],
						["RH_M16A2",21000],
						["RH_M16A3",21000],
						["RH_M16A4",21000],
						["RH_M16A4_m",21000],
						["RH_m4",21000],
						["RH_M4_ris",21000],
						["RH_M4A1_ris",21000],
						["RH_M4sbr_b",21000],
						["RH_M4sbr_g",21000],
						["RH_M4sbr",21000],
						["CUP_arifle_CZ805_A1",21000],
						["CUP_arifle_CZ805_A2",21000],
						["CUP_arifle_G36A",21000],
						["CUP_arifle_G36A_camo",21000],
						["CUP_arifle_G36C",21000],
						["CUP_arifle_G36C_camo",21000],
						["CUP_arifle_G36K",21000],
						["CUP_arifle_G36K_camo",21000],
						["CUP_arifle_L85A2",21000],
						["CUP_arifle_L86A2",21000],
						["CUP_arifle_Mk16_CQC",21000],
						["CUP_arifle_Mk16_CQC_FG",21000],
						["CUP_arifle_Mk16_CQC_SFG",21000],
						["CUP_arifle_Mk16_CQC_EGLM",21000],
						["CUP_arifle_Mk16_STD",21000],
						["CUP_arifle_Mk16_STD_FG",21000],
						["CUP_arifle_Mk16_SV",21000],	
						["CUP_20Rnd_556x45_Stanag",2500],
						["30Rnd_556x45_Stanag",3200],
						["30Rnd_556x45_Stanag_Tracer_Red",3200],
						["30Rnd_556x45_Stanag_Tracer_Green",3200],
						["arifle_Katiba_F",21000],
						["arifle_Katiba_C_F",21000],
						["30Rnd_65x39_caseless_green",4000],
						["30Rnd_65x39_caseless_green_mag_Tracer",4000],
						["arifle_MX_F",21000],
						["arifle_MX_blk_F",21000],
						["arifle_MX_Black_F",21000],
						["arifle_MXC_F",21000],
						["arifle_MXC_Black_F",21000],
						["arifle_MXM_F",21000],
						["arifle_MXM_Black_F",21000],
						["30Rnd_65x39_caseless_mag",4000],
						["30Rnd_65x39_caseless_mag_Tracer",4000],
//Sturm Schwer Verkauf
						["CUP_arifle_CZ805_B",24000],
						["CUP_20Rnd_762x51_CZ805B",4800],
						["CUP_20Rnd_TE1_White_Tracer_762x51_CZ805B",4800],
						["CUP_arifle_Mk17_CQC",24000],
						["CUP_arifle_Mk17_CQC_FG",24000],
						["CUP_arifle_Mk17_STD",24000],
						["CUP_arifle_Mk17_STD_FG",24000],
						["CUP_arifle_Mk20",24000],
						["CUP_muzzle_mfsup_SCAR_H",4000],
						["CUP_muzzle_snds_SCAR_H",4000],
						["CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR",4800],
						["CUP_20Rnd_762x51_B_SCAR",4800],
						["hlc_rifle_honeybadger",24000],
						["muzzle_HBADGER",4000],
						["hlc_rifle_vendimus",4800],
						["hlc_rifle_Bushmaster300",4800],
						["29rnd_300BLK_STANAG",4800],
						["29rnd_300BLK_STANAG_T",4800],
						["29rnd_300BLK_STANAG_S",4800],
						["RH_ar10",24000],
						["RH_Delft",2500],
						["RH_20Rnd_762x51_AR10",4800],
						["hlc_rifle_falosw",24000],
						["hlc_rifle_L1A1SLR",24000],
						["hlc_rifle_STG58F",24000],
						["hlc_rifle_c1A1",24000],
						["hlc_rifle_FAL5061",24000],
						["hlc_rifle_SLR",24000],
						["hlc_rifle_SLRchopmod",24000],
						["hlc_rifle_LAR",24000],
						["hlc_20rnd_762x51_b_fal",4800],
						["hlc_20Rnd_762x51_T_fal",4800],
						["hlc_20rnd_762x51_s_fal",4800],
						["hlc_rifle_hk51",24000],
						["hlc_rifle_g3sg1",24000],
						["hlc_rifle_g3a3",24000],
						["hlc_rifle_g3ka4",24000],
						["hlc_20rnd_762x51_b_G3",4800],
						["hlc_20rnd_762x51_T_G3",4800],
						["hlc_20rnd_762x51_S_G3",4800],
						["hlc_rifle_ak47",24000],
						["hlc_rifle_akm",24000],
						["hlc_30Rnd_762x39_b_ak",4800],
						["hlc_30Rnd_762x39_t_ak",4800],
						["hlc_30rnd_762x39_s_ak",4800],
						["srifle_EBR_F",24000],
						["20Rnd_762x51_Mag",4800],
						["srifle_DMR_01_F",24000],
						["10Rnd_762x51_Mag",4800],
						["hlc_rifle_M14",24000],
						["hlc_rifle_m14sopmod",24000],
						["hlc_20Rnd_762x51_B_M14",4800],
						["hlc_20Rnd_762x51_T_M14",4800],
						["hlc_20Rnd_762x51_S_M14",4800],
//Sniper Leicht Verkauf
						["hlc_rifle_SAMR",21000],
						["hlc_rifle_samr2",21000],
						["hlc_30rnd_556x45_S",4000],
						["hlc_30rnd_556x45_SPR",4000],
						["hlc_30rnd_556x45_SOST",4000],
						["hlc_30rnd_556x45_EPR",4000],
						["RH_Mk12mod1",21000],
						["RH_SAMR",21000],						
						["CUP_srifle_LeeEnfield",21000],
						["CUP_10x_303_M",4000],
//Sniper Mittel Verkauf
						["CUP_srifle_CZ750",24000],
						["CUP_10Rnd_762x51_CZ750_Tracer",4800],
						["CUP_srifle_LeeEnfield",24000],
						["CUP_10x_303_M",4800],
						["CUP_srifle_VSSVintorez",24000],
						["CUP_10Rnd_9x39_SP5_VSS_M",4800],
						["CUP_optic_PSO_1",2500],
						["CUP_optic_PSO_3",2500],
						["hlc_rifle_psg1",24000],
						["hlc_rifle_m14dmr",24000],
						["hlc_rifle_M21",24000],
						["hlc_20Rnd_762x51_B_M14",4800],
						["hlc_20Rnd_762x51_T_M14",4800],
						["hlc_20Rnd_762x51_S_M14",4800],
						["rhs_weap_m14ebrri",24000],
						["rhs_weap_svdp",24000],
						["rhs_weap_svdp_wd",24000],
						["rhs_weap_svds",24000],
						["rhs_10Rnd_762x54mmR_7N1",4800],
//Sniper Schwer Verkauf
						["CUP_srifle_AWM_des",32000],
						["CUP_srifle_AWM_wdl",32000],
						["CUP_5Rnd_86x70_L115A1",7300],
						["CUP_srifle_CZ550",32000],
						["CUP_5x_22_LR_17_HMR_M",7300],
						["CUP_srifle_M110",32000],
						["CUP_20Rnd_762x51_B_M110",7300],
						["CUP_20Rnd_TE1_White_Tracer_762x51_M110",7300],
						["CUP_muzzle_snds_M110",2500],
						["CUP_srifle_M24_ghillie",32000],
						["CUP_srifle_M24_des",32000],
						["CUP_srifle_M24_wdl",32000],
						["CUP_srifle_M40A3",32000],
						["CUP_5Rnd_762x51_M24",7300],
						["rhs_weap_XM2010",32000],
						["rhs_weap_XM2010_wd",32000],
						["rhs_weap_XM2010_d",32000],
						["rhs_weap_XM2010_sa",32000],
						["rhsusf_5Rnd_300winmag_xm2010",7300],
						["rhsusf_acc_LEUPOLDMK4_2",2500],
						["srifle_GM6_F",32000],
						["srifle_GM6_camo_F",32000],
						["5Rnd_127x108_Mag",7300],
						["srifle_LRR_F",32000],
						["srifle_LRR_camo_F",32000],
						["7Rnd_408_Mag",7300],
//Maschinengewehre Leicht Verkauf
						["rhs_weap_m249_pip",24000],
						["rhsusf_100Rnd_556x45_soft_pouch",4800],
						["hlc_rifle_RPK12",24000],
						["hlc_45Rnd_545x39_t_rpk",4800],							
						["CUP_arifle_MG36",24000],
						["CUP_arifle_MG36_camo",24000],
						["CUP_100Rnd_556x45_BetaCMag",4800],
						["CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag",4800],
//Maschinengewehre Mittel Verkauf
						["LMG_Mk200_F",32000],
						["200Rnd_65x39_cased_Box",8000],
						["200Rnd_65x39_cased_Box_Tracer",8000],
						["arifle_MX_SW_F",32000],
						["arifle_MX_SW_Black_F",32000],
						["100Rnd_65x39_caseless_mag",8000],
						["100Rnd_65x39_caseless_mag_Tracer",8000],
//Maschinengewehre Schwer Verkauf
						["hlc_rifle_rpk",47000],
						["hlc_75Rnd_762x39_m_rpk",12000],
						["hlc_45Rnd_762x39_m_rpk",12000],
						["hlc_45Rnd_762x39_t_rpk",12000],
						["hlc_lmg_m60",47000],
						["hlc_lmg_M60E4",47000],
						["hlc_100Rnd_762x51_B_M60E4",12000],
						["hlc_100Rnd_762x51_M_M60E4",12000],
						["hlc_100Rnd_762x51_T_M60E4",12000],
						["LMG_Zafir_F",47000],
						["150Rnd_762x51_Box",12000],
                        ["150Rnd_762x51_Box_Tracer",12000],
//Raketenwerfer Verkauf
						["rhs_weap_rpg7",32000],
						["rhs_acc_pgo7v",4800],
						["rhs_rpg7_OG7V_mag",106000],
						["rhs_rpg7_PG7VL_mag",106000],
						["rhs_weap_M136",30000],
						["rhs_m136_mag",88000],
						["rhs_weap_rshg2",30000],
						["rhs_rshg2_mag",88000],
//Schrotflinte Verkauf
						["hlc_rifle_saiga12k",7300],
						["hlc_10rnd_12g_slug_S12",2500],
						["hlc_10rnd_12g_buck_S12",2500],
						["CUP_sgun_M1014",7300],
						["CUP_8Rnd_B_Beneli_74Slug",2500],
//Sonstiges Verkauf
						["D41_TTrackerGummi",1750],
						["Gummigeschiss_Mag",500],
						["rhs_mag_rdg2_white",400],
						["rhs_mag_rdg2_black",400],
						["CUP_1Rnd_SmokeGreen_M203",1750],
						["SmokeShellGreen",500],						
						["rhs_weap_M320",14500],
						["3Rnd_SmokeGreen_Grenade_shell",2500],
						["3Rnd_UGL_FlareWhite_F",2500],
						["3Rnd_UGL_FlareCIR_F",2500],
						["DemoCharge_Remote_Mag",24000],
						["SatchelCharge_Remote_Mag",74000],
//Schalldämpfer Verkauf
						["hlc_muzzle_545SUP_AK",4000],
						["muzzle_snds_B",1900],
						["muzzle_snds_H",1900],
						["RH_qdss_nt4",1900],
						["RH_saker",1900],
						["muzzle_snds_M",1900],
						["hlc_muzzle_snds_M14",1900],
						["hlc_muzzle_snds_fal",1900],
						["RH_spr_mbs",1900],
						["hlc_muzzle_556NATO_KAC",1900],
						["hlc_muzzle_762SUP_AK",1900],
						["hlc_muzzle_snds_HK33",1900],
						["hlc_muzzle_snds_g3",1900],
						["hlc_muzzle_300blk_KAC",1900],
						["rhs_acc_tgpa",1900],
						["CUP_muzzle_snds_G36_black",1900],
						["CUP_muzzle_snds_G36_desert",1900],
						["CUP_muzzle_mfsup_SCAR_L",1900],
						["CUP_muzzle_snds_SCAR_L",1900],
						
//LL-M Rails Verkauf
						["acc_pointer_IR",250],
						["acc_flashlight",250],
						["RH_m16covers_f",250],
						["RH_m16covers_s",250],
						["RH_peq15",250],
						["RH_peq15_top",250],
						["rhsusf_acc_anpeq15",500],
						["RH_peq2",250],
						["RH_peq2_top",250],
						["RH_SFM952V",250],
						["RH_SFM952V_tan",250],
						["RH_m4covers_f",250],
						["RH_m4covers_s",250],
						["FHQ_acc_LLM01L",250],
//CQB Scopes Verkauf
						["CUP_optic_CompM2_Woodland",1000],
						["CUP_optic_CompM2_Black",1000],
						["rhs_acc_1p63",1000],
						["rhs_acc_ekp1b",1000],
						["hlc_optic_kobra",1000],
						["optic_ACO_grn",1000],
						["optic_Aco",1000],
						["optic_Holosight",1000],
						["optic_ACO_grn_smg",1000],
						["optic_Aco_smg",1000],
						["optic_Holosight_smg",1000],
						["RH_compm4s",1000],
						["RH_t1",1000],
						["RH_eotech553",1000],
						["RH_shortdot",1000],
						["RH_reflex",1000],
						["FHQ_optic_AC12136",1000],
						["FHQ_optic_AC11704_tan",1000],
						["FHQ_optic_AC11704",1000],
						["FHQ_optic_AIM",1000],
						["FHQ_optic_AIM_tan",1000],
						["RH_t1",1000],
						["RH_eotech553",1000],
						["RH_reflex",1000],
						["rhs_acc_pkas",1000],
						["FHQ_optic_MARS",1000],
						["FHQ_optic_MARS_tan",1000],
						["FHQ_optic_MicroCCO",1000],
						["FHQ_optic_MicroCCO_tan",1000],
						["FHQ_optic_MicroCCO_low",1000],
						["FHQ_optic_MicroCCO_low_tan",1000],
						["FHQ_optic_HWS",1000],
						["FHQ_optic_HWS_tan",1000],
						["CUP_optic_Eotech533",1000],
						["CUP_optic_CompM2_Desert",1000],
						["CUP_optic_CompM2_Woodland2",1000],
//Mid Range Scopes Verkauf
						["rhsusf_acc_ACOG",1600],
						["rhsusf_acc_ACOG3",1600],
						["FHQ_optic_ACOG_tan",1600],
						["FHQ_optic_ACOG",1600],
						["FHQ_optic_HWS_G33",1600],
						["CUP_optic_ELCAN_SpecterDR",1600],
						["FHQ_optic_HWS_G33_tan",1600],
						["HLC_Optic_1p29",1600],
						["RH_ta31rco",1600],
						["RH_ta31rco_2D",1600],
						["optic_Hamr",1600],
						["optic_MRCO",1600],
						["CUP_optic_SUSAT",1600],
						["optic_Arco",1600],
						["RH_m3lr",1600],
						["hlc_optic_PVS4M14",1600],
						["hlc_optic_artel_m14",1600],
						["hlc_optic_PVS4FAL",1600],
						["hlc_optic_suit",1600],
						["hlc_optic_accupoint_g3",1600],
						["hlc_optic_PVS4G3",1600],
						["HLC_Optic_ZFSG1",1600],
						["rhsusf_acc_compm4",1600],
						["rhsusf_acc_HAMR",1600],
						["rhs_acc_1p29",1600],
						["RH_m3lr",1600],
						["CUP_optic_RCO_desert",1600],
						["CUP_optic_RCO",1600],
						["CUP_optic_ACOG",1600],		
//Long Range Scopes Verkauf
						["HLC_Optic_PSO1",2500],
						["CUP_optic_SB_11_4x20_PM",2500],
						["CUP_optic_SB_3_12x50_PMII",2500],
						["optic_LRPS",2500],
						["optic_DMS",2500],
						["optic_SOS",2500],
						["optic_NVS",2500],	
						["RH_m3lr",2500],
						["CUP_optic_LeupoldMk4_10x40_LRT_Desert",2500],
						["CUP_optic_LeupoldMk4_10x40_LRT_Woodland",2500],
						["CUP_optic_LeupoldM3LR",2500],
						["CUP_optic_LeupoldMk4",2500],
						["CUP_optic_LeupoldMk4_MRT_tan",2500],
						["CUP_optic_Leupold_VX3",2500],
						["CUP_optic_AN_PVS_10",2500],
						["hlc_optic_LRT_m14",2500],
						["rhs_acc_pso1m2",2500],
						["rhsusf_acc_LEUPOLDMK4",2500],
						["rhsusf_acc_LEUPOLDMK4_2",2500],
						["FHQ_optic_LeupoldERT_tan",2500],
						["FHQ_optic_LeupoldERT",2500]
	
];};


life_garage_prices =
[
	//Gebrauchtwagen
	["D41_Lada_Civ_01",100], // VAZ-2103 Russian Weiss
	["D41_Lada_Civ_04",150], // VAZ-2103 Decorated
	["D41_Lada_Civ_03",100], // VAZ-2103 Grün
	["D41_Lada_Civ_02",100], // VAZ-2103 Rot
	["D41_S1203_Civ_01",150], //Skoda 1203 Hellblau
	["D41_S1203_Civ_Gruen",150], // Skoda 1203 Grün
	["D41_S1203_Civ_Orange",150], // Skoda 1203 Orange
	["D41_S1203_Civ_Rot",150], // Skoda 1203 Rot
	["D41_S1203_Civ_Silber",150], // Skoda 1203 Silber
	["D41_S1203_Civ_Weiss",150], // Skoda 1203 Weiss
	["D41_Gaz24_Civ_01",200], //GAZ-24 Blau
	["D41_Gaz24_Civ_02",200], //GAZ-24 Grau
	["D41_Gaz24_Civ_03",200], //GAZ-24 Schwarz
	["D41_Golf4_Civ_Weiss", 300], // Golf IV 1.9 TDI Weiss
	["D41_Golf4_Civ_Gelb",300], // Golf IV 1.9 TDI Gelb
	["D41_Golf4_Civ_Gruen",300], // Golf IV 1.9 TDI Grün
	["C_Van_01_transport_F",800], //Boxer 4x4 offen
	["D41_uaz_open_MSV_01",700], //UAZ offen
	["D41_UAZ_MSV_01",800], //UAZ
	//Neuwagen
	["D41_Golf4_Civ_Blau",350], // Golf IV 1.9 TDI Blau
	["D41_Golf4_Civ_schwarz",350], // Golf IV 1.9 TDI Schwarz
	["D41_Octavia_Civ_Weiss",1000], // Skoda Octaivia Weiss
	["D41_Octavia_Civ_Gelb",1000], // Skoda Octaivia Gelb
	["D41_Octavia_Civ_Blau",1000], // Skoda Octaivia Blau
	["D41_Octavia_Civ_Schwarz",1000], // Skoda Octaivia Schwarz
	["D41_Octavia_Civ_01",1500], // Skoda Octaivia II 2.0 TDI
	["C_Hatchback_01_F",1250], //Honda_Civic
	["C_Hatchback_01_sport_F",1500], //Honda_Civic_TypeR
	["C_Hatchback_01_rallye_F",1500], //Honda_Civic_TypeR_Rally
	["C_Offroad_01_F",1500], //Isuzu_Offroad
	["C_Offroad_Rally_F",1500], //Isuzu_Offroad Rally
	["C_Offroad_01_repair_F",1500], //Isuzu_Offroad_Repair
	["D41_BAF_Offroad_D",1500], //UK Offroad Desert
	["C_SUV_01_F",2000], //BMW_X6
	["C_SUV_01_sport_F",2500], //BMW_X6M
	["D41_BMW_X6M_Flames",2500], //BMW_X6M
	["D41_rhsusf_m1025_d",4500], //HMMWV Hero
	["D41_rhsusf_m998_d_4dr_fulltop",2500], //HMMWV Hero Offen
	//Trucks
	["C_Van_01_box_F",900], //Boxer 4x4 geschlossen
	["D41_gaz66_repair_msv",900], //GAZ 66
	["D41_gaz66_ap2_msv",900], //GAZ 66
	["D41_gaz66_r142_msv",900], //GAZ 66
	["D41_gaz66o_msv",900], //GAZ 66
	["D41_gaz66_msv",900], //GAZ 66
	["B_Truck_01_mover_F",1500], // HEMTT ohne alles
	["D41_Ikarus_Civ_02",2000], // Ikarus 260.03 BUS Verrostet
	["D41_Ikarus_Civ_01",2000], // Ikarus 260.03 BUS
	["Civ_Truck_02_transport_F",3000], // Kamaz Transport offen
	["Civ_Truck_02_transport_plane_F",3000], // Kamaz Transport covered
	["B_Truck_01_transport_F",4000], // HEMTT Transport offen
	["B_Truck_01_covered_F",4000], // HEMTT Transport covered
	["O_Truck_03_transport_F",5000], // Tempest Transport offen
	["O_Truck_03_ammo_F",5000], // Tempest Transport Ammoboxen
	["D41_typhoon_vdv",6000], // Tempest RHS
	//Fueltrucks
	["C_Van_01_fuel_F",800], // 4x4 Fuel
	["Civ_Truck_02_fuel2_F",3000], //Kamaz Fuel
	["B_Truck_01_fuel_F",4000], //HEMTT Fuel
	["O_Truck_03_fuel_F",5000], //Tempest Fuel
	//Rebellen
	["D41_Reb_Offroad_01_F",1500], //Isuzu_Offroad_Rebellen
	["D41_Offroad_Snake",1500], //Isuzu_Offroad_Rebellen SNAKE
	["D41_Offroad_Snake_TFuel_TPS",5000], //Isuzu Offroad Rebellen SNAKE Tuned Tank und PS
	["B_G_Offroad_01_repair_F",1500], //Isuzu_Offroad_Rebellen_Repair
	["D41_BAF_Offroad_W",1500], //UK Offroad Wood
	["I_G_Van_01_transport_F",1800], //Boxer Tarnfarben
	["D41_rhsusf_m1025_w",4500], //HMMWV Bandit
	["D41_rhsusf_m998_w_4dr_fulltop",2500], //HMMWV Bandit
	["B_G_Offroad_01_armed_F",4500], //Isuzu_Offroad_50Cal
	["D41_B_M1114_Armored",5000], // Rebellen HMMVE 7,62
	["civ_md500_urban",4500], //Littlebird Rebellen
	["I_MRAP_03_F",4500], //Fennek Strider
	["O_MRAP_02_F",4500], //Ifrit
	["D41_Hatchback_Snake",1250], //HAtchback_Rebellen SNAKE blau
	//Cops
	["D41_Lada_Civ_05",200], //Police Lada
	["Offroad_Pol",250], //Police Offroad
	["BMW_X6M_Pol",350], //Police BMW
	["Offroad_SWAT",250], //Police Offroad SWAT
	["D41_tigr_msv",4000], //TIGR
	["D41_B_m1151_m2_deployment_Jtac",4500], //HMMWVE Desert M2 SWAT
	["D41_B_m1151_m2_deployment_Bumper",4500], //HMMWVE Desert M2 SWAT Frag
	["D41_B_m1151_m240_deployment",4000], //HMMWVE SWAT 7,62
	["D41_B_M998A2_sov_M2",4000], //HMMWV Desert Offen M2+MG
	["O_Truck_03_covered_F",4000], //Tempest Covered
	["D41_police_helicopter",2750], //Police Littlebird
	["I_Heli_light_03_unarmed_F",3500], //Police Hellcat
	["D41_RHS_UH60M",4500], //Police UH60
	["B_Boat_Transport_01_F",450], //Police Schlauchboot
	["C_Boat_Civil_01_police_F",500], //Police Speedboot
	["B_Boat_Armed_01_minigun_F",650], //Police Minigunboot
	["B_SDV_01_F",2500], //Police Uboot
	//Medic
	["D41_Offroad_Medic",250], //Medic Offroad
	["D41_B_HMMWV_Medevac",250], //Medic HMMVE Desert
	["D41_B_M997A2_Ambulance",250], // Medic HMMVE Wood
	//Hubschrauber u Flugzeuge
	["civ_md500_blueline",4500], //Littlebirds
	["civ_md500_shadow",4500], //Littlebirds
	["civ_md500_whitered",4500], //Littlebirds
	["civ_md500_greywatcher",4500], //Littlebirds
	["civ_md500_speedy",4500], //Littlebirds
	["civ_md500_sunset",4500], //Littlebirds
	["civ_md500_wasp",4500], //Littlebirds
	["civ_md500_wave",4500], //Littlebirds
	["D41_medic_helicopter",500], //Medic Littlebirds
	["O_Heli_Light_02_unarmed_F",6500], //Orca schwarz
	["civ_ka60_whiteblue",6000], //Orca weißblau
	["D41_ka60_medic",1000], //Medic Orca
	["civ_mohawk_ion",8000], //Mohawk Ion
	["civ_mohawk_dahoman",8000], //Mohawk Dahoman
	["D41_GNT_C185",3000], //Czessna
	["bwi_a3_t6a_8",4000], //Texan Shark
	["bwi_a3_t6a_1",4000], //Texan Tiger
	["bwi_a3_t6a_3",4000], //Texan Greek
	["bwi_a3_t6a_7",4000],  //Texan Beachcraft
	["D41_RHS_UH60M_MEV",5000], //UH60 Medic
	["D41_Heli_Transport_04_bench_F",4500], //Taru Personentransport offen
	["D41_Heli_Transport_04_F",5000], //Taru ohne Module
	["D41_Heli_Transport_04_covered_F",6500], //Taru Personenmodul
	["D41_Heli_Transport_04_Fuel_F",6500], //Taru Benzinmodul
	["D41_Heli_Transport_03_unarmed_F",10000], //Huron Black
	//Boote
	["C_Rubberboat",40], //Gummiboot
	["I_Boat_Transport_01_F",300], //Gummiboot Tarn
	["C_Boat_Civil_01_F",450], //Speedboot
	["D41_SDV_01_F",2500], //U-Brot
	["D41_Trawler",5000] //Trawler 
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	//Gebrauchtwagen
	["D41_Lada_Civ_01",500], // VAZ-2103 Russian Weiss
	["D41_Lada_Civ_04",550], // VAZ-2103 Decorated
	["D41_Lada_Civ_03",500], // VAZ-2103 Gr�n
	["D41_Lada_Civ_02",500], // VAZ-2103 Rot
	["D41_S1203_Civ_01",1200], //Skoda 1203 Hellblau
	["D41_S1203_Civ_Gruen",1200], // Skoda 1203 Gr�n
	["D41_S1203_Civ_Orange",1200], // Skoda 1203 Orange
	["D41_S1203_Civ_Rot",1200], // Skoda 1203 Rot
	["D41_S1203_Civ_Silber",1200], // Skoda 1203 Silber
	["D41_S1203_Civ_Weiss",1200], // Skoda 1203 Weiss
	["D41_Gaz24_Civ_01",1800], //GAZ-24 Blau
	["D41_Gaz24_Civ_02",1800], //GAZ-24 Grau
	["D41_Gaz24_Civ_03",2000], //GAZ-24 Schwarz
	["D41_Golf4_Civ_Weiss",2500], // Golf IV 1.9 TDI Weiss
	["D41_Golf4_Civ_Gelb",2500], // Golf IV 1.9 TDI Gelb
	["D41_Golf4_Civ_Gruen",2500], // Golf IV 1.9 TDI Gr�n
	["C_Van_01_transport_F",9000], //Boxer 4x4 offen
	["D41_uaz_open_MSV_01",2000], //UAZ offen
	["D41_UAZ_MSV_01",2500], //UAZ
	//Neuwagen
	["D41_Golf4_Civ_Blau",3250], // Golf IV 1.9 TDI Blau
	["D41_Golf4_Civ_schwarz",3250], // Golf IV 1.9 TDI Schwarz
	["D41_Octavia_Civ_Weiss",5000], // Skoda Octaivia Weiss
	["D41_Octavia_Civ_Gelb",5000], // Skoda Octaivia Gelb
	["D41_Octavia_Civ_Blau",5000], // Skoda Octaivia Blau
	["D41_Octavia_Civ_Schwarz",5600], // Skoda Octaivia Schwarz
	["D41_Octavia_Civ_01",5700], // Skoda Octaivia II 2.0 TDI
	["C_Hatchback_01_F",5000], //Honda_Civic
	["C_Hatchback_01_sport_F",13000], //Honda_Civic_TypeR
	["C_Hatchback_01_rallye_F",8500], //Honda_Civic_TypeR_Rally
	["C_Offroad_01_F", 6000], //Isuzu_Offroad
	["C_Offroad_Rally_F", 7000], //Isuzu_Offroad Rally
	["C_Offroad_01_Repair_F",6000], //Isuzu_Offroad_Repair
	["D41_BAF_Offroad_D",9500], //UK Offroad Desert
	["C_SUV_01_F",13000], //BMW_X6
	["C_SUV_01_sport_F",17500], //BMW_X6M
	["D41_BMW_X6M_Flames",17500], //BMW_X6M
	["D41_rhsusf_m1025_d",50000], //HMMWVE HeroT
	["D41_rhsusf_m998_d_4dr_fulltop",25000], //HMMWVE Hero Offen
	//Trucks
	["C_Van_01_box_F",12000], //Boxer 4x4 geschlossen
	["D41_gaz66_repair_msv",16000], //GAZ 66
	["D41_gaz66_ap2_msv",16000], //GAZ 66
	["D41_gaz66_r142_msv",21000], //GAZ 66
	["D41_gaz66o_msv",16000], //GAZ 66
	["D41_gaz66_msv",16000], //GAZ 66
	["B_Truck_01_mover_F",29000], // HEMTT ohne alles
	["D41_Ikarus_Civ_02",12000], // Ikarus 260.03 BUS Verrostet
	["D41_Ikarus_Civ_01",13000], // Ikarus 260.03 BUS
	["Civ_Truck_02_transport_F",29000], // Kamaz Transport offen
	["Civ_Truck_02_transport_plane_F",38000], // Kamaz Transport covered
	["D41_Ural_Open_MSV_01",28250], // Ural offen
	["D41_Ural_MSV_01",37500], // Ural Plane
	["B_Truck_01_transport_F",105000], // HEMTT Transport offen
	["B_Truck_01_covered_F",170000], // HEMTT Transport covered
	["O_Truck_03_transport_F",67500], // Tempest Transport offen
	["O_Truck_03_ammo_F",82500], // Tempest Transport Ammoboxen
	["D41_typhoon_vdv",110000], // Tempest RHS
	//Fueltrucks
	["C_Van_01_fuel_F",800], //4x4 Fuel
	["Civ_Truck_02_fuel2_F",35000], //Kamaz Fuel
	["D41_Ural_Fuel_MSV_01",38000], // Ural Fuel
	["B_Truck_01_fuel_F",75000], //HEMTT Fuel
	["O_Truck_03_fuel_F",137500], //Tempest Fuel
	//Rebellen
	["D41_Reb_Offroad_01_F",3000], //Isuzu_Offroad_Rebellen
	["D41_Offroad_Snake",6000], //Isuzu Offroad Rebellen SNAKE Tuned Tank und PS
	["D41_Offroad_Snake_TFuel_TPS",3000], //Isuzu_Offroad_Rebellen SNAKE
	["B_G_Offroad_01_repair_F",6000], //Isuzu_Offroad_Rebellen_Repair
	["D41_Hatchback_Snake",5000], //HAtchback_Rebellen SNAKE blau
	["D41_BAF_Offroad_W",9500], //UK Offroad Wood
	["I_G_Van_01_transport_F",17000], //Boxer Tarnfarben
	["D41_rhsusf_m1025_w",100000], //HMMWV Bandit
	["D41_rhsusf_m998_w_4dr_fulltop",50000], //HMMWV Bandit Offen
	["B_G_Offroad_01_armed_F",150000], //Isuzu_Offroad_50Cal
	["D41_B_M1114_Armored",180000], //HMMVWE 7,62 Rebell
	["civ_md500_urban",66000], //Littlebird Rebellen
	["I_MRAP_03_F",190000], //Fennek Strider
	["O_MRAP_02_F",190000], //Ifrit
	//Cops
	["D41_Lada_Civ_05",5000], //Police Lada
	["Offroad_Pol",15000], //Police Offroad
	["BMW_X6M_Pol",35000], //Police BMW
	["Offroad_SWAT",25000], //Police Offroad SWAT
	["D41_B_m1151_m240_deployment",26000], //HMMWV Desert SWAT 7,62
	["D41_tigr_msv",120000], //TIGR
	["D41_B_m1151_m2_deployment_Jtac",180000], //HMMWV Desert M2 SWAT
	["D41_B_m1151_m2_deployment_Bumper",180000], //HMMWV Desert M2 SWAT FRAG
	["D41_B_M998A2_sov_M2",180000], //HMMWV Desert Offen M2+MG
	["O_Truck_03_covered_F",130000], //Tempest Covered
	["D41_police_helicopter",150000], //Police Littlebird
	["I_Heli_light_03_unarmed_F",165000], //Police Hellcat
	["D41_RHS_UH60M",250000], //Police UH60
	["B_Boat_Transport_01_F",450], //Police Schlauchboot
	["C_Boat_Civil_01_police_F",500], //Police Speedboot
	["B_Boat_Armed_01_minigun_F",650], //Police Minigunboot
	["B_SDV_01_F",2500], //Police Uboot
	//Hubschrauber u Flugzeuge
	["civ_md500_blueline",86000], //Littlebirds
	["civ_md500_shadow",86000], //Littlebirds
	["civ_md500_whitered",86000], //Littlebirds
	["civ_md500_greywatcher",86000], //Littlebirds
	["civ_md500_speedy",86000], //Littlebirds
	["civ_md500_sunset",86000], //Littlebirds
	["civ_md500_wasp",86000], //Littlebirds
	["civ_md500_wave",86000], //Littlebirds
	["O_Heli_Light_02_unarmed_F",150000], //Orca schwarz
	["civ_ka60_whiteblue",150000], //Orca weißblau
	["civ_mohawk_ion",165000], //Mohawk Ion
	["civ_mohawk_dahoman",165000], //Mohawk Dahoman
	["D41_GNT_C185",120000], //Czessna
	["bwi_a3_t6a_8",137000], //Texan Shark
	["bwi_a3_t6a_1",137000], //Texan Tiger
	["bwi_a3_t6a_3",137000], //Texan Greek
	["bwi_a3_t6a_7",137000],  //Texan Beachcraft
	["D41_Heli_Transport_04_bench_F",110000], //Taru Personentransport offen
	["D41_Heli_Transport_04_F",110000], //Taru ohne Module
	["D41_Heli_Transport_04_covered_F",150000], //Taru Personenmodul
	["D41_Heli_Transport_04_Fuel_F",150000], //Taru Benzinmodul
	["D41_Heli_Transport_03_unarmed_F",180000], //Huron Black
	//Boote
	["C_Rubberboat",40], //Gummiboot
	["I_Boat_Transport_01_F",300], //Gummiboot Tarn
	["C_Boat_Civil_01_F",450], //Speedboot
	["D41_SDV_01_F",2500], //U-Brot
	["D41_Trawler",165000] //Trawler 
];
__CONST__(life_garage_sell,life_garage_sell);