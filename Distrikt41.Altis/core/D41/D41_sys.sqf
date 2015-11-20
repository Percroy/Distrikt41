#include <macro.h>

//::::::::::::  ::::::::::::\\
//	Filename: D41/D41_sys.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Lädt alle relevanten Daten und noch ein paar andere Dinge für die Altis-Life Distrikt41 Version
//::::::::::::  ::::::::::::\\


//:::::::::::: Distrikt41 Settings ::::::::::::\\

life_maskiert = 0; 			//Ist maskiert? 1 = Ja // 0 = nope
life_fakeid = 0;
life_mauer = ObjNull;		//Platzierbare Begrenzung für Cops
life_strahler = ObjNull;	//Platzierbare Strahler für Cops und ADAC
life_leitkegel = ObjNull;	//Platzierbare Leitkegel für ADAC
life_Blitzer = ObjNull;		//Platzierbare Blitzer für Cops
life_Schranke = ObjNull;	//Platzierbare Schranke für Cops
D41_IsBuying = false;		//Bereits am kaufen? 0 = Nein ||1 = Ja
D41_WaffenProdInUse = false;//Produziert gerade Waffen?
D41_BenzinFuellen = 0;		//Im Tankstellenbereich? 0 = Nein || 1 = Ja
D41_geknueppelt = false;	//wurde niedergeschlagen?
D41_GaragenVerkauf = 0;		//im verkauf?
D41_KnastZ = 0;				//Macht gerade was am Knastzaun?
SzoneXW = [safezoneX + safezoneW - 0.89,0.50];	//was tolles
SzoneYH = [safezoneY + safezoneH - 1.28,0.7];	//nochwas tolles
D41_Tage = 0;									//wann ist die Periode des Servers wieder fällig? (Miete - muß gesetzt sein)
life_D41_Karma = 0;								//... is a bitch! (Karma-sys - muß gesetzt sein)
D41_MieteAbfrage = 0;							//macht Mietabfrage/zahlt gerade?
D41_Tankt = false;								//Tankt gerade? false = Nein || True = Ja
D41_BenzinPreis = 15;							//BenzinPreis-Standard
D41_KerosinPreis = 15;							//BenzinPreis-Standard
D41_TrawlerHorn = false;						//Horn blasen? höhö
D41_Counter = 0;								//Counter halt, nä?
D41_BlitzerCounter = 0;							//Wieviele Blitzer aufgestellt?
D41_WandeltUm = false;							//Verarbeitet gerade etwas?
D41_LagertEin = 0;								//Machta wat oda machta nix? 0 = nope || 1 = Yep
D41_EarPlugInUse = false;						//Earplugs gerade in benutzung?
D41_GeGummigeschosst = false;					//wurde von Gummigeschoss getroffen?
D41_InUse = 0;									//Verhindern vom spammen der ShortCut Meldungen
D41_MedReqDone = false;							//Medic request gesendet
D41_ToolKitUsed = 0;							//Wie oft ein Toolkit genutzt?
D41_MedKitUsed = 0;								//Wie oft ein Medikit genutzt?
D41_RespawnTimer = true;						//Respawn Timer aktiv?
D41_LastMsg = parseText format ["LEER","Leer"];
D41_isWpnProdShop = false;
D41_FakeName = "";

//:::::::::::: Distrikt41 Items, welche nicht gespeichert werden dürfen / Tanklaster Array ::::::::::::\\

D41_DontSaveThat = ["D41_Blutkonserven","D41_Pizzas","D41_Teddybaer","D41_Gummibaum","D41_HeleneFischerCD","D41_Bankbauplan","D41_FalscherAusweis","D41_Faultierhoden","D41_Oel","D41_OelRoh","D41_Heroin","D41_HeroinRoh",
					"D41_Cannabis","D41_CannabisRoh","D41_Salema","D41_Ornate","D41_Mackrele","D41_Tunfisch","D41_Mullet","D41_Katzenhai","D41_Schildkroete","D41_SchildkroetenSuppe","D41_Kupfer","D41_KupferRoh",
					"D41_Eisen","D41_EisenRoh","D41_Kohle","D41_KohleRoh","D41_Glas","D41_Sand","D41_Salz","D41_SalzRoh","D41_Diamanten","D41_DiamantenRoh","D41_Kokain","D41_KokainRoh","D41_GoldBarren","D41_Sprengladung",
					"D41_LagerkisteKlein","D41_LagerkisteGross","D41_LagerkisteLagerhaus","D41_Bruchstein","D41_Kalkstein","D41_Ton","D41_TonRoh","D41_Zement","D41_WaffenKomponenten","D41_Stahl","D41_Krabben",
					"D41_Fahrzeugteile","D41_Kerosin","D41_Meth1","D41_Meth2","D41_Meth3","D41_Meth4","D41_Meth","D41_Diamantschmuck","D41_Schmuckteile"];
