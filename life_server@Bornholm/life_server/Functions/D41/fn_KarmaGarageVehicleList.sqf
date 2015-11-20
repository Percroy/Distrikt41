//::::::::::::  ::::::::::::\\
//	Filename: life_server/Functions/D41/fn_KarmaGarageVehicleList.sqf
//	Author: Distrikt41 - Cosmo
//
//	Beschreibung: Liste aller Fahrzeuge, die ab welchem Karmawert (nicht mehr) ausgeparkt werden dürfen.
//::::::::::::  ::::::::::::\\
D41_GarageList_KeinKarmaCheck = //Karma Neutrale Fahrzeuge
	[
		"D41_Trailer_A","D41_CargoContainer_Orange",
		//Zugmaschinen
		"D41_B_Truck_01_mover_F","D41_Truck_01_mover_R","D41_Truck_01_mover_B","D41_Civ_Kamaz_Zugmaschine",
		//Admin
		"RHS_C130J","O_Heli_Attack_02_F","D41_I_Heli_light_03_SWAT_MGs","D41_Mi8AMT_vdv","RHS_UH1Y_UNARMED_d","RHS_AH1Z_wd_GS","RHS_Mi24V_vvs","RHS_Mi24Vt_vvs","rhs_tigr_ffv_3camo_vdv","rhs_gaz66_ammo_msv","D41_B_M998A2_sov_M2","D41_B_M1114_Armored"
	];
	
	
D41_GarageList_Plus9kPlus =
	[
		//Autos
			"D41_rhsusf_m998_d_s_2dr","D41_rhsusf_m998_d_2dr_fulltop",
		//Trucks
			"D41_B_Truck_01_covered_grau","D41_B_Truck_01_covered_rot","D41_B_Truck_01_fuel_F","D41_B_Truck_01_fuel_grau",
		//Helikopter
			"D41_Heli_Transport_03_Blau","D41_Heli_Transport_03_Weiss","D41_Heli_Transport_03_Grau","D41_Heli_Transport_03_Pink","D41_Heli_Transport_03_unarmed_F"
	];
	
	
D41_GarageList_Plus9kMinus =
	[
		//Leer
	];
	
	
D41_GarageList_Plus6kPlus =
	[
		//Autos
			"D41_C_Offroad_Rally_F","D41_Offroad_Snake_TFuel_TPS",
		//Trucks
			"D41_B_Truck_01_transport_grau","D41_B_Truck_01_transport_rot","D41_typhoon_vdv","D41_typhoon_vdv_blau","D41_typhoon_vdv_wert",
		//Helikopter
			"civ_mohawk_ion","civ_mohawk_dahoman","D41_Heli_Transport_04_fuel_Blaugrau","D41_Heli_Transport_04_fuel_grey"
	];
D41_GarageList_Plus6kMinus =
	[
		//Leer
		""
	];
	
	
D41_GarageList_Plus3kPlus =
	[
		//Autos
			"D41_Offroad_Snake","D41_Hatchback_Snake",
		//Trucks
			"D41_O_Truck_03_transport_gruen","D41_O_Truck_03_transport_grau","D41_O_Truck_03_transport_braun","D41_O_Truck_03_transport_weiss","D41_O_Truck_03_ammo_gruen","D41_O_Truck_03_ammo_grau",
			"D41_O_Truck_03_ammo_braun","D41_O_Truck_03_ammo_weiss",
		//Boote Civ
			"D41_Trawler"
	];
D41_GarageList_Plus3kMinus =
	[
		//Rebellen
			"D41_uaz_open_MSV_01","D41_UAZ_MSV_01","D41_BAF_Offroad_W","D41_gaz66o_msv","D41_gaz66_msv",
		//Rebellen Boote
			"I_Boat_Transport_01_F","D41_SDV_01_F"
	];
	
	
