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
			["D41_Lada_Civ_04",1125]
		];
	};
	
	case "adac_shop":
	{
		_return = 
		[
			["Offroad_ADAC",1000], //Isuzu ADAC
			["C_Offroad_01_repair_F",1200], //Isuzu Repair
			["D41_Truck_01_mover_F",5000], // Tempest Mover	ADAC
			["D41_ADAC_helicopter",9000], // Littlebird ADAC	
			["D41_Heli_Transport_04_F",40000] // Taru Transport
		];
	};
	
	case "med_shop":
	{
		_return = [
			["D41_Offroad_Medic",1000],
			["D41_B_M997A2_Ambulance",3000],
			["D41_B_HMMWV_Medevac",4000]
		];
	};
	
	case "med_air_hs":
	{
		_return = [
			["D41_medic_helicopter",4500],		//Littlebird Medic
			//["D41_ka60_medic",7500],			//Orca Medic
			["D41_RHS_UH60M_MEV",8500] //UH60 Medic
		];
	};
	
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
			["C_Van_01_transport_F",17500]
		];
		if(life_D41_Karma > 1000)then
        {
            _return set[count _return,["D41_Ikarus_Civ_02",22500]]; // Ikarus 260.03 BUS Verrostet
			_return set[count _return,["D41_Ikarus_Civ_01",24500]]; // Ikarus 260.03 BUS
		};
	};
	
	case "civ_lux_car":
	{
        _return = [];
        if(life_D41_Karma > -3000)then
        {
            _return set[count _return,["D41_Octavia_Civ_Weiss",10000]]; // Skoda Octaivia Weiss
			_return set[count _return,["D41_Octavia_Civ_Gelb",10000]];  // Skoda Octaivia Gelb
			_return set[count _return,["D41_Octavia_Civ_Blau",10000]]; // Skoda Octaivia Blau
			_return set[count _return,["D41_Octavia_Civ_Schwarz",11000]];  // Skoda Octaivia Schwarz
			_return set[count _return,["D41_Octavia_Civ_01",11000]]; // Skoda Octaivia II 2.0 TDI
			_return set[count _return,["C_Hatchback_01_F",10000]]; //Honda Civic
			_return set[count _return,["C_Hatchback_01_rallye_F",16100]]; //Honda Civic TypeR Rally
			_return set[count _return,["C_Hatchback_01_sport_F",24400]]; //Honda Civic TypeR
			_return set[count _return,["C_Offroad_01_F", 11850]]; //Isuzu Offroad
		};
		if(life_D41_Karma > 2000)then
        {
			_return set[count _return,["D41_BAF_Offroad_D", 19000]]; //UK Offroad Desert
			_return set[count _return,["C_SUV_01_F",22500]]; //BMW X6
			_return set[count _return,["C_SUV_01_sport_F",35750]]; //BMW X6M
			_return set[count _return,["D41_BMW_X6M_Flames",35750]]; //BMW X6M Flames
        };
		if(life_D41_Karma > 6000)then
        {
			_return set[count _return,["D41_Offroad_Snake",12850]];
			_return set[count _return,["D41_Hatchback_Snake",16000]];
        };
		if(life_D41_Karma > 8000)then
        {
			_return set[count _return,["D41_rhsusf_m1025_d",110000]];
			_return set[count _return,["D41_rhsusf_m998_d_4dr_fulltop",55000]];
        };
    };
	
	case "civ_truck":
	{
        _return = [];
        if(life_D41_Karma > -3000)then
        {
            _return set[count _return,["C_Van_01_box_F",22500]]; //Iveco Boxer {2500} 
			_return set[count _return,["B_Truck_01_mover_F",54500]];  // HEMTT ohne alles {2500} 80Km/h
			_return set[count _return,["Civ_Truck_02_transport_F",56500]]; // Kamaz Transport offen {4500} 90Km/h
			_return set[count _return,["Civ_Truck_02_transport_plane_F",75000]]; // Kamaz Transport covered {5500} 90Km/h
			_return set[count _return,["O_Truck_03_transport_F",135000]]; // Tempest Transport offen {7500} 100Km/h
			_return set[count _return,["O_Truck_03_ammo_F",165000]]; // Tempest Transport Ammoboxen {9000} 100Km/h
			_return set[count _return,["B_Truck_01_transport_F", 210000]]; // HEMTT Transport offen {11000} 80Km/h
			//_return set[count _return,["C_Van_01_fuel_F",35000]]; //4x4 Fuel
			//_return set[count _return,["Civ_Truck_02_fuel2_F",70000]]; //Kamaz Fuel
		};
		if(life_D41_Karma > 5000)then
        {
			_return set[count _return,["D41_typhoon_vdv", 230000]]; //Typhoon RHS (geschlossen) {10000} 110Km/h
			_return set[count _return,["B_Truck_01_covered_F",340000]]; // HEMTT Transport covered {13000} 80Km/h
			//_return set[count _return,["O_Truck_03_fuel_F",150000]]; //Tempest Fuel
			//_return set[count _return,["B_Truck_01_fuel_F",275000]]; //HEMTT Fuel
        };
    };

	case "reb_car":
	{
		_return = [];	
		if(license_civ_rebel && life_D41_Karma < -2000) then
		{
			_return set[count _return,["D41_uaz_open_MSV_01",5000]];
			_return set[count _return,["D41_UAZ_MSV_01",6000]];
			_return set[count _return,["D41_Reb_Offroad_01_F",11850]];
			_return set[count _return,["B_G_Offroad_01_repair_F",11850]];
		};
		if(license_civ_rebel && life_D41_Karma < -3000) then
		{
			_return set[count _return,["D41_BAF_Offroad_W",18500]];
			
		};
		if(license_civ_rebel && life_D41_Karma < -4000) then
		{
			_return set[count _return,["D41_gaz66o_msv",37500]]; //GAZ Pritsche {3500} 75Km/h
			_return set[count _return,["D41_gaz66_msv",45000]];  //GAZ Plane {4000} 75Km/h
			_return set[count _return,["I_G_Van_01_transport_F",48000]]; // Boxer Tarnfarben (Waffenplattform)
			_return set[count _return,["D41_Ural_Open_MSV_01",56500]]; //
			//_return set[count _return,["D41_Ural_Fuel_MSV_01",1000]]; //
			_return set[count _return,["D41_Ural_MSV_01",75000]]; //
			_return set[count _return,["civ_md500_urban",150000]];
			_return set[count _return,["D41_Heli_Transport_04_bench_F",240000]]; //Taru Personentransporter offen
		};
		if(license_civ_rebel && life_D41_Karma < -10000) then
		{
			_return set[count _return,["D41_rhsusf_m998_w_4dr_fulltop",100000]];
			_return set[count _return,["D41_rhsusf_m1025_w",200000]];
			_return set[count _return,["I_MRAP_03_F",250000]];
			_return set[count _return,["B_G_Offroad_01_armed_F",300000]];
			_return set[count _return,["D41_B_M1114_Armored",375000]];
		};
	};
	
	case "cop_car":
	{
		if(!license_cop_gangfirma) then
		{
			_return set[count _return,
			["D41_Lada_Civ_05",1000]];
			_return set[count _return,
			["Offroad_Pol",3000]];
			_return set[count _return,
			["BMW_X6M_Pol",6000]];
			_return set[count _return,
			["O_Truck_03_covered_F",45000]];
		};
		if(license_cop_swat && !license_cop_gangfirma) then
		{
			_return set[count _return,
			["D41_Reb_Offroad_01_F",3500]];
			_return set[count _return,
			["D41_tigr_msv",40000]];
			_return set[count _return,
			["D41_rhsusf_m998_d_4dr",35000]];
			_return set[count _return,
			["D41_B_m1151_m240_deployment",50000]];
			_return set[count _return,
			["Offroad_SWAT",3300]];
			_return set[count _return,
			["D41_B_m1151_m2_deployment_Jtac",70000]];
			_return set[count _return,
			["D41_B_m1151_m2_deployment_Bumper",75000]];
		};
		if((__GETC__(life_coplevel) > 10) && license_cop_swat && !license_cop_gangfirma) then
		{
			_return set[count _return,
			["D41_B_M998A2_sov_M2",75000]];
		};
		if(license_cop_gangfirma) then
		{
			_return set[count _return,
			["D41_Offroad_Snake_TFuel_TPS",3500]];
			_return set[count _return,
			["D41_rhsusf_m998_d_4dr",35000]];
			_return set[count _return,
			["D41_tigr_msv",40000]];
		};
	};
	
	case "civ_air":
	{
        _return = [];
        if(license_civ_air)then
        {
            _return set[count _return,["civ_md500_blueline",175000]]; //Littlebird 
			_return set[count _return,["civ_md500_shadow",175000]];  // Littlebird
			_return set[count _return,["civ_md500_whitered",175000]]; // Littlebird
			_return set[count _return,["civ_md500_greywatcher",175000]];  // Littlebird
			_return set[count _return,["civ_md500_speedy",175000]]; // Littlebird
			_return set[count _return,["civ_md500_sunset",175000]]; // Littlebird
			_return set[count _return,["civ_md500_wasp",175000]]; // Littlebird
			_return set[count _return,["civ_md500_wave",175000]]; // Littlebird
			//_return set[count _return,["O_Heli_Light_02_unarmed_F", 280000]]; // Orca Schwarz (einzige Auswahl in VehColorCfg)
			_return set[count _return,["D41_GNT_C185",200000]]; // Cessna
			_return set[count _return,["D41_sab_ca_An2",250000]]; // An-2 Oldie
			_return set[count _return,["D41_Sab_yel_An2",250000]]; // An-2 Gelb
			_return set[count _return,["D41_Sab_tk_An2",250000]]; // An-2 AirTak
			_return set[count _return,["D41_Sab_af_An2",250000]]; // An-2 Aeroflot
		};
		if((life_D41_Karma > -2000) && license_civ_air) then
        {
			_return set[count _return,["D41_Heli_Transport_04_F", 240000]]; //Taru ohne Module
			_return set[count _return,["D41_Heli_Transport_04_covered_F",300000]]; //Taru Personenmodul
			//_return set[count _return,["D41_Heli_Transport_04_Fuel_F",300000]]; //Taru Benzinmodul
        };
		if((life_D41_Karma > 5000)&& license_civ_air) then
        {
			_return set[count _return,["civ_mohawk_ion",335000]]; 
			_return set[count _return,["civ_mohawk_dahoman",335000]]; 
			_return set[count _return,["D41_Heli_Transport_03_unarmed_F",350000]]; //Huron Black
			//["civ_ka60_whiteblue",280000], // Orca Weiss Blau
			//["I_Heli_Transport_02_F",335000],  // Mohawk
        };
    };
	
	case "cop_air":
	{
		if(__GETC__(life_coplevel) > 2 && !license_cop_gangfirma) then
		{
			_return set[count _return,
			["D41_police_helicopter",28000]];
		};
		if(__GETC__(life_coplevel) > 5 && !license_cop_gangfirma) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",65500]];
		};
		if(license_cop_swat && !license_cop_gangfirma) then
		{
			_return set[count _return,
			["D41_RHS_UH60M",75000]];
		};
		if(license_cop_gangfirma) then
		{
			_return set[count _return,
			["PMC_MH9",28000]];
			_return set[count _return,
			["D41_Heli_Transport_04_covered_F",45000]];
			_return set[count _return,
			["D41_Heli_Transport_03_unarmed_F",75500]];
		};
	};
	
	case "cop_airhq":
	{
		if(__GETC__(life_coplevel) > 2 && !license_cop_gangfirma) then
		{
			_return set[count _return,
			["D41_police_helicopter",28000]];
		};
		if(__GETC__(life_coplevel) > 5 && !license_cop_gangfirma) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",65500]];
		};
		if(license_cop_swat && !license_cop_gangfirma) then
		{
			_return set[count _return,
			["D41_RHS_UH60M",75000]];
		};
		if(license_cop_gangfirma) then
		{
			_return set[count _return,
			["PMC_MH9",28000]];
			_return set[count _return,
			["D41_Heli_Transport_04_covered_F",45000]];
			_return set[count _return,
			["D41_Heli_Transport_03_unarmed_F",75500]];
		};
	};
	
	case "civ_ship":
	{
		_return = [];
        if(life_D41_Karma > -5000)then
        {
            _return set[count _return,["C_Rubberboat",1500]]; 
			_return set[count _return,["C_Boat_Civil_01_F",8000]];  
        };
		if(life_D41_Karma > 5000)then
        {
            _return set[count _return,["D41_Trawler",300000]]; //Trawler
        };
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",1500],
			["C_Boat_Civil_01_police_F",7500],
			["B_Boat_Armed_01_minigun_F",28000],
			["B_SDV_01_F",3750]
		];
	};
	
	case "reb_ship":
	{
		if(license_civ_rebel && life_D41_Karma < -1000) then
		{
			_return set[count _return,["I_Boat_Transport_01_F",3000]]; 
			_return set[count _return,["D41_SDV_01_F",20000]]; 
		};
	};
};

_return;
