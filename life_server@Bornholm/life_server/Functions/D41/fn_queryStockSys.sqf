/*
	File: fn_queryStockSys.sqf
	Author: Dscha

	Description:
	query Stuff from DB
	// [_Item, str(_amount), player]
*/
	private[];
	_Item = [_this,0,"",[""]] call BIS_fnc_param;
	_Menge = [_this,1,"",[""]] call BIS_fnc_param;
	_player = _this select 2;

	//Von welchem Item den InitBestand abrufen?
	_InitBestand = 0;
	switch(true)do
	{
		case(_Item isEqualTo "D41_Apfel"):				{_InitBestand = D41_InitBestandsListe select 0;};
		case(_Item isEqualTo "D41_Pfirsich"):			{_InitBestand = D41_InitBestandsListe select 1;};
		case(_Item isEqualTo "D41_Apfelschnaps"):		{_InitBestand = D41_InitBestandsListe select 2;};
		case(_Item isEqualTo "D41_Pfirsichschnaps"):	{_InitBestand = D41_InitBestandsListe select 3;};
		case(_Item isEqualTo "D41_Heroin"):				{_InitBestand = D41_InitBestandsListe select 4;};
		case(_Item isEqualTo "D41_Oel"):				{_InitBestand = D41_InitBestandsListe select 5;};
		case(_Item isEqualTo "D41_Cannabis"):			{_InitBestand = D41_InitBestandsListe select 6;};
		case(_Item isEqualTo "D41_BeefJerky"):			{_InitBestand = D41_InitBestandsListe select 7;};
		case(_Item isEqualTo "D41_Kokain"):				{_InitBestand = D41_InitBestandsListe select 8;};
		case(_Item isEqualTo "D41_Diamanten"):			{_InitBestand = D41_InitBestandsListe select 9;};
		case(_Item isEqualTo "D41_Eisen"):				{_InitBestand = D41_InitBestandsListe select 10;};
		case(_Item isEqualTo "D41_Kupfer"):				{_InitBestand = D41_InitBestandsListe select 11;};
		case(_Item isEqualTo "D41_Salz"):				{_InitBestand = D41_InitBestandsListe select 12;};
		case(_Item isEqualTo "D41_Kohle"):				{_InitBestand = D41_InitBestandsListe select 13;};
		case(_Item isEqualTo "D41_Glas"):				{_InitBestand = D41_InitBestandsListe select 14;};
		case(_Item isEqualTo "D41_Apfelsaft"):			{_InitBestand = D41_InitBestandsListe select 15;};
		case(_Item isEqualTo "D41_Pfirsichsaft"):		{_InitBestand = D41_InitBestandsListe select 16;};
		case(_Item isEqualTo "D41_Ton"):				{_InitBestand = D41_InitBestandsListe select 17;};
		case(_Item isEqualTo "D41_Zement"):				{_InitBestand = D41_InitBestandsListe select 18;};
		case(_Item isEqualTo "D41_WaffenKomponenten"):	{_InitBestand = D41_InitBestandsListe select 19;};
		case(_Item isEqualTo "D41_Stahl"):				{_InitBestand = D41_InitBestandsListe select 20;};
		case(_Item isEqualTo "D41_Fahrzeugteile"):		{_InitBestand = D41_InitBestandsListe select 21;};
		case(_Item isEqualTo "D41_Kerosin"):			{_InitBestand = D41_InitBestandsListe select 22;};
		case(_Item isEqualTo "D41_Kalkstein"):			{_InitBestand = D41_InitBestandsListe select 23;};
		case(_Item isEqualTo "D41_Krabben"):			{_InitBestand = D41_InitBestandsListe select 24;};
		case(_Item isEqualTo "D41_Dosenfisch"):			{_InitBestand = D41_InitBestandsListe select 25;};
		default{diag_log format ["::::::::::::: FEHLER queryStockSys %1", _Item]; _player setVariable["D41_BuyAble",false,true];};
	};
	
	//%Wert auswählen
	_Prozent = 10;
	_playerCount = ({side _x == civilian} count playableUnits);
	if (_playerCount > 10)		then {_Prozent = 25}; //25% von InitBestand kaufbar
	if (_playerCount > 20)		then {_Prozent = 50}; //50% von InitBestand kaufbar
	if (_playerCount > 30)		then {_Prozent = 65}; //65% von InitBestand kaufbar
	if (_playerCount > 40)		then {_Prozent = 70}; //70% von InitBestand kaufbar
	if (_playerCount > 50)		then {_Prozent = 75}; //75% von InitBestand kaufbar
	if (_playerCount >= 50)		then {_Prozent = 80}; //80% von InitBestand kaufbar
	
	//Aktuellen Bestand von Item abrufen
	//waitUntil{!DB_Async_Active};
	_query = [format["queryStockSys:%1",_Item], 2, false] call DB_fnc_asyncCall;
	_D41_DBBestand = _query select 0;
	
	_Kaufmenge = parseNumber(_Menge);
	
	//Differenz berechnen
	_ErlaubterMindesBestand = (_InitBestand - ((_InitBestand/100)*_Prozent));
	_DBBestandNachKauf = _D41_DBBestand - _Kaufmenge;
	_Differenz = (_ErlaubterMindesBestand - _DBBestandNachKauf);
	
	//Diag gedöhns! \o/ woot woot!
	diag_log format [":::::::::::::::: Item:								%1", _Item];
	diag_log format [":::::::::::::::: _Kaufmenge:							%1", _Kaufmenge];
	diag_log format [":::::::::::::::: Zivilisten Online:					%1", _playerCount];
	diag_log format [":::::::::::::::: Prozent kaufbar:						%1%2", _Prozent,"%"];
	diag_log format [":::::::::::::::: Erlaubter Mindesbestand:				%1", _ErlaubterMindesBestand];
	diag_log format [":::::::::::::::: DB Bestand nach Kauf:				%1", _DBBestandNachKauf];
	diag_log format [":::::::::::::::: _Differenz (<0 = kann kaufen):		%1", _Differenz];
	
	//Darf er kaufen?!
	_CanBuy = false;
	if(_Differenz <= 0)	then {_CanBuy = true;	diag_log format ["::::::::::::: queryStockSys - TRUE - Item: %1 - Diff: %2",_Item, _Differenz]};
	if(_Differenz > 0)	then {_CanBuy = false;	diag_log format ["::::::::::::: queryStockSys - FALSE - Item: %1 - Diff: %2",_Item, _Differenz]};
	
	_player setVariable["D41_BuyAble",_CanBuy,true];
