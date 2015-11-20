//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_ChatMsgPrep.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Vorbereitung für Direkte Nachrichten
// Aufrufen mit " ["NUMMER"] spawn life_fnc_ChatMsgPrep "
//::::::::::::  ::::::::::::\\
private["_mode","_Targets","_list"];
_mode = _this select 0;

if(D41_InUse == 1)exitWith{};

D41_InUse = 1;
_Targets = [];
_list = player nearEntities [["Man","Car","Air","Ship"], 30];
{
	if(_x isKindOf "Car" OR _x isKindOf "Air" OR _x isKindOf "Ship")then
	{
		{
			_Targets pushBack _x;
			diag_log format ["::::: Distrikt41 Msg Log - Msg Send To: %1 - Msg Mode: %2",_x getVariable["realname",name _x], _mode];
		}forEach crew _x;
	}
	else
	{
		if(alive _x)then
		{
			_Targets pushBack _x;
		};
		diag_log format ["::::: Distrikt41 Msg Log - Msg Send To: %1 - Msg Mode: %2",_x getVariable["realname",name _x], _mode];
	}
}forEach _list;

//if(count _Targets <= 1)exitWith{};

[[_mode],"life_fnc_D41_ChatMsg",_Targets,false,false] call life_fnc_MP;
if(_mode == 5)then{[] spawn life_fnc_entwaffnen;};

uisleep 15;
D41_InUse = 0;