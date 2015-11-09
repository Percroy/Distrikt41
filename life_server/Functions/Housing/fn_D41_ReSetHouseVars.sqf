//::::::::::::  ::::::::::::\\
//	Filename: life_server/Functions/Housing/fn_D41_ReSetHouseVars.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Re-Set der Hausdaten... Da bei gestreamten Objekten (Mapobjekte ala Häuser) die Daten nimmer ankommen -> Nochmal setzen.
//::::::::::::  ::::::::::::\\


_pos = param[0,[],[[]]];
diag_log format [":::::::::::::::: ReSetHouseVars: _pos = %1", _pos];

_query = format["initHouses+2:%1",_pos];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if(count (_queryResult select 0) == 0) exitWith {diag_Log format ["::::::::::: ReSetHouseVars: Nicht unter Pos: %1 gefunden", _pos]};


	_HouseInfos = [];
	_posi = call compile format["%1",_queryResult select 2];
	_house = nearestObjects [_posi, D41_HausArray, 10];
	if(count(_house) == 0)exitWith{diag_Log format [":::::: ReSetHouseVars: count(house) = 0: _posi = %1", _posi];};
	_house = _house select 0;
	
	_HouseInfos pushback (_queryResult select 0);						//Infos in: *MissionFileName*/core/housing/fn_D41_GetHouseInfos.sqf
	_HouseInfos pushback (round(random 99999));
	_HouseInfos pushback [_queryResult select 1,_queryResult select 3];
	_HouseInfos pushback true;
	_HouseInfos pushback [];
	_HouseInfos pushback false;
	
	_house setVariable ["House_Infos", _HouseInfos, true];
	
	diag_log format [":::: initHouses: # %1 --- _queryResult = %2",_counter, _queryResult];
	sleep 0.01;
	
	_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;
	if(_HouseInfos isEqualTo "KeineDaten")then{diag_log format ["::::::::::::: InitHouses: FEHLER: HouseInfos=KeineDaten: _pos= %1 || House: %2 || Owner: %3", _posi, typeOf _house, _queryResult select 3];};