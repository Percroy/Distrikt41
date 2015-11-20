#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["D41_Lada_R_Gelb1",4000],
			["D41_Lada_R_Gelb2",4000],
			["D41_Lada_R_Gelb3",4000],
			["D41_Lada_R_Gruen4",4000],
			["D41_Lada_R_Gruen5",4000],
			["D41_Lada_R_Gruen6",4000],
			["D41_Lada_R_Blau7",4000],
			["D41_Lada_R_Blau8",4000],
			["D41_Lada_R_Blau9",4000],
			["D41_Lada_R_Rot10",4000],
			["D41_Lada_R_Rot11",4000],
			["D41_Lada_R_Rot12",4000],
			["D41_Lada_R_Pink13",4000],
			["D41_Lada_R_Pink14",4000],
			["D41_Lada_R_Pink15",4000]
		];
	};
/////GEBRAUCHTWAGEN/////
	case "civ_car":
	{
		_return = 
		[	
			["D41_Lada_Civ_01",1000], // VAZ-2103 Russian Weiss
			["D41_Lada_Civ_04",1125], // VAZ-2103 Decorated
			["D41_Lada_Civ_03",1000], // VAZ-2103 Grün
			["D41_Lada_Civ_02",1000], // VAZ-2103 Rot
			["D41_S1203_Civ_01", 2450], //Skoda 1203 Hellblau
			["D41_S1203_Civ_Gruen", 2450], // Skoda 1203 Grün
			["D41_S1203_Civ_Orange", 2450], // Skoda 1203 Orange
			["D41_S1203_Civ_Rot", 2450], // Skoda 1203 Rot
			["D41_S1203_Civ_Silber", 2450], // Skoda 1203 Silber
			["D41_S1203_Civ_Weiss", 2450], // Skoda 1203 Weiss
			["D41_Gaz24_Civ_01", 3500], //GAZ-24 Blau
			["D41_Gaz24_Civ_02", 3500], //GAZ-24 Grau
			["D41_Gaz24_Civ_03", 3950], //GAZ-24 Schwarz
			//["D41_Golf4_Civ_Weiss", 4900], // Golf IV 1.9 TDI Weiss
			//["D41_Golf4_Civ_Gelb",4900], // Golf IV 1.9 TDI Gelb
			//["D41_Golf4_Civ_Gruen",4900], // Golf IV 1.9 TDI Grün
			["D41_C_Van_transport_white",17500],
			["D41_C_Van_transport_red",17500],
			["D41_C_Van_transport_black",17500]
		];
		if(life_D41_Karma > 1000)then
        {
            _return pushback ["D41_Ikarus_Civ_02",22500]; // Ikarus 260.03 BUS Verrostet
			_return pushback ["D41_Ikarus_Civ_01",24500]; // Ikarus 260.03 BUS
		};
	};
