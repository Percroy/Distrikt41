/*
	File: Functions/D41/fn_updateStock.sqf
	Author: Distrikt41 - Dscha

	Description:
	Bestand in DB aktualisieren und Preise anpassen
	Refresh Stock in DB and set new prices
*/
private["_NeedInit","_playercount","_query","_query2","_queryResult","_thread","_thread2","_Empty","_VLow","_Low","_mid","_High","_VHigh","_VKPreis","_EKPreis","_D41_PreisAnpassung"];
_NeedInit = true;
while{true}do
{
	//Testweise eingebaut, damit der Stock sich über Nacht (komplett leerem Server) etwas leert.
	_playercount = (5 + (count playableUnits));
	
	//waitUntil{sleep (random 0.3); !DB_Async_Active};
	_queryResult = ["updateStock",2] call DB_fnc_asyncCall;
	//waitUntil{sleep (random 0.3); !DB_Async_Active};
	_queryResult2 = ["updateStock",2] call DB_fnc_asyncCall;
	
	if(_NeedInit)then
	{
		_NeedInit = false;
		D41_InitBestandsListe = [];
		{
			D41_InitBestandsListe pushback _x;
		}forEach _queryResult;
	};
	
	diag_log format ["::::::::::::: fn_updateStock - Stock abrufen  _queryResult:	%1", _queryResult];
	diag_log format ["::::::::::::: fn_updateStock - D41_InitBestandsListe: 		%1", D41_InitBestandsListe];
	
	
	//------------------------------ Produkte zuteilen
	_D41_StockApfel = 			_queryResult select 0;
	_D41_StockPfirsich =		_queryResult select 1;
	_D41_StockApfelschnaps =	_queryResult select 2;
	_D41_StockPfirsichschnaps =	_queryResult select 3;
	_D41_StockheroinP =			_queryResult select 4;
	_D41_Stockoilp =			_queryResult select 5;
	_D41_Stockmarijuana =		_queryResult select 6;
	_D41_Stockbjerky =			_queryResult select 7;
	_D41_Stockcocainep =		_queryResult select 8;
	_D41_Stockdiamondc =		_queryResult select 9;
	_D41_Stockiron_r =			_queryResult select 10;
	_D41_Stockcopper_r =		_queryResult select 11;
	_D41_Stocksalt_r =			_queryResult select 12;
	_D41_Stockcoal =			_queryResult select 13;
	_D41_Stockglass =			_queryResult select 14;
	_D41_StockApfelsaft =		_queryResult select 15;
	_D41_StockPfirsichsaft =	_queryResult select 16;
	_D41_StockTon =				_queryResult select 17;
	_D41_StockZement =			_queryResult select 18;
	_D41_StockWKomp =			_queryResult select 19;
	_D41_StockStahl =			_queryResult select 20;
	_D41_StockFahrzeugteile =	_queryResult select 21;
	_D41_StockKerosin =			_queryResult select 22;
	_D41_StockKalkstein =		_queryResult select 23;
	_D41_StockKrabben =			_queryResult select 24;
	_D41_StockDosenFisch =		_queryResult select 25;
	
	
	
	
	//------------------------------ Stock berechnen
	_D41_StockApfel = _D41_StockApfel - (_playercount * 6);							if(_D41_StockApfel < 0)then {_D41_StockApfel = 0;};		
	_D41_StockPfirsich = _D41_StockPfirsich - (_playercount * 6);					if(_D41_StockPfirsich < 0)then {_D41_StockPfirsich = 0;};
	_D41_StockApfelschnaps = _D41_StockApfelschnaps - (_playercount * 3);			if(_D41_StockApfelschnaps < 0)then {_D41_StockApfelschnaps = 0;};
	_D41_StockPfirsichschnaps = _D41_StockPfirsichschnaps - (_playercount * 3);		if(_D41_StockPfirsichschnaps < 0)then {_D41_StockPfirsichschnaps = 0;};
	_D41_StockheroinP = _D41_StockheroinP - (round (_playercount * 1));				if(_D41_StockheroinP < 0)then {_D41_StockheroinP = 0;};
	_D41_Stockoilp = _D41_Stockoilp - (round (_playercount * 0.3));					if(_D41_Stockoilp < 0)then {_D41_Stockoilp = 0;};
	_D41_Stockmarijuana = _D41_Stockmarijuana - (round (_playercount * 1));			if(_D41_Stockmarijuana < 0)then {_D41_Stockmarijuana = 0;};
	_D41_Stockbjerky = _D41_Stockbjerky - (_playercount * 1);						if(_D41_Stockbjerky < 0)then {_D41_Stockbjerky = 0;};
	_D41_Stockcocainep = _D41_Stockcocainep - (round (_playercount * 1));			if(_D41_Stockcocainep < 0)then {_D41_Stockcocainep = 0;};
	_D41_Stockdiamondc = _D41_Stockdiamondc - (round (_playercount * 0.25));		if(_D41_Stockdiamondc < 0)then {_D41_Stockdiamondc = 0;};
	_D41_Stockiron_r = _D41_Stockiron_r - (round (_playercount * 0.30));			if(_D41_Stockiron_r < 0)then {_D41_Stockiron_r = 0;};
	_D41_Stockcopper_r = _D41_Stockcopper_r - (round (_playercount * 0.30));		if(_D41_Stockcopper_r < 0)then {_D41_Stockcopper_r = 0;};
	_D41_Stocksalt_r = _D41_Stocksalt_r - (_playercount * 2);						if(_D41_Stocksalt_r < 0)then {_D41_Stocksalt_r = 0;};
	_D41_Stockcoal = _D41_Stockcoal - (round (_playercount * 1));					if(_D41_Stockcoal < 0)then {_D41_Stockcoal = 0;};
	_D41_Stockglass = _D41_Stockglass - (round (_playercount * 0.25));				if(_D41_Stockglass < 0)then {_D41_Stockglass = 0;};
	_D41_StockApfelsaft = _D41_StockApfelsaft - (_playercount * 2);					if(_D41_StockApfelsaft < 0)then {_D41_StockApfelsaft = 0;};
	_D41_StockPfirsichsaft = _D41_StockPfirsichsaft - (_playercount * 2);			if(_D41_StockPfirsichsaft < 0)then {_D41_StockPfirsichsaft = 0;};
	_D41_StockTon = _D41_StockTon - (round (_playercount * 0.25));					if(_D41_StockTon < 0)then {_D41_StockTon = 0;};
	_D41_StockZement = _D41_StockZement - (round (_playercount * 0.25));			if(_D41_StockZement < 0)then {_D41_StockZement = 0;};
	_D41_StockWKomp = _D41_StockWKomp - (round (_playercount * 1));					if(_D41_StockWKomp < 0)then {_D41_StockWKomp = 0;};
	_D41_StockStahl = _D41_StockStahl - (round (_playercount * 0.2));				if(_D41_StockStahl < 0)then {_D41_StockStahl = 0;};
	_D41_StockFahrzeugteile = _D41_StockFahrzeugteile - (_playercount * 10);		if(_D41_StockFahrzeugteile < 0)then {_D41_StockFahrzeugteile = 0;};
	_D41_StockKerosin = _D41_StockKerosin - (_playercount * 1);						if(_D41_StockKerosin < 0)then {_D41_StockKerosin = 0;};
	_D41_StockKalkstein = _D41_StockKalkstein - (round (_playercount * 0.25));		if(_D41_StockKalkstein < 0)then {_D41_StockKalkstein = 0;};
	_D41_StockKrabben = _D41_StockKrabben - (round (_playercount * 1));				if(_D41_StockKrabben < 0)then {_D41_StockKrabben = 0;};
	_D41_StockDosenFisch = _D41_StockDosenFisch - (round (_playercount * 1));		if(_D41_StockDosenFisch < 0)then {_D41_StockDosenFisch = 0;};
	
	//------------------------------ neuen Stock eintragen
	
	_query2 = "updateStock+2"
		+ ":" + str(_D41_StockApfel) + ":" + str(_D41_StockPfirsich) + ":" +str(_D41_StockApfelschnaps) + ":" + str(_D41_StockPfirsichschnaps)
		+ ":" + str(_D41_StockheroinP) + ":" + str(_D41_Stockoilp) + ":" +str(_D41_Stockmarijuana) + ":" + str(_D41_Stockbjerky)
		+ ":" + str(_D41_Stockcocainep) + ":" + str(_D41_Stockdiamondc) + ":" +str(_D41_Stockiron_r) + ":" + str(_D41_Stockcopper_r)
		+ ":" + str(_D41_Stocksalt_r) + ":" + str(_D41_Stockcoal) + ":" +str(_D41_Stockglass) + ":" + str(_D41_StockApfelsaft)
		+ ":" + str(_D41_StockPfirsichsaft) + ":" + str(_D41_StockTon) + ":" +str(_D41_StockZement) + ":" + str(_D41_StockWKomp)
		+ ":" + str(_D41_StockStahl) + ":" + str(_D41_StockFahrzeugteile) + ":" +str(_D41_StockKerosin) + ":" + str(_D41_StockKalkstein)
		+ ":" + str(_D41_StockKrabben) + ":" + str(_D41_StockDosenFisch) ;
	
	//waitUntil{!DB_Async_Active};
	[_query2] spawn DB_fnc_asyncCall;
	
	diag_log format ["::::::::::::: fn_updateStock - Stock gesetzt _queryResult: %1", _queryResult];
	diag_log format ["::::::::::::: fn_updateStock - Stock gesetzt _queryResult2: %1", _queryResult2];
	diag_log format ["::::::::::::: fn_updateStock - Preisanpassungen gestartet"];
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
			//Buyprice for player
			_D41_PCheckK = 0;
			_D41_PCheckV = 0;
			
			switch(true)do
			{
				case(_Type <= _Empty): 					{_D41_PCheckK = (_VKPreis*140)};
				case(_Type >= _Empty && _Type <= _VLow):{_D41_PCheckK = (_VKPreis*125)};
				case(_Type >= _VLow && _Type <= _Low):	{_D41_PCheckK = (_VKPreis*110)};
				case(_Type >= _Low && _Type <= _mid):	{_D41_PCheckK = (_VKPreis*100)};
				case(_Type >= _mid && _Type <= _High):	{_D41_PCheckK = (_VKPreis*90)};
				case(_Type >= _High && _Type <= _VHigh):{_D41_PCheckK = (_VKPreis*80)};
				case(_Type >= _VHigh):					{_D41_PCheckK = (_VKPreis*75)};
				default{_D41_PCheckK = 0;};
			};
			
			//Verkaufspreis für Spieler
			//Sellprice for Player
			
			switch(true)do
			{
				case(_Type <= _Empty):					{_D41_PCheckV = (_EKPreis*140)};
				case(_Type >= _Empty && _Type <= _VLow):{_D41_PCheckV = (_EKPreis*125)};
				case(_Type >= _VLow && _Type <= _Low): 	{_D41_PCheckV = (_EKPreis*110)};
				case(_Type >= _Low && _Type <= _mid): 	{_D41_PCheckV = (_EKPreis*100)};
				case(_Type >= _mid && _Type <= _High):	{_D41_PCheckV = (_EKPreis*90)};
				case(_Type >= _High && _Type <= _VHigh):{_D41_PCheckV = (_EKPreis*80)};
				case(_Type >= _VHigh && _Type <= _EHigh):{_D41_PCheckV = (_EKPreis*70)};
				case(_Type > _EHigh):					{_D41_PCheckV = (_EKPreis*45)};
				default{_D41_PCheckV = 0;};
			};
			
			_queryResult set[_Num,_D41_PCheckK];
			_queryResult2 set[_Num,_D41_PCheckV];
		};
	
	//Items
	
		//apple
		_Num = 0; _Type = _D41_StockApfel;				_VKPreis = (40/100);	_EKPreis = (5/100);		_mid = 3000;	[] call _D41_PreisAnpassung;		
		//peach
		_Num = 1; _Type = _D41_StockPfirsich;			_VKPreis = (50/100);	_EKPreis = (25/100);	_mid = 3000;	[] call _D41_PreisAnpassung;
		//Apfelschnaps
		_Num = 2;  _Type = _D41_StockApfelschnaps;		_VKPreis = (200/100);	_EKPreis = (165/100);	_mid = 2000;	[] call _D41_PreisAnpassung;
		//Pfirsichschnaps
		_Num = 3; _Type = _D41_StockPfirsichschnaps;	_VKPreis = (260/100);	_EKPreis = (210/100);	_mid = 2000;	[] call _D41_PreisAnpassung;
		//heroinp
		_Num = 4; _Type = _D41_StockheroinP;			_VKPreis = (1150/100);	_EKPreis = (1100/100);	_mid = 1500;	[] call _D41_PreisAnpassung;
		//oilp
		_Num = 5; _Type = _D41_Stockoilp;				_VKPreis = (1700/100);	_EKPreis = (1300/100);	_mid = 400;		[] call _D41_PreisAnpassung;
		//marijuana
		_Num = 6; _Type = _D41_Stockmarijuana;			_VKPreis = (425/100);	_EKPreis = (350/100);	_mid = 2000;	[] call _D41_PreisAnpassung;
		//bjerky
		_Num = 7; _Type = _D41_Stockbjerky;				_VKPreis = (100/100);	_EKPreis = (25/100);	_mid = 3000;	[] call _D41_PreisAnpassung;
		//cocainep
		_Num = 8; _Type = _D41_Stockcocainep;			_VKPreis = (850/100);	_EKPreis = (800/100);	_mid = 1500;	[] call _D41_PreisAnpassung;
		//diamondc
		_Num = 9; _Type = _D41_Stockdiamondc;			_VKPreis = (2000/100);	_EKPreis = (1600/100);	_mid = 300;		[] call _D41_PreisAnpassung;
		//iron_r
		_Num = 10; _Type = _D41_Stockiron_r;			_VKPreis = (900/100);	_EKPreis = (700/100);	_mid = 500;		[] call _D41_PreisAnpassung;
		//copper_r
		_Num = 11; _Type = _D41_Stockcopper_r;			_VKPreis = (375/100);	_EKPreis = (300/100);	_mid = 500;		[] call _D41_PreisAnpassung;
		//salt_r
		_Num = 12; _Type = _D41_Stocksalt_r;			_VKPreis = (115/100);	_EKPreis = (95/100);	_mid = 1600;	[] call _D41_PreisAnpassung;
		//coal
		_Num = 13; _Type = _D41_Stockcoal;				_VKPreis = (380/100);	_EKPreis = (300/100);	_mid = 700;		[] call _D41_PreisAnpassung;
		//glass
		_Num = 14; _Type = _D41_Stockglass;				_VKPreis = (275/100);	_EKPreis = (225/100);	_mid = 750;		[] call _D41_PreisAnpassung;
		//Apfelsaft
		_Num = 15; _Type = _D41_StockApfelsaft;			_VKPreis = (135/100);	_EKPreis = (110/100);	_mid = 1000;	[] call _D41_PreisAnpassung;
		//Pfirsichsaft
		_Num = 16; _Type = _D41_StockPfirsichsaft;		_VKPreis = (190/100);	_EKPreis = (150/100);	_mid = 1000;	[] call _D41_PreisAnpassung;
		//Ton
		_Num = 17; _Type = _D41_StockTon;				_VKPreis = (275/100);	_EKPreis = (225/100);	_mid = 750;		[] call _D41_PreisAnpassung;
		//Zement
		_Num = 18; _Type = _D41_StockZement;			_VKPreis = (3450/100);	_EKPreis = (2500/100);	_mid = 180;		[] call _D41_PreisAnpassung;
		//WKomp
		_Num = 19; _Type = _D41_StockWKomp;				_VKPreis = (1000/100);	_EKPreis = (750/100);	_mid = 250;		[] call _D41_PreisAnpassung;
		//Stahl
		_Num = 20; _Type = _D41_StockStahl;				_VKPreis = (19000/100);	_EKPreis = (14000/100);	_mid = 75;		[] call _D41_PreisAnpassung;
		//Fahrzeugteile - AUSSTEHEND FÜR SPÄTERE BEARBEITUNG
		_Num = 21; _Type = _D41_StockFahrzeugteile;		_VKPreis = (1400/100);	_EKPreis = (1100/100);	_mid = 2000;	[] call _D41_PreisAnpassung;
		//Kerosin
		_Num = 22; _Type = _D41_StockKerosin;			_VKPreis = (7900/100);	_EKPreis = (6000/100);	_mid = 100;		[] call _D41_PreisAnpassung;
		//Kalkstein
		_Num = 23; _Type = _D41_StockKalkstein;			_VKPreis = (315/100);	_EKPreis = (250/100);	_mid = 800;		[] call _D41_PreisAnpassung;
		//Krabben
		_Num = 24; _Type = _D41_StockKrabben;			_VKPreis = (2900/100);	_EKPreis = (1850/100);	_mid = 1800;	[] call _D41_PreisAnpassung;
		//Eingelegter Fisch
		_Num = 25; _Type = _D41_StockDosenFisch;		_VKPreis = (550/100);	_EKPreis = (450/100);	_mid = 1800;	[] call _D41_PreisAnpassung;
	
	
	diag_log format ["::::::::::::: fn_updateStock - Preisänderungen beendet _queryResult: %1", _queryResult];
	diag_log format ["::::::::::::: fn_updateStock - Preisänderungen beendet _queryResult2: %1", _queryResult2];
	D41_KPreisliste = _queryResult;
	D41_VPreisliste = _queryResult2;
	publicVariable "D41_KPreisliste";
	publicVariable "D41_VPreisliste";
	
	//System Nachricht an alle Spieler
	[] spawn TON_fnc_UpdateGangKarma;
	[[0,"Lagerbestand aller Waren und Gangkarma aktualisiert"],"life_fnc_broadcast",true,false] call life_fnc_MP;
	sleep 900;
	sleep round(random 1200);
};