D41_GarageList_Plus0Plus =
	[
		//Autos
			"D41_C_Offroad_01_red_F","D41_C_Offroad_01_white_F","D41_C_Offroad_01_blue_F","D41_C_Offroad_01_darkred_F","D41_C_Offroad_01_bluecustom_F",
			"D41_C_SUV_Rot","D41_C_SUV_Schwarz","D41_C_SUV_Grau","D41_C_SUV_Orange","D41_C_SUV_sport_Rot","D41_C_SUV_sport_Schwarz","D41_C_SUV_sport_Grau","D41_C_SUV_sport_Orange","D41_BMW_X6M_Flames",
		//Trucks
		//	"D41_B_Truck_01_mover_F","D41_Truck_01_mover_R","D41_Truck_01_mover_B", //Testweise auch für alle freigeschalten!
		//Helikopter
			"D41_Heli_Light_02_unarmed_F","D41_civ_ka60_whiteblue","D41_Heli_Transport_04_Blaugrau_F","D41_Heli_Transport_04_Grey_F","D41_Heli_Transport_04_covered_Blaugrau","D41_Heli_Transport_04_covered_Grey"
	];
D41_GarageList_Plus0Minus =
	[
		//Rebellen
			"D41_Reb_Offroad_01_F","D41_B_G_Offroad_01_repair_F","D41_B_G_Van_01_transport_F","D41_I_G_Van_01_transport_F","D41_I_G_Van_01_fuel_F",
		//Rebellen Air
		"D41_Sab_ee_An2","D41_Sab_ru_An2"
	];
	
	
D41_GarageList_Minus3kPlus =
	[
		//Gebraucht Busse
			"D41_Ikarus_Civ_01", "D41_Ikarus_Civ_02",
		//Helikopter
			"D41_civ_md500_blueline","D41_civ_md500_shadow","D41_civ_md500_whitered","D41_civ_md500_greywatcher","D41_civ_md500_speedy","D41_civ_md500_sunset","D41_civ_md500_wasp","D41_civ_md500_wave"
	];
D41_GarageList_Minus3kMinus =
	[
		//Rebellen
			"D41_Ural_Open_MSV_01","D41_Ural_MSV_01","D41_Ural_Fuel_MSV_01","D41_civ_md500_urban","D41_Heli_Transport_04_bench_F"
	];
	
	
D41_GarageList_Minus6kPlus =
	[
		//Autos
			"D41_Octavia_Civ_Weiss","D41_Octavia_Civ_Gelb","D41_Octavia_Civ_Blau","D41_Octavia_Civ_Schwarz","D41_Octavia_Civ_01","C_Hatchback_01_rallye_F","D41_BAF_Offroad_D","D41_Hatchback_Sport_Gruen",
			"D41_Hatchback_Sand","D41_Hatchback_Gruen","D41_Hatchback_Blau","D41_Hatchback_Dunkelblau","D41_Hatchback_Gelb","D41_Hatchback_Schwarz","D41_Hatchback_Sport_Rot","D41_Hatchback_Sport_BlauMuster","D41_Hatchback_Sport_WeissMuster",
		//Trucks
			"D41_C_Van_01_box_F","D41_C_Van_01_box_white","D41_C_Van_01_box_red","D41_C_Van_01_box_black","D41_C_Van_01_box_cool","D41_Civ_Truck_02_transport_weiss","D41_Civ_Truck_02_transport_blau","D41_Civ_Truck_02_transport_orange",
			"D41_Civ_Truck_02_transport_plane_weiss","D41_Civ_Truck_02_transport_plane_blau","D41_Civ_Truck_02_transport_plane_orange","D41_C_Van_01_fuel_F","D41_C_Van_01_fuel_white","D41_C_Van_01_fuel_black","D41_C_Van_01_fuel_red","D41_Civ_Truck_02_fuel2_weiss","D41_Civ_Truck_02_fuel2_blau",
			"D41_Civ_Truck_02_fuel2_orange","D41_Civ_Truck_02_fuel2_Fass","D41_Ikarus_Civ_Linien","D41_Ikarus_Civ_Party",
		//Boote Civ
			"C_Rubberboat","C_Boat_Civil_01_F"
	];