/////NEUWAGEN/////
	case "civ_lux_car":
	{
        _return = [];
        if(life_D41_Karma > -3000)then
        {
            _return pushback ["D41_Octavia_Civ_Weiss",10000]; // Skoda Octaivia Weiss
			_return pushback ["D41_Octavia_Civ_Gelb",10000];  // Skoda Octaivia Gelb
			_return pushback ["D41_Octavia_Civ_Blau",10000]; // Skoda Octaivia Blau
			_return pushback ["D41_Octavia_Civ_Schwarz",11000];  // Skoda Octaivia Schwarz
			_return pushback ["D41_Octavia_Civ_01",11000]; // Skoda Octaivia II 2.0 TDI
			_return pushback ["D41_Hatchback_Sand",10000]; //Honda Civic
			_return pushback ["D41_Hatchback_Gruen",10000]; //Honda Civic
			_return pushback ["D41_Hatchback_Blau",10000]; //Honda Civic
			_return pushback ["D41_Hatchback_Dunkelblau",10000]; //Honda Civic
			_return pushback ["D41_Hatchback_Gelb",10000]; //Honda Civic
			_return pushback ["D41_Hatchback_Schwarz",10000]; //Honda Civic
			_return pushback ["C_Hatchback_01_rallye_F",16100]; //Honda Civic TypeR Rally
			_return pushback ["D41_Hatchback_Sport_Rot",24400]; //Honda Civic TypeR
			_return pushback ["D41_Hatchback_Sport_BlauMuster",24400]; //Honda Civic TypeR
			_return pushback ["D41_Hatchback_Sport_WeissMuster",24400]; //Honda Civic TypeR
			_return pushback ["D41_Hatchback_Sport_Gruen",24400]; //Honda Civic TypeR
			_return pushback ["D41_BAF_Offroad_D",11850]; //UK Offroad Desert
		};
		if(life_D41_Karma > 2000)then
        {
			_return pushback ["D41_C_Offroad_01_red_F", 19000]; //Isuzu Offroad Rot
			_return pushback ["D41_C_Offroad_01_white_F", 19000]; //Isuzu Offroad Weiss
			_return pushback ["D41_C_Offroad_01_blue_F", 19000]; //Isuzu Offroad Blau
			_return pushback ["D41_C_Offroad_01_darkred_F", 19000]; //Isuzu Offroad Dunkelrot
			_return pushback ["D41_C_Offroad_01_bluecustom_F", 19000]; //Isuzu Offroad Blau Custom
			_return pushback ["D41_C_SUV_Rot",22500]; //BMW X6
			_return pushback ["D41_C_SUV_Schwarz",22500]; //BMW X6
			_return pushback ["D41_C_SUV_Grau",22500]; //BMW X6
			_return pushback ["D41_C_SUV_Orange",22500]; //BMW X6
			_return pushback ["D41_C_SUV_sport_Rot",35750]; //BMW X6M
			_return pushback ["D41_C_SUV_sport_Schwarz",35750]; //BMW X6M
			_return pushback ["D41_C_SUV_sport_Grau",35750]; //BMW X6M
			_return pushback ["D41_C_SUV_sport_Orange",35750]; //BMW X6M
			_return pushback ["D41_BMW_X6M_Flames",36750]; //BMW X6M Flames
        };
		if(life_D41_Karma > 6000)then
        {
			_return pushback ["D41_Offroad_Snake",17850];
			_return pushback ["D41_Hatchback_Snake",15000];
        };
		if(life_D41_Karma > 8000)then
        {
			_return pushback ["D41_rhsusf_m998_d_s_2dr",73000]; //HMWVV Offen
        };
		if(life_D41_Karma > 10000)then
        {
			_return pushback ["D41_Offroad_Snake_TFuel_TPS",24000];
			_return pushback ["D41_rhsusf_m998_d_2dr_fulltop",95000]; //HMMWV Plane
        };
    };