D41_TanklasterItems = ["D41_Oel","D41_OelRoh","D41_Kerosin","D41_Salz","D41_SalzRoh","D41_Meth1","D41_Meth2"];
D41_TanklasterListe = ["D41_C_Van_01_fuel_F","D41_I_G_Van_01_fuel_F","D41_Civ_Truck_02_fuel2_weiss","D41_Civ_Truck_02_fuel2_blau","D41_Civ_Truck_02_fuel2_orange","D41_Civ_Truck_02_fuel2_Fass","D41_Ural_Fuel_MSV_01","D41_O_Truck_03_fuel_F","D41_B_Truck_01_fuel_F","D41_B_Truck_01_fuel_grau","D41_Civ_Truck_02_fuel2_IHV","D41_B_Truck_01_fuel_hb","D41_B_Truck_01_fuel_s","D41_Heli_Transport_04_fuel_Blaugrau","D41_Heli_Transport_04_fuel_grey","D41_C_Van_01_fuel_white","D41_C_Van_01_fuel_red","D41_C_Van_01_fuel_black","D41_B_Truck_01_fuel_bg"];

//:::::::::::: Distrikt41 Drogen/Alkohol ::::::::::::\\

life_DrogenKonsum = 0;		//setzt sich gerade n Schuß?
life_Junkie = 0;			//Drogenwert
life_AlkKonsum = 0;			//gerade am saufen?
life_Alkoholiker = 0;		//Alkoholpegel

//:::::::::::: Distrikt41 Maskiert - Itemliste ::::::::::::\\

D41_goggles_Array = ["rhs_scarf","G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Bandanna_blk","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan","G_Bandanna_shades","G_Bandanna_beast"];
D41_uniform_Array = ["U_O_GhillieSuit","U_B_GhillieSuit","U_I_GhillieSuit","U_I_FullGhillie_ard","U_O_FullGhillie_ard","U_B_FullGhillie_ard","U_I_FullGhillie_lsh","U_O_FullGhillie_lsh","U_B_FullGhillie_lsh","U_I_FullGhillie_sard","U_O_FullGhillie_sard","U_B_FullGhillie_sard"];
D41_headgear_Array = ["H_Shemag_olive","H_Shemag_khk","H_Shemag_tan","H_Shemag_olive_hs","H_ShemagOpen_khk","LOP_H_Shemag_IT","H_ShemagOpen_tan","rhs_6b27m_ess_bala","LOP_H_Turban","H_PilotHelmetHeli_B","H_CrewHelmetHeli_B"];
D41_hmd_Array = ["NVGoggles_mas_mask2_t","NVGoggles_mas_mask3","NVGoggles_mas_mask","NVGoggles_mas_mask_b","NVGoggles_mas_mask_t"];

// Falsche Namen 
D41_Fake_ID_Array = ["Hans Peter", "Riddley Jones", "John Doe", "Klaus Schmitt", "Ralf Schmitz", "Patrick Star", "Daniel Dollinger", "Tim Stuhlsatz", "Ugly Peterson", "Elrond McBong", "Ben Stifler", "Arnold Schwarzwaldbecher", "Chuck Norris", "Stan Lee", "Olaf Gerold", "John Richmond", "Richard Nelz", "Richard Batsbak", "Gerrie van Boven", "Rikkert Biemans", "Barrie Butser", "Robbie Schuurmans"];

