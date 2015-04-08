/*
	File: Functions/D41/fn_updateStock.sqf
	Author: Distrikt41 - Dscha

	Description:
	Bestand in DB aktualisieren und Preise anpassen
	Refresh Stock in DB and set new prices
*/
	private["_playercount","_query","_query2","_queryResult","_thread","_thread2","_Empty","_VLow","_Low","_mid","_High","_VHigh","_VKPreis","_EKPreis","_D41_PreisAnpassung"];

	while{true}do
	{
		_playercount = count playableUnits;

		_query = format["SELECT
		D41_Apfel,
		D41_Pfirsich,
		D41_Apfelschnaps,
		D41_Pfirsichschnaps,
		D41_Heroin,
		D41_Oel,
		D41_Cannabis,
		D41_BeefJerky,
		D41_Kokain,
		D41_Diamanten,
		D41_Eisen,
		D41_Kupfer,
		D41_Salz,
		D41_Kohle,
		D41_Glas,
		D41_Apfelsaft,
		D41_Pfirsichsaft,
		D41_Ton,
		D41_Zement,
		D41_WaffenKomponenten,
		D41_Stahl,
		D41_Fahrzeugteile,
		D41_Kerosin,
		D41_Kalkstein,
		D41_Krabben FROM stocksys WHERE ID=1"];

		waitUntil{sleep (random 0.3); !DB_Async_Active};
		_queryResult = [_query,2] call DB_fnc_asyncCall;
		waitUntil{sleep (random 0.3); !DB_Async_Active};
		_queryResult2 = [_query,2] call DB_fnc_asyncCall;

		diag_log format [":::::::::::::::::::::: fn_updateStock - Stock abrufen  Stock: %1", _queryResult];

		//------------------------------ Produkte zuteilen
		D41_StockApfel = _queryResult select 0;
		D41_StockPfirsich = _queryResult select 1;
		D41_StockApfelschnaps = _queryResult select 2;
		D41_StockPfirsichschnaps = _queryResult select 3;
		D41_StockheroinP = _queryResult select 4;
		D41_Stockoilp = _queryResult select 5;
		D41_Stockmarijuana = _queryResult select 6;
		D41_Stockbjerky = _queryResult select 7;
		D41_Stockcocainep = _queryResult select 8;
		D41_Stockdiamondc = _queryResult select 9;
		D41_Stockiron_r = _queryResult select 10;
		D41_Stockcopper_r = _queryResult select 11;
		D41_Stocksalt_r = _queryResult select 12;
		D41_Stockcoal = _queryResult select 13;
		D41_Stockglass = _queryResult select 14;
		D41_StockApfelsaft = _queryResult select 15;
		D41_StockPfirsichsaft = _queryResult select 16;
		D41_StockTon = _queryResult select 17;
		D41_StockZement = _queryResult select 18;
		D41_StockWKomp = _queryResult select 19;
		D41_StockStahl = _queryResult select 20;
		D41_StockFahrzeugteile = _queryResult select 21;
		D41_StockKerosin = _queryResult select 22;
		D41_StockKalkstein = _queryResult select 23;
		D41_StockKrabben = _queryResult select 24;

		//------------------------------ Stock berechnen
		D41_StockApfel = D41_StockApfel - (_playercount * 8);						if(D41_StockApfel < 0)then {D41_StockApfel = 0;};		
		D41_StockPfirsich = D41_StockPfirsich - (_playercount * 8);					if(D41_StockPfirsich < 0)then {D41_StockPfirsich = 0;};
		D41_StockApfelschnaps = D41_StockApfelschnaps - (_playercount * 2);			if(D41_StockApfelschnaps < 0)then {D41_StockApfelschnaps = 0;};
		D41_StockPfirsichschnaps = D41_StockPfirsichschnaps - (_playercount * 2);	if(D41_StockPfirsichschnaps < 0)then {D41_StockPfirsichschnaps = 0;};
		D41_StockheroinP = D41_StockheroinP - (round (_playercount * 1));			if(D41_StockheroinP < 0)then {D41_StockheroinP = 0;};
		D41_Stockoilp = D41_Stockoilp - (round (_playercount * 0.3));				if(D41_Stockoilp < 0)then {D41_Stockoilp = 0;};
		D41_Stockmarijuana = D41_Stockmarijuana - (round (_playercount * 1));		if(D41_Stockmarijuana < 0)then {D41_Stockmarijuana = 0;};
		D41_Stockbjerky = D41_Stockbjerky - (_playercount * 1);						if(D41_Stockbjerky < 0)then {D41_Stockbjerky = 0;};
		D41_Stockcocainep = D41_Stockcocainep - (round (_playercount * 1));			if(D41_Stockcocainep < 0)then {D41_Stockcocainep = 0;};
		D41_Stockdiamondc = D41_Stockdiamondc - (round (_playercount * 0.25));		if(D41_Stockdiamondc < 0)then {D41_Stockdiamondc = 0;};
		D41_Stockiron_r = D41_Stockiron_r - (round (_playercount * 0.30));			if(D41_Stockiron_r < 0)then {D41_Stockiron_r = 0;};
		D41_Stockcopper_r = D41_Stockcopper_r - (round (_playercount * 0.30));		if(D41_Stockcopper_r < 0)then {D41_Stockcopper_r = 0;};
		D41_Stocksalt_r = D41_Stocksalt_r - (_playercount * 2);						if(D41_Stocksalt_r < 0)then {D41_Stocksalt_r = 0;};
		D41_Stockcoal = D41_Stockcoal - (round (_playercount * 1));					if(D41_Stockcoal < 0)then {D41_Stockcoal = 0;};
		D41_Stockglass = D41_Stockglass - (round (_playercount * 0.25));			if(D41_Stockglass < 0)then {D41_Stockglass = 0;};
		D41_StockApfelsaft = D41_StockApfelsaft - (_playercount * 1);				if(D41_StockApfelsaft < 0)then {D41_StockApfelsaft = 0;};
		D41_StockPfirsichsaft = D41_StockPfirsichsaft - (_playercount * 1);			if(D41_StockPfirsichsaft < 0)then {D41_StockPfirsichsaft = 0;};
		D41_StockTon = D41_StockTon - (round (_playercount * 0.25));				if(D41_StockTon < 0)then {D41_StockTon = 0;};
		D41_StockZement = D41_StockZement - (round (_playercount * 0.25));			if(D41_StockZement < 0)then {D41_StockZement = 0;};
		D41_StockWKomp = D41_StockWKomp - (round (_playercount * 1));				if(D41_StockWKomp < 0)then {D41_StockWKomp = 0;};
		D41_StockStahl = D41_StockStahl - (round (_playercount * 0.2));				if(D41_StockStahl < 0)then {D41_StockStahl = 0;};
		D41_StockFahrzeugteile = D41_StockFahrzeugteile - (_playercount * 10);		if(D41_StockFahrzeugteile < 0)then {D41_StockFahrzeugteile = 0;};
		D41_StockKerosin = D41_StockKerosin - (_playercount * 1);					if(D41_StockKerosin < 0)then {D41_StockKerosin = 0;};
		D41_StockKalkstein = D41_StockKalkstein - (round (_playercount * 0.25));	if(D41_StockKalkstein < 0)then {D41_StockKalkstein = 0;};
		D41_StockKrabben = D41_StockKrabben - (round (_playercount * 0.5));			if(D41_StockKrabben < 0)then {D41_StockKrabben = 0;};

		//------------------------------ neuen Stock eintragen
		_query2 = format["UPDATE stocksys SET
		D41_Apfel=%1,
		D41_Pfirsich=%2,
		D41_Apfelschnaps=%3,
		D41_Pfirsichschnaps=%4,
		D41_Heroin=%5,
		D41_Oel=%6,
		D41_Cannabis=%7,
		D41_BeefJerky=%8,
		D41_Kokain=%9,
		D41_Diamanten=%10,
		D41_Eisen=%11,
		D41_Kupfer=%12,
		D41_Salz=%13,
		D41_Kohle=%14,
		D41_Glas=%15,
		D41_Apfelsaft=%16,
		D41_Pfirsichsaft=%17,
		D41_Ton=%18,
		D41_Zement=%19,
		D41_WaffenKomponenten=%20,
		D41_Stahl=%21,
		D41_Fahrzeugteile=%22,
		D41_Kerosin=%23,
		D41_Kalkstein=%24,
		D41_Krabben=%25 WHERE ID=1",
		D41_StockApfel,
		D41_StockPfirsich,
		D41_StockApfelschnaps,
		D41_StockPfirsichschnaps,
		D41_StockheroinP,
		D41_Stockoilp,
		D41_Stockmarijuana,
		D41_Stockbjerky,
		D41_Stockcocainep,
		D41_Stockdiamondc,
		D41_Stockiron_r,
		D41_Stockcopper_r,
		D41_Stocksalt_r,
		D41_Stockcoal,
		D41_Stockglass,
		D41_StockApfelsaft,
		D41_StockPfirsichsaft,
		D41_StockTon,
		D41_StockZement,
		D41_StockWKomp,
		D41_StockStahl,
		D41_StockFahrzeugteile,
		D41_StockKerosin,
		D41_StockKalkstein,
		D41_StockKrabben
		];


		waitUntil {!DB_Async_Active};
		_thread2 = [_query2,false] spawn DB_fnc_asyncCall;
		waitUntil {scriptDone _thread2};

		diag_log format [":::::::::::::::::::::: fn_updateStock - Preisanpassungen gestartet"];
		//Preise aktualisieren
		//Hauptscript
		_D41_PreisAnpassung = 
			{
				_Empty = (_mid/6);
				_VLow = (_mid/4);
				_Low = (_mid/2);
				
				_High = (_mid*1.5);
				_VHigh = (_mid*2);
				_EHigh = (_mid*2.5);

				//Kaufpreis für Spieler
				//Sellprice for player
				
				if(_Type <= _Empty)then
					{
						D41_PCheckK = (_VKPreis*140)
					};
				if(_Type >= _Empty && _Type <= _VLow)then
					{
						D41_PCheckK = (_VKPreis*125)
					};
				if(_Type >= _VLow && _Type <= _Low)then
					{
						D41_PCheckK = (_VKPreis*110)
					};
				if(_Type >= _Low && _Type <= _mid)then
					{
						D41_PCheckK = (_VKPreis*100)
					};
				if(_Type >= _mid && _Type <= _High)then
					{
						D41_PCheckK = (_VKPreis*90)
					};
				if(_Type >= _High && _Type <= _VHigh)then
					{
						D41_PCheckK = (_VKPreis*80)
					};
				if(_Type >= _VHigh)then
					{
						D41_PCheckK = (_VKPreis*75)
					};
				
				//Verkaufspreis für Spieler
				//Sellprice for Player
				
				if(_Type <= _Empty)then
					{
						D41_PCheckV = (_EKPreis*140)
					};
				if(_Type >= _Empty && _Type <= _VLow)then
					{
						D41_PCheckV = (_EKPreis*125)
					};
				if(_Type >= _VLow && _Type <= _Low)then
					{
						D41_PCheckV = (_EKPreis*110)
					};
				if(_Type >= _Low && _Type <= _mid)then
					{
						D41_PCheckV = (_EKPreis*100)
					};
				if(_Type >= _mid && _Type <= _High)then
					{
						D41_PCheckV = (_EKPreis*90)
					};
				if(_Type >= _High && _Type <= _VHigh)then
					{
						D41_PCheckV = (_EKPreis*80)
					};
				if(_Type >= _VHigh && _Type <= _EHigh)then
					{
						D41_PCheckV = (_EKPreis*70)
					};
				if(_Type > _EHigh)then
					{
						D41_PCheckV = (_EKPreis*45)
					};
					
				_queryResult set[_Num,D41_PCheckK];
				_queryResult2 set[_Num,D41_PCheckV];
			};
		
		//Items
		//apple
		_Num = 0; _Type = D41_StockApfel; _VKPreis = (40/100); _EKPreis = (5/100);_mid = 3000; [] call _D41_PreisAnpassung;		
		//peach
		_Num = 1; _Type = D41_StockPfirsich; _VKPreis = (50/100); _EKPreis = (25/100); _mid = 3000; [] call _D41_PreisAnpassung;
		//Apfelschnaps
		_Num = 2;  _Type = D41_StockApfelschnaps; _VKPreis = (200/100); _EKPreis = (165/100); _mid = 2000; [] call _D41_PreisAnpassung;
		//Pfirsichschnaps
		_Num = 3; _Type = D41_StockPfirsichschnaps; _VKPreis = (260/100); _EKPreis = (210/100); _mid = 2000; [] call _D41_PreisAnpassung;
		//heroinp
		_Num = 4; _Type = D41_StockheroinP; _VKPreis = (1050/100); _EKPreis = (850/100); _mid = 1500; [] call _D41_PreisAnpassung;
		//oilp
		_Num = 5; _Type = D41_Stockoilp; _VKPreis = (1700/100); _EKPreis = (1300/100); _mid = 400; [] call _D41_PreisAnpassung;
		//marijuana
		_Num = 6; _Type = D41_Stockmarijuana; _VKPreis = (425/100); _EKPreis = (350/100); _mid = 2000; [] call _D41_PreisAnpassung;
		//bjerky
		_Num = 7; _Type = D41_Stockbjerky; _VKPreis = (100/100); _EKPreis = (25/100); _mid = 3000; [] call _D41_PreisAnpassung;
		//cocainep
		_Num = 8; _Type = D41_Stockcocainep; _VKPreis = (790/100); _EKPreis = (650/100); _mid = 1500; [] call _D41_PreisAnpassung;
		//diamondc
		_Num = 9; _Type = D41_Stockdiamondc; _VKPreis = (2000/100); _EKPreis = (1600/100); _mid = 300; [] call _D41_PreisAnpassung;
		//iron_r
		_Num = 10; _Type = D41_Stockiron_r; _VKPreis = (900/100); _EKPreis = (700/100); _mid = 500; [] call _D41_PreisAnpassung;
		//copper_r
		_Num = 11; _Type = D41_Stockcopper_r; _VKPreis = (375/100); _EKPreis = (300/100); _mid = 500; [] call _D41_PreisAnpassung;
		//salt_r
		_Num = 12; _Type = D41_Stocksalt_r; _VKPreis = (115/100); _EKPreis = (95/100); _mid = 1600; [] call _D41_PreisAnpassung;
		//coal
		_Num = 13; _Type = D41_Stockcoal; _VKPreis = (380/100); _EKPreis = (300/100); _mid = 700; [] call _D41_PreisAnpassung;
		//glass
		_Num = 14; _Type = D41_Stockglass; _VKPreis = (275/100); _EKPreis = (225/100); _mid = 750; [] call _D41_PreisAnpassung;
		//Apfelsaft
		_Num = 15; _Type = D41_StockApfelsaft; _VKPreis = (135/100); _EKPreis = (110/100); _mid = 1000; [] call _D41_PreisAnpassung;
		//Pfirsichsaft
		_Num = 16; _Type = D41_StockPfirsichsaft; _VKPreis = (190/100); _EKPreis = (150/100); _mid = 1000; [] call _D41_PreisAnpassung;
		//Ton
		_Num = 17; _Type = D41_StockTon; _VKPreis = (275/100); _EKPreis = (225/100); _mid = 750; [] call _D41_PreisAnpassung;
		//Zement
		_Num = 18; _Type = D41_StockZement; _VKPreis = (3450/100); _EKPreis = (2500/100); _mid = 180; [] call _D41_PreisAnpassung;
		//WKomp
		_Num = 19; _Type = D41_StockWKomp; _VKPreis = (1000/100); _EKPreis = (750/100); _mid = 250; [] call _D41_PreisAnpassung;
		//Stahl
		_Num = 20; _Type = D41_StockStahl; _VKPreis = (19000/100); _EKPreis = (14000/100); _mid = 75; [] call _D41_PreisAnpassung;
		//Fahrzeugteile - AUSSTEHEND FÜR SPÄTERE BEARBEITUNG
		_Num = 21; _Type = D41_StockFahrzeugteile; _VKPreis = (1400/100); _EKPreis = (1100/100); _mid = 2000; [] call _D41_PreisAnpassung;
		//Kerosin
		_Num = 22; _Type = D41_StockKerosin; _VKPreis = (7900/100); _EKPreis = (6000/100); _mid = 100; [] call _D41_PreisAnpassung;
		//Kalkstein
		_Num = 23; _Type = D41_StockKalkstein; _VKPreis = (315/100); _EKPreis = (250/100); _mid = 800; [] call _D41_PreisAnpassung;
		//Krabben
		_Num = 24; _Type = D41_StockKrabben; _VKPreis = (2900/100); _EKPreis = (1850/100); _mid = 1300; [] call _D41_PreisAnpassung;


		diag_log format [":::::::::::::::::::::: fn_updateStock - Preisänderungen beendet K_Preise: %1", _queryResult];
		diag_log format [":::::::::::::::::::::: fn_updateStock - Preisänderungen beendet V_Preise: %1", _queryResult2];
		D41_KPreisliste = _queryResult;
		D41_VPreisliste = _queryResult2;
		publicVariable "D41_KPreisliste";
		publicVariable "D41_VPreisliste";
		
		//System Nachricht an alle Spieler
		[[0,"Lagerbestand aller Waren aktualisiert"],"life_fnc_broadcast",true,false] call life_fnc_MP;
		sleep 1200;
	};