/////LKWs/////	
	case "civ_truck":
	{
        _return = [];
        if(life_D41_Karma > -3000)then
        {
            _return pushback ["D41_C_Van_01_box_white",22500]; //Iveco Boxer {2500} 
			_return pushback ["D41_C_Van_01_box_red",22500]; //Iveco Boxer {2500}
			_return pushback ["D41_C_Van_01_box_black",22500]; //Iveco Boxer {2500}
			_return pushback ["D41_C_Van_01_box_cool",23000]; //Iveco Boxer {2500}
			_return pushback ["D41_Ikarus_Civ_Linien",25000]; // Ikarus 260.03 Linienbus
			_return pushback ["D41_Ikarus_Civ_Party",25000]; // Ikarus 260.03 Partybus
			_return pushback ["D41_Civ_Truck_02_transport_weiss",56500]; // Kamaz Transport offen {4500} 90Km/h  	WEISS
			_return pushback ["D41_Civ_Truck_02_transport_blau",56500]; // Kamaz Transport offen {4500} 90Km/h	BLAU
			_return pushback ["D41_Civ_Truck_02_transport_orange",56500]; // Kamaz Transport offen {4500} 90Km/h	ORANGE
			_return pushback ["D41_Civ_Truck_02_transport_plane_weiss",75000]; // Kamaz Transport covered {5500} 90Km/h	WEISS
			_return pushback ["D41_Civ_Truck_02_transport_plane_blau",75000]; // Kamaz Transport covered {5500} 90Km/h	BLAU
			_return pushback ["D41_Civ_Truck_02_transport_plane_orange",75000]; // Kamaz Transport covered {5500} 90Km/h	ORANGE
			_return pushback ["D41_C_Van_01_fuel_white",35000]; //4x4 Fuel
			_return pushback ["D41_C_Van_01_fuel_red",35000]; //4x4 Fuel
			_return pushback ["D41_C_Van_01_fuel_black",35000]; //4x4 Fuel
			_return pushback ["D41_Civ_Truck_02_fuel2_weiss",70000]; //Kamaz Fuel WEISS
			_return pushback ["D41_Civ_Truck_02_fuel2_blau",70000]; //Kamaz Fuel BLAU
			_return pushback ["D41_Civ_Truck_02_fuel2_orange",70000]; //Kamaz Fuel ORANGE
			_return pushback ["D41_Civ_Truck_02_fuel2_Fass",72000]; //Kamaz Fuel Brauerei
		};
		if(life_D41_Karma > 2000)then
        {
			_return pushback ["D41_B_Truck_01_mover_F",108000];  // HEMTT ohne alles {2500} 80Km/h  OLIV
			_return pushback ["D41_Truck_01_mover_R",108000];  // HEMTT ohne alles {2500} 80Km/h	ROT
			_return pushback ["D41_Truck_01_mover_B",108000];  // HEMTT ohne alles {2500} 80Km/h	BLAU
			_return pushback ["D41_Civ_Kamaz_Zugmaschine",108000];  // KamaZ Zugmaschine
		};
		if(life_D41_Karma > 4000)then
        {
			_return pushback ["D41_O_Truck_03_transport_gruen",135000]; // Tempest Transport offen {7500} 100Km/h
			_return pushback ["D41_O_Truck_03_transport_grau",135000]; // Tempest Transport offen {7500} 100Km/h
			_return pushback ["D41_O_Truck_03_transport_braun",135000]; // Tempest Transport offen {7500} 100Km/h
			_return pushback ["D41_O_Truck_03_transport_weiss",135000]; // Tempest Transport offen {7500} 100Km/h
			_return pushback ["D41_O_Truck_03_ammo_gruen",165000]; // Tempest Transport Ammoboxen {9000} 100Km/h
			_return pushback ["D41_O_Truck_03_ammo_grau",165000]; // Tempest Transport Ammoboxen {9000} 100Km/h
			_return pushback ["D41_O_Truck_03_ammo_braun",165000]; // Tempest Transport Ammoboxen {9000} 100Km/h
			_return pushback ["D41_O_Truck_03_ammo_weiss",165000]; // Tempest Transport Ammoboxen {9000} 100Km/h
		};
		if(life_D41_Karma > 8000)then
        {
			_return pushback ["D41_B_Truck_01_transport_grau", 195000]; // HEMTT Transport offen {11000} 80Km/h
			_return pushback ["D41_B_Truck_01_transport_rot", 195000]; // HEMTT Transport offen {11000} 80Km/h
			_return pushback ["D41_typhoon_vdv",250000]; // Typhoon VDV schwarz
			_return pushback ["D41_typhoon_vdv_blau",250000]; // Typhoon VDV Blau
		};
		if(life_D41_Karma > 10000)then
        {
			_return pushback ["D41_typhoon_vdv_wert",255000]; // Typhoon VDV Werttransport
			_return pushback ["D41_B_Truck_01_covered_grau",260000]; // HEMTT Transport covered {13000} 80Km/h
			_return pushback ["D41_B_Truck_01_covered_rot",260000]; // HEMTT Transport covered {13000} 80Km/h
			_return pushback ["D41_B_Truck_01_fuel_F",240000]; //HEMTT Fuel Rot
			_return pushback ["D41_B_Truck_01_fuel_grau",240000]; //HEMTT Fuel Grau
        };
    };
	
	case "civ_container":
	{
        _return = [];
        //if(life_D41_Karma > 9000)then
        //{
			_return pushback ["D41_B_Truck_01_mover_F",108000];  // HEMTT ohne alles {2500} 80Km/h  OLIV
			_return pushback ["D41_Truck_01_mover_R",108000];  // HEMTT ohne alles {2500} 80Km/h	ROT
			_return pushback ["D41_Truck_01_mover_B",108000];  // HEMTT ohne alles {2500} 80Km/h	BLAU
			_return pushback ["D41_Civ_Kamaz_Zugmaschine",108000];  // KamaZ Zugmaschine
			_return pushback ["D41_Trailer_A",260000]; //Anhänger
			_return pushback ["D41_CargoContainer_Orange",70000];  // Container
		//};
    };