life_fnc_D41_Anker =
	{
		if((vehicle player isKindOf "D41_Trawler") && ((speed vehicle player) < 4) && ((speed vehicle player) > -4) && !((speed vehicle player) == 0)) then {(vehicle player) setVelocity [0, 0, 0];};
	};
	
life_fnc_D41_KnastRep =
	{
		D41_KnastZaun setDammage 0;
	};
	
life_fnc_D41_GetMagName =
	{
		private["_type"];
		_type = _this select 0;
		getText(configFile >> "CfgMagazines" >> _type >> "displayName");
	};
	
life_fnc_D41_GetMagPic =
	{
		private["_type"];
		_type = _this select 0;
		getText(configFile >> "CfgMagazines" >> _type >> "picture");
	};
	
life_fnc_D41_GetWpnName =
	{
		private["_type"];
		_type = _this select 0;
		getText(configFile >> "CfgWeapons" >> _type >> "displayName");
	};
	
life_fnc_D41_GetWpnPic =
	{
		private["_type"];
		_type = _this select 0;
		getText(configFile >> "CfgWeapons" >> _type >> "picture");
	};
	
life_fnc_D41_GetVehName =
	{
		private["_type"];
		_type = _this select 0;
		getText(configFile >> "CfgVehicles" >> _type >> "displayName");
	};
	
life_fnc_D41_GiveMoney =
	{
		private["_geld","_unit","_name","_life_maskiert"];
		createDialog "money";
		waitUntil {!isNull (findDisplay 4814)};
		_geld = format["%1",D41_Geld];
		_unit = cursorTarget;
		_name = format["%1",name _Unit];
		_life_maskiert = false;
		if((goggles _unit) in D41_goggles_Array) then {_life_maskiert = true};
		if((uniform _unit) in D41_uniform_Array) then {_life_maskiert = true};
		if((headgear _unit) in D41_headgear_Array) then {_life_maskiert = true};
		if((hmd _unit) in D41_hmd_Array) then {_life_maskiert = true};
		if(_life_maskiert)then{_name = localize "STR_D41_MaskiertePerson";};
		_GeldAnzeige = [D41_Geld] call life_fnc_numberText;
		ctrlSetText [2015, _GeldAnzeige];
		ctrlSetText [4815, _name];
	};
	
