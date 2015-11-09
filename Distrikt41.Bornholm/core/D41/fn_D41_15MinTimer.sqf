//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_15MinTimer.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Spawnt die Personen zurück zum Spawnpunkt, wenn er sich mehr als 500m von seinem Spawnpunkt entfernt und der 15min Timer noch nicht abgelaufen ist!
// Provisorische erstellt, muß noch überarbeitet werden. (sieht aus wie Huf)
//::::::::::::  ::::::::::::\\
private["_pos","_time","_Timer","_Counter"];

if(!D41_RespawnTimer)exitWith{};
_pos = getPosATL player;

[] spawn
	{
		
		_time = time;
		_Timer = 15;
		_Counter = 1;
		
		systemchat format[localize "STR_D41_RespawnTimer",_Timer]; hint format[localize "STR_D41_RespawnTimer",_Timer];
		
		while{true}do
		{
			waitUntil{(((time - _time) > (_Counter * 60)) OR (!alive player) OR (D41_DiedTimer == 0))};
			_Counter = _Counter + 1;
			if(_timer == 0)exitWith{systemchat localize "STR_D41_RespawnTimerFinished"; hint localize "STR_D41_RespawnTimerFinished"};
			if((alive player) && (D41_DiedTimer != 0))then{systemchat format[localize "STR_D41_RespawnTimer",_Timer]; hint format[localize "STR_D41_RespawnTimer",_Timer];};
			_Timer = _Timer - 1;
		};
		
		if(!alive player)exitWith{};
		D41_DiedTimer = 0;
		[8] call SOCK_fnc_updatePartial;
	};

while{true}do
	{
		waitUntil{((player distance _pos) > 500 OR (D41_DiedTimer == 0))};
		if(!alive player)exitWith{};
		if(D41_DiedTimer == 0)exitWith{hint localize "STR_D41_RespawnTimerFinished"; systemchat localize "STR_D41_RespawnTimerFinished"};
		if(vehicle player != player) then
		{
			player allowDamage false;
			moveOut player;
			player setPosATL [_pos select 0, _pos select 1, (_pos select 2) + 0.5];
			player setVelocity [0,0,0];
			player allowDamage true;
		}
		else
		{
			player setPosATL _pos;
		};
		hint localize "STR_D41_RespawnTimerNotAktiv";
		systemchat localize "STR_D41_RespawnTimerNotAktiv";
		systemchat localize "STR_D41_RespawnTimerNotAktiv";
	};