/////REBELLEN/////	
	case "reb_car":
	{
		_return = [];	
		if(license_civ_rebel && life_D41_Karma < -1000) then
		{
			_return pushback ["D41_uaz_open_MSV_01",5000]; //UAZ Offen
			_return pushback ["D41_UAZ_MSV_01",6000];  //UAZ geschlossen
			_return pushback ["D41_BAF_Offroad_W",11850]; //Landrover Woodland
			_return pushback ["D41_gaz66o_msv",17500]; //GAZ Pritsche {3500} 75Km/h
			_return pushback ["D41_gaz66_msv",19000];  //GAZ Plane {4000} 75Km/h
		};
		if(license_civ_rebel && life_D41_Karma < -2500) then
		{
			_return pushback ["D41_Reb_Offroad_01_F",18500];
			_return pushback ["D41_B_G_Offroad_01_repair_F",18500];
			_return pushback ["D41_B_G_Van_01_transport_F",21000]; // Boxer Tarnfarben (Waffenplattform)
			_return pushback ["D41_I_G_Van_01_fuel_F",19000]; // Boxer Tarnfarben (Fuel)
		};
		if(license_civ_rebel && life_D41_Karma < -5000) then
		{
			_return pushback ["D41_Ural_Open_MSV_01",56500]; // Ural Offen
			_return pushback ["D41_Ural_MSV_01",75000]; // Ural Plane
			_return pushback ["D41_Ural_Fuel_MSV_01",65000]; // Ural Fuel
			_return pushback ["D41_civ_md500_urban",150000]; // Rebellen Littlebird
			_return pushback ["D41_Heli_Transport_04_bench_F",240000]; //Taru Personentransporter offen
		};
		if(license_civ_rebel && life_D41_Karma < -7000) then
		{
			_return pushback ["D41_rhsusf_m998_w_4dr",65000]; //HMMWV Bandit Plane
			_return pushback ["D41_rhsusf_m998_w_4dr_fulltop",80000]; //HMMWV Bandit Plane
			_return pushback ["D41_gaz66_r142_msv",21000]; //GAZ 66 METH
		};
		if(license_civ_rebel && life_D41_Karma < -10000) then
		{
			_return pushback ["D41_rhsusf_m1025_w",150000]; //HMMWV Bandit geschlossen
			_return pushback ["D41_B_G_Offroad_01_armed_F",300000]; //Isuzu_Offroad_50Cal
		};
	};
	
	case "reb_ship":
	{
		if(license_civ_rebel && life_D41_Karma < -1000) then
		{
			_return pushback ["I_Boat_Transport_01_F",3000]; 
			_return pushback ["D41_SDV_01_F",20000]; 
		};
		if(license_civ_base01) then //für Base 01
		{
			_return pushback ["O_Boat_Armed_01_hmg_F",240000]; //50er Gunboat
		};
		if(license_civ_base02) then //für Base 02
		{
			_return pushback ["O_Boat_Armed_01_hmg_F",240000]; //50er Gunboat
		};
	};
