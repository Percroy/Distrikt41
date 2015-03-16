/*
	File: fn_wantedCrimes.sqf
	Author: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm
	
	Description:
	Grabs a list of crimes committed by a person.
*/
private["_display","_criminal","_tab","_queryResult","_result","_ret","_crimesDb","_crimesArr","_type"];
disableSerialization;
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_criminal = [_this,1,[],[]] call BIS_fnc_param;

_result = format["SELECT wantedCrimes, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",(_criminal select 0)];
waitUntil{!DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_result,2] call DB_fnc_asyncCall;

_DB_fnc_mresToArray =
{
	private["_array"];
	_array = [_this,0,"",[""]] call BIS_fnc_param;
	if(_array == "") exitWith {[]};
	_array = toArray(_array);

	for "_i" from 0 to (count _array)-1 do
	{
		_sel = _array select _i;
		if(_sel == 96) then
		{
			_array set[_i,39];
		};
	};

	_array = toString(_array);
	_array = call compile format["%1", _array];
	_array;
};

_ret = owner _ret;
_crimesArr = [];

_crimesDB = [(_queryResult select 0)] call _DB_fnc_mresToArray;
if(typeName _crimesDb == "STRING") then {_crimesDb = call compile _crimesDb;};
_queryResult set[0,_crimesDb];
_type = _queryResult select 0;
{
	switch(_x) do
	{
		case "187V": {_x = "VDM"}; 
		case "187": {_x = "Mord"};
		case "901": {_x = "Gefängnisausbruch"};
		case "261": {_x = "Misshandlung"};
		case "261A": {_x = "Versuchte Misshandlung"};
		case "215": {_x = "Versuchter Autodiebstahl"}; 
		case "214": {_x = "Autodiebstahl"};
		case "211": {_x = "Raub"};
		case "212": {_x = "Tankstellenraub"};
		case "480": {_x = "Fahrerflucht"}; 
		case "481": {_x = "Besitz von Illegalenwaren"};
		case "482": {_x = "Drogentransport"};
		case "483": {_x = "Drogenhandel"};
		case "459": {_x = "Einbruch"};
		case "1": {_x = "Fahren ohne Führerschein"};
		case "2": {_x = "Fahren unter Alkohol oder Drogeneinfluss"};
		case "7": {_x = "Fahren ohne Unfallkit"};
		case "4": {_x = "Fahren ohne Licht"};
		case "5": {_x = "Geschwindigkeitsüberschreitung"};
		case "6": {_x = "Fahrlässiges Fahren"};
		case "11": {_x = "Falsch Parken"};
		case "9": {_x = "Landen in einer Flugverbotszone"};
		case "10": {_x = "Fahren illegaler Fahrzeuge"};
		case "12": {_x = "Flucht vor der Polizei"};
		case "14": {_x = "Illegale Straßensperre"};
		case "15": {_x = "Widerstand gegen die Staatsgewalt"};
		case "16": {_x = "Hehlerrei"};
		case "17": {_x = "Beamtenbeleidigung"};
		case "18": {_x = "Belästigung eines Polizeibeamten"};
		case "19": {_x = "Eindringen in eine Sperrzone"};
		case "21": {_x = "Beschuss auf Polizei/Beamte/Immobilien"};
		case "22": {_x = "Zerstörung von Staatseigentum"};
		case "24": {_x = "Schusswaffen ohne Lizenz"};
		case "25": {_x = "Tragen von Schusswaffen in Städten"};
		case "26": {_x = "Illegale Schusswaffen"};
		case "28": {_x = "Geiselnahme"};
		case "29": {_x = "Angriff auf Personen / Fahrzeuge"};
		case "30": {_x = "Bankraub"};
		case "32": {_x = "Terrorismus/Aufstand"};
		case "33": {_x = "Ruhestörung"};
		case "35": {_x = "Fliegen ohne Pilotenschein"};
		case "3": {_x = "Beihilfe"};
	};
	_crimesArr pushBack _x;
}forEach _type;
_queryResult set[0,_crimesArr];

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_result];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

[[_queryResult],"life_fnc_wantedInfo",_ret,false] spawn life_fnc_MP;