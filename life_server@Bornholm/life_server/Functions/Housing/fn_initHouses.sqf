//::::::::::::  ::::::::::::\\
//	Filename: life_server/Functions/Housing/fn_initHouses.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Lädt die Koordinaten alle gekauften Häuser aus der DB und speichert sie in der Variable: "D41_HausListe"
//::::::::::::  ::::::::::::\\

private["_queryResult","_query","_count","_counter","_HouseInfos","_posi","_house"];
if(isNil "D41_HouseInitDone")then{D41_HouseInitDone = false;};



_queryResult = ["initHouses+3",2,true] call DB_fnc_asyncCall;
diag_log format [":::::::::::::::: INITHOUSES: QUERY RESULT: %1", _queryResult];
if(count (_queryResult select 0) == 0) exitWith {};
_counter = 0;
D41_HausListe = [];
{
	_posi = call compile format["%1",_x select 0];
	_house = nearestObjects [_posi, D41_HausArray, 10];
	if(count(_house) == 0)exitWith{};
	D41_HausListe pushback _posi;
	diag_log format [":::: initHouses: # %1 --- _x = %2",_counter, _x];
	_counter = _counter + 1;
	sleep 0.01;
} foreach _queryResult;

publicvariable "D41_HausListe";
D41_HouseInitDone = true;