/////GANGSHOPS/////		
	case "base_01_car": //Bandit Base (BL)
	{
		_return = [];	
		if(license_civ_base01) then //+ Kampfboot 50er beim Rebellenshop
		{
			_return pushback ["D41_Base_Offroad_01",20000]; //Offroad
			_return pushback ["I_MRAP_03_F",110000]; //Fennek Strider
			_return pushback ["D41_Offroad_armed_base01",140000]; //Offroad 50er
			_return pushback ["D41_O_Truck_03_transport_F",45000]; // Tempest Transport offen 
			_return pushback ["D41_O_Truck_03_ammo_F",55000]; // Tempest Transport Ammoboxen 
			_return pushback ["I_Heli_Transport_02_F",240000]; //Mohawk Tarn
		};
	};
	case "base_02_car": //Bandit Base (AP)
	{
		_return = [];	
		if(license_civ_base02) then //+ Kampfboot 50er beim Rebellenshop
		{
			_return pushback ["D41_Base_Offroad_02",20000]; //Offroad
			_return pushback ["O_MRAP_base02",110000]; //Ifrit
			_return pushback ["D41_Offroad_armed_base02",140000]; //Offroad 50er
			_return pushback ["D41_O_Truck_03_transport_base02",45000]; // Tempest Transport offen 
			_return pushback ["D41_O_Truck_03_ammo_base02",55000]; // Tempest Transport Plane 
			_return pushback ["civ_mohawk_base02",240000]; //Mohawk Tarn
		};
	};
	case "base_03_car": //Neutral Base
	{
		_return = [];	
		if(license_civ_base03) then
		{
			_return pushback ["D41_Base_Offroad_03",20000]; //Offroad
			_return pushback ["D41_rhsusf_m998_d_4dr",22500]; //HMMWV Offen	
			_return pushback ["D41_tigr_gelb",35000]; //TIGR Sand			
			_return pushback ["D41_Truck_01_mover_S",65000]; // HEMTT Mover Sand
			_return pushback ["D41_Ural_Open_MSV_Gelb",45000]; // Ural MSV offen Gelb
			_return pushback ["D41_Ural_MSV_Plane_gelb",50000]; // Ural MSV covered Gelb
			_return pushback ["D41_B_Truck_01_fuel_s",100000]; // HEMTT Fuel Sand
			_return pushback ["D41_Mi8AMT_vdv",200000]; // Mi8 Oliv
		};
	};
	case "base_04_car": //Neutral Base (HdA)
	{
		_return = [];	
		if(license_civ_base04) then
		{
			_return pushback ["D41_Base_Offroad_04",20000]; //Offroad
			_return pushback ["D41_rhsusf_m998_w_4dr",22500]; //HMMWV Offen	
			_return pushback ["D41_tigr_blau",35000]; //TIGR Blau	
			_return pushback ["D41_Truck_01_mover_bg",65000]; // HEMTT Mover Blaugrau
			_return pushback ["D41_Ural_Open_MSV_Blau",45000]; // Ural MSV offen Blaugrau
			_return pushback ["D41_Ural_MSV_Plane_blau",50000]; // Ural MSV covered Blaugrau
			_return pushback ["D41_B_Truck_01_fuel_bg",100000]; // HEMTT Fuel Blaugrau
			_return pushback ["D41_Heli_Transport_03_Blaugrau",250000]; // Huron Blaugrau
		};
	};
	case "base_05_car": //Hero Base
	{
		_return = [];	
		if(license_civ_base05) then
		{
			_return pushback ["D41_Golf4_Civ_Blau",9000];  // Golf TDI Blau
			_return pushback ["D41_Offroad_Hero_TFuel_TPS",20000]; //Offroad TPS Hero
			_return pushback ["D41_rhsusf_m1025_d",45000]; //HMWVV gepanzert 
			_return pushback ["D41_Truck_01_mover_hb",65000]; // HEMTT Mover Hellblau
			_return pushback ["D41_B_Truck_01_fuel_hb",100000]; // HEMTT Fuel Hellblau
			_return pushback ["D41_B_Truck_01_box_hb",260000]; // HEMTT Transport Container Hellblau
			_return pushback ["D41_Heli_Transport_03_Hellblau",250000]; // Huron Hellblau
		};
	};
	case "base_06_car": //Hero Base (IHV)
	{
		_return = [];	
		if(license_civ_base06) then
		{
			_return pushback ["D41_uaz_open_IHV",6000]; //UAZ Offen
			_return pushback ["D41_Offroad_01_repair_ihv",11000]; //Offroad Repair IHV
			_return pushback ["D41_rhsusf_m1025_d",45000]; //HMWVV gepanzert 
			_return pushback ["D41_Civ_Truck_02_transport_IHV",30000]; // Kamaz Transport covered IHV
			_return pushback ["D41_Civ_Truck_02_fuel2_IHV",35000]; // Kamaz Fuel IHV
			_return pushback ["D41_Ural_MSV_IHV",45000]; // Ural MSV covered IHV
			_return pushback ["D41_Truck_01_mover_ihv",65000]; // HEMTT Mover IHV
			_return pushback ["D41_Mi8amt_civilian",200000]; // Mi8 Civilian
		};
	};
