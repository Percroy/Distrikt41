//::::::::::::  ::::::::::::\\
//	Filename: life_server/Functions/Gangs/fn_queryGangKarma.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Lädt und setzt Karma der Gang.
// [[getPlayerUID player,group player],"TON_fnc_queryGangKarma",false,false,false] spawn life_fnc_MP;
//::::::::::::  ::::::::::::\\
private["_GroupID","_query","_queryResult","_string","_tmp","_MemberListe","_Membercount","_GID","_Karma"];

D41_GKarmaQry = true;
_GID = _this select 0;
_senderGroup = _this select 1;
_query = format["queryGangKarma:%1",_GID];

//waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

//_string = [_queryResult,0,"",[""]] call BIS_fnc_param; // Keinen Plan, warum BIS_fnc_param auf einmal nicht mehr geht! oO
_string = str(_queryResult select 0);
_string = toArray _string;

{
	if(_x in [34,91,93,96,44]) then
	{
		_string set[_forEachIndex,-1];
	};
} foreach _string;
_string = _string - [-1];

_Membercount = (count(_string)/17);
_tmp = [];
_MemberListe = [];
for "_i" from 1 to _Membercount do
{
	for "_i" from 0 to 16 do
	{
		_tmp pushback (_string select _i);
	};
	_tmp = toString _tmp;
	_MemberListe pushback _tmp;
	_tmp = [];
	_string deleteRange [0,17];
};


_Karma = 0;
{
	_query = format["queryKarmaGang:%1",_x];
	//waitUntil{!DB_Async_Active};
	_queryResult = [_query,2] call DB_fnc_asyncCall;
	_Karma = _Karma + (_queryResult select 0);
}forEach _MemberListe;

_Karma = _Karma / _Membercount;
_Karma = format["%1",round(_Karma)];
_senderGroup setVariable["gang_Karma",_Karma,true];
diag_log format ["::::::::::: queryGangKarma GruppenID: %1 - Neues Karma: %2",_GID, _Karma];
_query = format["setGangKarma:%1:%2",_Karma,_GID];
//waitUntil{!DB_Async_Active};
[_query] spawn DB_fnc_asyncCall;
D41_GKarmaQry = false;