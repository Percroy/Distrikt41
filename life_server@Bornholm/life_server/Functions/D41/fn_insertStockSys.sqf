/*
	File: fn_insertStockSys.sqf
	Author: Dscha
	
	Description:
	Inserts Stuff to DB
*/
private["_type","_amount","_mode","_sellerID","_query"];

_type = [_this,0,"",[""]] call BIS_fnc_param;
_amount = [_this,1,"",[""]] call BIS_fnc_param;
_mode = [_this,2,"",[""]] call BIS_fnc_param;
_sellerID = [_this,3,"",[""]] call BIS_fnc_param;

diag_log format [":::::::::::::::: Zugriff Stocksys =  _Item: %1 - Anzahl: %2 - Add/Rem in DB?: %3 - Spieler: %4", _type, _amount, _mode, _sellerID];

switch(_mode)do
{
	case "add":
	{
		_query = format["StockUpdate+Add+%1:%2",_type,_amount];
		//waitUntil{!DB_Async_Active};
		[_query] spawn DB_fnc_asyncCall;
	};
	
	case "rem":
	{
		_query = format["StockUpdate+Remove+%1:%2",_type,_amount];
		//waitUntil{!DB_Async_Active};
		[_query] spawn DB_fnc_asyncCall;
	};
	
	default {diag_log format ["INSERT STOCK SYS : FEHLER Typ: %1",_type];};
};