/////POLIZEI/////		
	case "cop_car":
	{
		if(!license_cop_gangfirma) then
		{
			_return pushback ["D41_Lada_Civ_05",1000]; //Police Lada
			_return pushback ["D41_Offroad_Pol",3000]; //Police Offroad
			_return pushback ["D41_BMW_X6M_Pol2",6000]; //Police BMW
			_return pushback ["D41_B_Truck_01_ammo_cop",45000]; //HEMTT Ammo
		};
		if((__GETC__(life_coplevel) > 4) && !license_cop_gangfirma) then
		{
			_return pushback ["D41_Offroad_Snake_TFuel_TPS",6000]; //Zivilfahnder Snake Offroad
		};
		if(license_cop_swat && !license_cop_gangfirma) then
		{
			_return pushback ["D41_Offroad_SWAT",3300];
			_return pushback ["D41_tigr_swat",40000]; //TIGR SWAT
			_return pushback ["D41_rhsusf_m998_w_4dr",35000];
			_return pushback ["D41_B_m1151_m240_deployment",50000]; //HMMWVE SWAT 7,62
			_return pushback ["D41_B_m1151_m2_deployment_Jtac",70000]; //HMMWV Desert M2 SWAT
			_return pushback ["D41_B_m1151_m2_deployment_Bumper",75000]; //HMMWV Desert M2 SWAT FRAG
		};
		if((__GETC__(life_coplevel) > 9) && !license_cop_gangfirma) then
		{
			_return pushback ["D41_Lada_Civ_05_tuned",10000]; //Militia Tuned
			_return pushback ["D41_swat_hunter",75000]; //SWAT Hunter
		};
	};
	
	case "cop_air":
	{
		if(__GETC__(life_coplevel) > 2 && !license_cop_gangfirma) then
		{
			_return pushback ["D41_police_helicopter",28000];
		};
		if(__GETC__(life_coplevel) > 4 && !license_cop_gangfirma) then
		{
			_return pushback ["D41_I_Heli_light_03_cop",65500];
		};
		if(license_cop_swat && !license_cop_gangfirma) then
		{
			_return pushback ["D41_I_Heli_light_03_SWAT",65500];
			_return pushback ["D41_RHS_UH60M",75000];
		};
	};
	
	case "cop_ship":
	{
		if(__GETC__(life_coplevel) > 4 && !license_cop_gangfirma) then
		{
			_return pushback ["B_Boat_Transport_01_F",1500];
			_return pushback ["C_Boat_Civil_01_police_F",7500];
			_return pushback ["B_Boat_Armed_01_minigun_F",28000];
			_return pushback ["B_SDV_01_F",3750];
		};
		if(__GETC__(life_mediclevel) > 0 && playerSide == independent) then
		{
			_return pushback ["B_Lifeboat",1500];
			_return pushback ["C_Boat_Civil_01_rescue_F",7500];
			_return pushback ["B_SDV_01_F",3750];
		};
	};
/////SECURITY/////	
	case "security_car":
	{
		if(license_cop_gangfirma) then
		{
			_return pushback ["D41_Offroad_Security",3500];
			_return pushback ["D41_rhsusf_m998_d_4dr",35000];
			_return pushback ["D41_tigr_security",40000];
		};
		if((__GETC__(life_coplevel) > 4) && license_cop_gangfirma) then
		{
			_return pushback ["D41_C_SUV_sport_Schwarz",35750]; //BMW X6M
			_return pushback ["D41_typhoon_vdv_wert",255000];
		};
	};
	
	case "security_air":
	{
		if(license_cop_gangfirma) then
		{
			_return pushback ["D41_security_helicopter",28000];
			_return pushback ["D41_Heli_Transport_04_bench_Sec",75500];
			_return pushback ["D41_Heli_Transport_03_unarmed_F",200000]; //Huron Black
		};
	};
/////MEDICS/////		
	case "med_shop":
	{
		_return = [
			["D41_S1203_Civ_02",500],
			["D41_Offroad_Medic",3000],
			["D41_Offroad_Medic2",3000],
			["D41_B_HMMWV_Medevac",20000]
		];
	};
	
	case "med_air_hs":
	{
		_return = [
			["D41_medic_helicopter",20000],		//Littlebird Medic
			["D41_ka60_medic",30000],			//Orca Medic
			["D41_Heli_Transport_04_medevac_F",35000]//Taru Medic
		];
	};
/////ADAC/////		
	case "adac_shop":
	{
		_return = 
		[
			["D41_Offroad_ADAC",3000], //Isuzu ADAC
			["D41_Offroad_ADAC2",3000], //Isuzu Repair
			["D41_Offroad_ADAC3",3000], //Isuzu Repair
			["D41_Truck_01_mover_F",6000], // Tempest Mover	ADAC
			["D41_Trailer_A",150000], //Anhänger
			["D41_ADAC_helicopter",20000], // Littlebird ADAC	
			["D41_ka60_adac",30000], // KA60 ADAC
			["D41_Heli_Transport_03_ADAC",40000] // Huron Transport
		];
	};