D41_GarageList_Minus6kMinus =
	[
		//Rebellen
			"D41_rhsusf_m998_w_4dr","D41_rhsusf_m998_w_4dr_fulltop","D41_gaz66_r142_msv"
	];
	
	
D41_GarageList_Minus9kPlus =
	[
		//Gebrauchtwagen
			"D41_Lada_Civ_01","D41_Lada_Civ_04","D41_Lada_Civ_03","D41_Lada_Civ_02","D41_S1203_Civ_01","D41_S1203_Civ_Gruen","D41_S1203_Civ_Orange",
			"D41_S1203_Civ_Rot","D41_S1203_Civ_Silber","D41_S1203_Civ_Weiss","D41_Gaz24_Civ_01","D41_Gaz24_Civ_02","D41_Gaz24_Civ_03","D41_C_Van_transport_white","D41_C_Van_transport_red","D41_C_Van_transport_black",
		//Flugzeug
			"D41_sab_ca_An2","D41_Sab_tk_An2","D41_Sab_af_An2","D41_Sab_cz_An2","D41_Sab_ana_An2","D41_Sab_yel_An2","RHS_C130J","O_Heli_Attack_02_F","D41_Mi8amt_civilian","D41_Mi8AMT_vdv","RHS_UH1Y_UNARMED_d","RHS_AH1Z_wd_GS"
	];
	
D41_GarageList_Minus9kMinus =
	[
		//Rebellen
			"D41_rhsusf_m1025_w","D41_B_G_Offroad_01_armed_F","D41_B_M1114_Armored"
	];
	
D41_Garage_GangBase01 =
	[
			"D41_Base_Offroad_01","I_MRAP_03_F","D41_Offroad_armed_base01","D41_O_Truck_03_transport_F","D41_O_Truck_03_ammo_F","I_Heli_Transport_02_F","O_Boat_Armed_01_hmg_F"
	];
	
D41_Garage_GangBase02 =
	[
			"D41_Base_Offroad_02","O_MRAP_base02","D41_Offroad_armed_base02","D41_O_Truck_03_transport_base02","D41_O_Truck_03_ammo_base02","civ_mohawk_base02","O_Boat_Armed_01_hmg_F"
	];
	
D41_Garage_GangBase03 =
	[
			"D41_Base_Offroad_03","D41_rhsusf_m998_d_4dr","D41_tigr_gelb","D41_Truck_01_mover_S","D41_Ural_Open_MSV_Gelb","D41_Ural_MSV_Plane_gelb","D41_B_Truck_01_fuel_s","D41_Mi8AMT_vdv"
	];
	
D41_Garage_GangBase04 =
	[
			"D41_Base_Offroad_04","D41_rhsusf_m998_w_4dr","D41_tigr_blau","D41_Truck_01_mover_bg","D41_Ural_Open_MSV_Blau","D41_Ural_MSV_Plane_blau","D41_B_Truck_01_fuel_bg","D41_Heli_Transport_03_Blaugrau"
	];
	
D41_Garage_GangBase05 =
	[
			"D41_Golf4_Civ_Blau","D41_Offroad_Hero_TFuel_TPS","D41_rhsusf_m1025_d","D41_Truck_01_mover_hb","D41_B_Truck_01_fuel_hb","D41_B_Truck_01_box_hb","D41_Heli_Transport_03_Hellblau"
	];
	
D41_Garage_GangBase06 =
	[
			"D41_uaz_open_IHV","D41_Offroad_01_repair_ihv","D41_rhsusf_m1025_d","D41_Civ_Truck_02_transport_IHV","D41_Civ_Truck_02_fuel2_IHV","D41_Ural_MSV_IHV","D41_Truck_01_mover_ihv","D41_Mi8amt_civilian"
	];