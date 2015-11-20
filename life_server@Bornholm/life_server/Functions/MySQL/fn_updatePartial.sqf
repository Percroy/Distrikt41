/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes partial data of a player and updates it, this is meant to be
	less network intensive towards data flowing through it for updates.
*/
private["_uid","_side","_value","_mode","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_mode = [_this,3,-1,[0]] call BIS_fnc_param;
//diag_log format [":::::::::::::::::::::: UpdatePartial DIAG LOG _THIS: %1", _this]; //Temporär entfernt

if(_uid == "" OR _side == sideUnknown) exitWith {}; //Bad.
_query = "";

switch(_mode) do
{
	/*case 0:
	{
		_value = [_this,2,0,[0]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_numberSafe;
		_query = format["UpdatePartial+CASH:%1:%2",_value,_uid];
		diag_log format ["PartUpdate - Cash - UID : %1 : %2", _uid, _query];
	};
	
	case 1:
	{
		_value = [_this,2,0,[0]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_numberSafe;
		_query = format["UpdatePartial+BANK:%1:%2",_value,_uid];
		diag_log format ["PartUpdate - BankAcc - UID : %1 : %2",  _uid, _query];
	};*/
	
	case 2:
	{
		_value = [_this,2,[],[[]]] call BIS_fnc_param;
		//Does something license related but I can't remember I only know it's important?
		for "_i" from 0 to count(_value)-1 do
		{
			_bool = [(_value select _i) select 1] call DB_fnc_bool;
			_value set[_i,[(_value select _i) select 0,_bool]];
		};
		_value = [_value] call DB_fnc_mresArray;
		_value2 = _this select 4;
		switch(_side) do
		{
			case west: {_query = format["UpdatePartial+cop_licenses:%1:%2",_value,_uid];};
			case civilian: {_query = format["UpdatePartial+civ_licenses:%1:%2:%3",_value,_value2,_uid];};
			case independent: {_query = format["UpdatePartial+med_licenses:%1:%2",_value,_uid];};
		};
		diag_log format ["::::::::: UPDATE PARTIAL: _uid: %1 | _mode: %2 | V1: %3 | V2: %4", _uid, _mode, _value, _value2]; //DEV
	};
	
	case 3:
	{
		_value = [_this,2,[],[[]]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_mresArray;
		_value2 = _this select 4;
		switch(_side) do
		{
			case west: {_query = format["UpdatePartial+cop_gear:%1:%2",_value,_uid];};
			case civilian: {_query = format["UpdatePartial+civ_gear:%1:%2:%3",_value,_value2,_uid];};
			case independent: {_query = format["UpdatePartial+med_gear:%1:%2",_value,_uid];};
		};
		diag_log format ["::::::::: UPDATE PARTIAL: _uid: %1 | _mode: %2 | V1: %3 | V2: %4", _uid, _mode, _value, _value2]; //DEV
	};
	
	case 4:
	{
		_value = [_this,2,false,[true]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_bool;
		_query = format["UpdatePartial+alive:%1:%2",_value,_uid];
		diag_log format ["::::::::: UPDATE PARTIAL: _uid: %1 | _mode: %2 | V1: %3", _uid, _mode, _value]; //DEV
	};
	
	case 5:
	{
		_value = [_this,2,false,[true]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_bool;
		_value2 = _this select 4;
		_query = format["UpdatePartial+arrested:%1:%2:%3",_value,_value2,_uid];
		diag_log format ["::::::::: UPDATE PARTIAL: _uid: %1 | _mode: %2 | V1: %3 | V2: %4", _uid, _mode, _value, _value2]; //DEV
	};
	
	case 6:
	{
		_value1 = [_this,2,0,[0]] call BIS_fnc_param;
		_value2 = [_this,4,0,[0]] call BIS_fnc_param;
		_value1 = [_value1] call DB_fnc_numberSafe;
		_value2 = [_value2] call DB_fnc_numberSafe;
		_value3 = _this select 6;
		if(_side != civilian)then
		{
			_query = format["UpdatePartial+cash+bank+NonCiv:%1:%2:%3",_value1,_value2,_uid];
			diag_log format ["::::::::: UPDATE PARTIAL: _uid: %1 | _mode: %2 | V1: %3 | V2: %4 | V3: %5", _uid, _mode, _value1, _value2]; //DEV
		}
		else
		{
			_query = format["UpdatePartial+cash+bank:%1:%2:%3:%4",_value1,_value2,_value3,_uid];
			diag_log format ["::::::::: UPDATE PARTIAL: _uid: %1 | _mode: %2 | V1: %3 | V2: %4 | V3: %5", _uid, _mode, _value1, _value2, _value3]; //DEV
		};
	};
	
	case 7:
	{
		_array = [_this,2,[],[[]]] call BIS_fnc_param;
		[_uid,_side,_array,0] call TON_fnc_keyManagement;
		diag_log format ["::::::::: UPDATE PARTIAL: _uid: %1 | _mode: %2 | V1: %3 | V2: %4", _uid, _mode, _array]; //DEV
	};
	
	case 8:
	{
		_value = [_this,2,0,[0]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_numberSafe;
		_value2 = _this select 4;
		_query = format["UpdatePartial+died:%1:%2:%3",_value,_value2,_uid];
		diag_log format ["::::::::: UPDATE PARTIAL: _uid: %1 | _mode: %2 | V1: %3 | V2: %4", _uid, _mode, _value, _value2]; //DEV
	};
	
	case 9:
	{
		_value = [_this,2,0,[0]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_numberSafe;
		_value2 = _this select 4;
		_query = format["UpdatePartial+Karma:%1:%2:%3",_value,_value2,_uid];
		diag_log format ["::::::::: UPDATE PARTIAL: _uid: %1 | _mode: %2 | V1: %3 | V2: %4", _uid, _mode, _value, _value2]; //DEV
	};
};

if(_query == "") exitWith {};

"extDB2" callExtension format["%1:%2:%3",1,(call life_sql_id),_query];