/////HELIKOPTER UND FLUGZEUGE/////	
	case "civ_air":
	{
        _return = [];
        if(license_civ_air)then
        {
			_return pushback ["D41_sab_ca_An2",250000]; // An-2 Oldie
			_return pushback ["D41_Sab_tk_An2",250000]; // An-2 AirTak
			_return pushback ["D41_Sab_af_An2",250000]; // An-2 Aeroflot
			_return pushback ["D41_Sab_cz_An2",250000]; // An-2 Air Racing
			_return pushback ["D41_Sab_ana_An2",250000]; // An-2 Anastasija
			_return pushback ["D41_Sab_yel_An2",250000]; // An-2 BigPanda	
		};
		if((life_D41_Karma > -2000) && license_civ_air) then
        {
			_return pushback ["D41_civ_md500_blueline",175000]; //Littlebird 
			_return pushback ["D41_civ_md500_shadow",175000];  // Littlebird
			_return pushback ["D41_civ_md500_whitered",175000]; // Littlebird
			_return pushback ["D41_civ_md500_greywatcher",175000];  // Littlebird
			_return pushback ["D41_civ_md500_speedy",175000]; // Littlebird
			_return pushback ["D41_civ_md500_sunset",175000]; // Littlebird
			_return pushback ["D41_civ_md500_wasp",175000]; // Littlebird
			_return pushback ["D41_civ_md500_wave",175000]; // Littlebird
        };
		if((life_D41_Karma > 4000) && license_civ_air) then
        {
			_return pushback ["D41_Heli_Light_02_unarmed_F", 240000]; // Orca Schwarz 
			_return pushback ["D41_civ_ka60_whiteblue", 240000]; // Orca Weißblau 
			_return pushback ["D41_Heli_Transport_04_Blaugrau_F", 240000]; //Taru ohne Module
			_return pushback ["D41_Heli_Transport_04_Grey_F", 240000]; //Taru ohne Module
			_return pushback ["D41_Heli_Transport_04_covered_Blaugrau",300000]; //Taru Personenmodul
			_return pushback ["D41_Heli_Transport_04_covered_Grey",300000]; //Taru Personenmodul
			
        };
		if((life_D41_Karma > 8000)&& license_civ_air) then
        {
			_return pushback ["civ_mohawk_ion",335000]; 
			_return pushback ["civ_mohawk_dahoman",335000]; 
			_return pushback ["D41_Heli_Transport_04_fuel_Blaugrau",300000]; //Taru Benzinmodul
			_return pushback ["D41_Heli_Transport_04_fuel_grey",300000]; //Taru Benzinmodul
        };
		if((life_D41_Karma > 10000)&& license_civ_air) then
        {
			_return pushback ["D41_Heli_Transport_03_Blau",350000]; //Huron Blau
			_return pushback ["D41_Heli_Transport_03_Weiss",350000]; //Huron Weiss
			_return pushback ["D41_Heli_Transport_03_Grau",350000]; //Huron Grau
			_return pushback ["D41_Heli_Transport_03_Pink",350000]; //Huron Pink
			_return pushback ["D41_Heli_Transport_03_unarmed_F",380000]; //Huron Black
        };
		if((life_D41_Karma < -4000)&& license_civ_rebel) then
        {
			_return pushback ["D41_Sab_ee_An2",250000]; // An-2 Estonia AF
			_return pushback ["D41_Sab_ru_An2",250000]; // An-2 Russian AF
        };
		if((call life_adminlevel) > 1) then
		{
			_return pushback ["RHS_C130J",10000];
			_return pushback ["O_Heli_Attack_02_F",10000];
			_return pushback ["D41_Mi8AMT_vdv",10000];
			_return pushback ["RHS_UH1Y_UNARMED_d",10000];
			_return pushback ["RHS_AH1Z_wd_GS",10000];
		};
    };
/////SCHIFFE/////		
	case "civ_ship":
	{
		_return = [];
        if(life_D41_Karma > -5000)then
        {
            _return pushback ["C_Rubberboat",1500]; 
			_return pushback ["C_Boat_Civil_01_F",8000];  
        };
		if(life_D41_Karma > 5000)then
        {
            _return pushback ["D41_Trawler",300000]; //Trawler
        };
	};

};

_return;