life_fnc_D41_RepScheiben =
	{
		private["_vehicle","_Scheiben"];
		_vehicle = param [0, ObjNull, [ObjNull]];
		if((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship")) exitWith {};
		_Scheiben = ["HitGlass1", "HitGlass2", "HitGlass3", "HitGlass4", "HitGlass5", "HitGlass6", "HitGlass7", "HitGlass8", "HitGlass9", "HitGlass10", "HitRGlass", "HitLGlass"];
		{
			if((_vehicle isKindOf "SUV_01_base_F") && ( _x == "HitGlass3"))exitWith{_vehicle setHitPointDamage ["HitGlass3", 1]};
			_vehicle setHitPointDamage [_x, 0];
		}forEach _Scheiben;
	};


life_fnc_D41_TeilHeilung =
{
	_Part = _this select 0;
	_DmgMod = _this select 1;
	
	player setHitPointDamage [_Part, _DmgMod];
	
	_DmgKopf = player getHitPointDamage "HitHead";
	_DmgHand = player getHitPointDamage "HitHands";
	_DmgTorso = player getHitPointDamage "HitBody";
	_DmgBein = player getHitPointDamage "HitLegs";
	
	_MainDmg = _DmgKopf + _DmgHand + _DmgTorso + _DmgBein;
	_MainDmg = (_MainDmg / 4);	
	
	player setDammage _MainDmg;
	player setHitPointDamage ["HitHead", _DmgKopf];
	player setHitPointDamage ["HitHands", _DmgHand];
	player setHitPointDamage ["HitBody", _DmgTorso];
	player setHitPointDamage ["HitLegs", _DmgBein];
};


life_fnc_D41_TeilHeilungNahrung =
{
	//Bsp.:
	//[0.2] spawn life_fnc_D41_TeilHeilungNahrung;
	//Schaden wird auf alle Körperteile gleichmäßig verteilt
	//0.2 	= +5% Heilung (0.2 / 4 = 0.05)
	//-0.2 	= -5% Heilung (Schaden bekommen)
	
	_Mod = _this select 0;
	
	_DmgMod = (_Mod / 4);
		
	_DmgKopf = ((player getHitPointDamage "HitHead") - _DmgMod);
	_DmgHand = ((player getHitPointDamage "HitHands") - _DmgMod);
	_DmgTorso = ((player getHitPointDamage "HitBody") - _DmgMod);
	_DmgBein = ((player getHitPointDamage "HitLegs") - _DmgMod);
	
	if(_DmgKopf < 0.25)then{if((player getHitPointDamage "HitHead") < 0.25)then{_DmgKopf = (player getHitPointDamage "HitHead")}else{_DmgKopf = 0.25};};
	if(_DmgHand < 0.25)then{if((player getHitPointDamage "HitHands") < 0.25)then{_DmgKopf = (player getHitPointDamage "HitHands")}else{_DmgKopf = 0.25};};
	if(_DmgTorso < 0.25)then{if((player getHitPointDamage "HitBody") < 0.25)then{_DmgKopf = (player getHitPointDamage "HitBody")}else{_DmgKopf = 0.25};};
	if(_DmgBein < 0.25)then{if((player getHitPointDamage "HitLegs") < 0.25)then{_DmgKopf = (player getHitPointDamage "HitLegs")}else{_DmgKopf = 0.25};};
	
	_MainDmg = _DmgKopf + _DmgHand + _DmgTorso + _DmgBein;
	_MainDmg = (_MainDmg / 4);	
	
	player setDammage _MainDmg;
	player setHitPointDamage ["HitHead", _DmgKopf];
	player setHitPointDamage ["HitHands", _DmgHand];
	player setHitPointDamage ["HitBody", _DmgTorso];
	player setHitPointDamage ["HitLegs", _DmgBein];
};

life_fnc_D41_MedicProgressBar =
	{
		_Part = _this select 0;
		_DmgMod = _this select 1;
		
		disableSerialization;
		_title = localize "STR_Medic_Verarzten";
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
		_titleText ctrlSetText format["%2 (1%1)...","%",_title];
		_progressBar progressSetPosition 0.01;
		_cP = 0.01;
		_cpRate = 0.1;
		
		life_action_inUse = true;
		life_interrupted = false;
		[] spawn life_fnc_D41_AnimLoop;
		while {true} do
		{
			sleep 1;
			if(isNull _ui) then {
				5 cutRsc ["life_progress","PLAIN"];
				_ui = uiNamespace getVariable "life_progress";
				_progressBar = _ui displayCtrl 38201;
				_titleText = _ui displayCtrl 38202;
			};
			_cP = _cP + _cpRate;
			_progressBar progressSetPosition _cP;
			_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
			if(_cP >= 1 OR !alive player) exitWith {};
			if(life_istazed) exitWith {};
			if((player getVariable["restrained",false])) exitWith {};
			if(life_interrupted) exitWith {};
		};
		
		//Kill the UI display and check for various states
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
		if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
		if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
		
		[_Part, _DmgMod] spawn life_fnc_D41_TeilHeilung;
		
		D41_MedKitUsed = D41_MedKitUsed +1;
		if(D41_MedKitUsed >= 5)then{player removeMagazine "D41_MediKit"; D41_MedKitUsed = 0;};
		
		life_action_inUse = false;
	};
	
life_fnc_D41_MedicProgressBarRemote =
	{
		closeDialog 0;
		_Part = _this select 0;
		_DmgMod = _this select 1;
		_Opfer = _this select 2;
		
		disableSerialization;
		_title = localize "STR_Medic_Verarzten";
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
		_titleText ctrlSetText format["%2 (1%1)...","%",_title];
		_progressBar progressSetPosition 0.01;
		_cP = 0.01;
		_cpRate = 0.1;
		
		life_action_inUse = true;
		life_interrupted = false;
		[] spawn life_fnc_D41_AnimLoop;
		
		while {true} do
		{
			sleep 1;
			if(isNull _ui) then {
				5 cutRsc ["life_progress","PLAIN"];
				_ui = uiNamespace getVariable "life_progress";
				_progressBar = _ui displayCtrl 38201;
				_titleText = _ui displayCtrl 38202;
			};
			_cP = _cP + _cpRate;
			_progressBar progressSetPosition _cP;
			_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
			if(_cP >= 1 OR !alive player) exitWith {};
			if(life_istazed) exitWith {};
			if((player getVariable["restrained",false])) exitWith {};
			if(life_interrupted) exitWith {};
			if((speed _Opfer) > 1)exitWith {life_interrupted = true};
		};
		
		//Kill the UI display and check for various states
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
		if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
		if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
		
		[[_Part,_DmgMod,isMedic],'life_fnc_D41_MedicSysExec',_Opfer,false] spawn life_fnc_MP;
		if(isMedic)then{D41_MedKitUsed = 0};
		D41_MedKitUsed = D41_MedKitUsed +1;
		if(D41_MedKitUsed >= 5)then{player removeMagazine "D41_MediKit"; D41_MedKitUsed = 0;};
		
		life_action_inUse = false;
	};
	
life_fnc_D41_GetGangBaseName =
{
	D41_BaseNameCheck = "none";
	if(license_civ_base01)exitWith{D41_BaseNameCheck = "license_civ_base01";};
	if(license_civ_base02)exitWith{D41_BaseNameCheck = "license_civ_base02";};
	if(license_civ_base03)exitWith{D41_BaseNameCheck = "license_civ_base03";};
	if(license_civ_base04)exitWith{D41_BaseNameCheck = "license_civ_base04";};
	if(license_civ_base05)exitWith{D41_BaseNameCheck = "license_civ_base05";};
	if(license_civ_base06)exitWith{D41_BaseNameCheck = "license_civ_base06";};
};


life_fnc_D41_CTgtHandyCheck =
{
	_D41_HandyCheck = false;
	{if(_x isKindOf ["ItemRadio", configFile >> "CfgWeapons"])then	{_D41_HandyCheck = true;};}forEach assignedItems cursorTarget;
	{if(_x isKindOf ["ItemRadio", configFile >> "CfgWeapons"])then	{_D41_HandyCheck = true;};}forEach Items cursorTarget;
	_D41_HandyCheck
};
life_fnc_D41_PlyrHandyCheck =
{
	_D41_HandyCheck = false;
	{if(_x isKindOf ["ItemRadio", configFile >> "CfgWeapons"])then	{_D41_HandyCheck = true;};}forEach assignedItems player;
	_D41_HandyCheck
};
	
//:::::::::::: Distrikt41 WaffenProd ::::::::::::\\

life_D41_weapon_shop_array =
[
	["arifle_sdar_F",2],
	["hgun_P07_snds_F",2],
	["hgun_P07_F",2],
	["ItemGPS",2],
	["D41_ToolKit",2],
	["D41_MediKit",2],
	["Medikit",2],
	["NVGoggles",2],
	["16Rnd_9x21_Mag",2],
	["20Rnd_556x45_UW_mag",2],
	["ItemMap",2],
	["ItemCompass",2],
	["hgun_Rook40_F",2],
	["arifle_Katiba_F",2],
	["30Rnd_556x45_Stanag",2],
	["20Rnd_762x51_Mag",2],
	["30Rnd_65x39_caseless_green",2],
	["DemoCharge_Remote_Mag",2],
	["SLAMDirectionalMine_Wire_Mag",2],
	["optic_ACO_grn",2],
	["acc_flashlight",2],
	["srifle_EBR_F",2],
	["arifle_TRG21_F",2],
	["optic_MRCO",2],
	["optic_Aco",2],
	["arifle_MX_F",2],
	["arifle_MXC_F",2],
	["arifle_MXM_F",2],
	["MineDetector",2],
	["optic_Holosight",2],
	["acc_pointer_IR",2],
	["arifle_TRG20_F",2],
	["SMG_01_F",2],
	["arifle_Mk20C_F",2],
	["30Rnd_45ACP_Mag_SMG_01",2],
	["30Rnd_9x21_Mag",2]
];
__CONST__(life_D41_weapon_shop_array,life_D41_weapon_shop_array);
