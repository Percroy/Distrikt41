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

_result = format["WantedCrimes:%1",(_criminal select 0)];
//waitUntil{!DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_result,2] call DB_fnc_asyncCall;

_ret = owner _ret;
_crimesArr = [];

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

_crimesDB = [(_queryResult select 0)] call _DB_fnc_mresToArray;
if(typeName _crimesDb == "STRING") then {_crimesDb = call compile _crimesDb;};
_queryResult set[0,_crimesDb];
_type = _queryResult select 0;
{
	switch(_x) do
	{
		case "187V": {_x = "VDM"}; 
		case "187": {_x = localize "STR_D41_Crime_murder"};
		case "901": {_x = localize "STR_D41_Prison_Break"};
		case "261": {_x = localize "STR_D41_Crime_maltreatment"};
		case "261A": {_x = localize "STR_D41_Crime_tried_maltreatment"};
		case "215": {_x = localize "STR_D41_Attempted_car_theft"}; 
		case "214": {_x = localize "STR_D41_car_theft"};
		case "211": {_x = localize "STR_D41_robbery"};
		case "212": {_x = localize "STR_D41_gas_station_robbery"};
		case "480": {_x = localize "STR_D41_Crime_HitandRun"}; 
		case "481": {_x = localize "STR_D41_Illegal_goods"};
		case "482": {_x = localize "STR_D41_drug_transport"};
		case "483": {_x = localize "STR_D41_drug_trade"};
		case "459": {_x = localize "STR_D41_burglary"};
		case "1": {_x = localize "STR_D41_Crime_No_Driving_license"};
		case "2": {_x = localize "STR_D41_Crime_Drugged_Driving"};
		case "7": {_x = localize "STR_D41_Crime_No_Toolkit"};
		case "4": {_x = localize "STR_D41_Crime_No_Light"};
		case "5": {_x = localize "STR_D41_Crime_to_Fast"};
		case "6": {_x = localize "STR_D41_Crime_careless_driving"};
		case "11": {_x = localize "STR_D41_Crime_parking"};
		case "9": {_x = localize "STR_D41_Crime_landing_no_fly"};
		case "10": {_x = localize "STR_D41_Crime_illegal_veh"};
		case "12": {_x = localize "STR_D41_Crime_fleeing_Police"};
		case "14": {_x = localize "STR_D41_Crime_roadblock"};
		case "15": {_x = localize "STR_D41_Crime_Civil_disorder"};
		case "16": {_x = localize "STR_D41_receiving"};
		case "17": {_x = localize "STR_D41_Crime_insulting"};
		case "18": {_x = localize "STR_D41_Crime_Molesting"};
		case "19": {_x = localize "STR_D41_Crime_restricted_Zone"};
		case "21": {_x = localize "STR_D41_Crime_Fire_on_Officials"};
		case "22": {_x = localize "STR_D41_Crime_destruction"};
		case "24": {_x = localize "STR_D41_Crime_no_Firearm_licence"};
		case "25": {_x = localize "STR_D41_Crime_Firearm_City"};
		case "26": {_x = localize "STR_D41_Crime_illegal_Firearm"};
		case "28": {_x = localize "STR_D41_Crime_hostages"};
		case "29": {_x = localize "STR_D41_Crime_attack_person"};
		case "30": {_x = localize "STR_D41_bank_robbery"};
		case "32": {_x = localize "STR_D41_Crime_terror"};
		case "33": {_x = localize "STR_D41_Crime_distrubance"};
		case "35": {_x = localize "STR_D41_Crime_noPilot"};
		case "3": {_x = localize "STR_D41_Crime_complicity"};
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