/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Queries to see if the player belongs to any gang.
*/
private["_query","_queryResult"];

_query = format["SELECT id, owner, name, maxmembers, bank, members FROM gangs WHERE active='1' AND members LIKE '%2%1%2'",_this,"%"];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

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

if(count _queryResult != 0) then {
	_tmp = [_queryResult select 5] call _DB_fnc_mresToArray;
	if(typeName _tmp == "STRING") then {_tmp = call compile format["%1",_tmp];};
	_queryResult set[5, _tmp];
};
missionNamespace setVariable[format["gang_%1",_this],_queryResult];