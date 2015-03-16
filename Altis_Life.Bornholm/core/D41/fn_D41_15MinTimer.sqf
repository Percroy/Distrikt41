//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_15MinTimer.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Spawnt die Personen zurück zum Spawnpunkt, wenn er sich mehr als 500m von seinem Spawnpunkt entfernt und der 15min Timer noch nicht abgelaufen ist!
// Provisorische erstellt, muß noch überarbeitet werden. (sieht aus wie Huf)
//::::::::::::  ::::::::::::\\
private["_pos","_time"];
_pos = getPosATL player;

[] spawn
	{
		_time = time;
		systemchat "Respawntimer: 15min - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt";
		systemchat "Respawntimer: 15min - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt";
		systemchat "Respawntimer: 15min - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt";
		waitUntil{(((time - _time) > (1 * 60)) OR (!alive player) OR (D41_DiedTimer == 0))};
		if(alive player && (D41_DiedTimer != 0))then{ systemchat "Respawntimer: 10min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt"; hint "Respawntimer: 14min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt";};
		waitUntil{(((time - _time) > (2 * 60)) OR (!alive player) OR (D41_DiedTimer == 0))};
		if(alive player && (D41_DiedTimer != 0))then{ systemchat "Respawntimer: 10min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt"; hint "Respawntimer: 13min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt";};
		waitUntil{(((time - _time) > (5 * 60)) OR (!alive player) OR (D41_DiedTimer == 0))};
		if(alive player && (D41_DiedTimer != 0))then{ systemchat "Respawntimer: 10min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt"; hint "Respawntimer: 10min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt";};
		waitUntil{(((time - _time) > (10 * 60)) OR (!alive player) OR (D41_DiedTimer == 0))};
		if(alive player && (D41_DiedTimer != 0))then{ systemchat "Respawntimer: 5min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt"; hint "Respawntimer: 5min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt";};
		waitUntil{(((time - _time) > (12 * 60)) OR (!alive player) OR (D41_DiedTimer == 0))};
		if(alive player && (D41_DiedTimer != 0))then{ systemchat "Respawntimer: 3min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt"; hint "Respawntimer: 3min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt";};
		waitUntil{(((time - _time) > (13 * 60)) OR (!alive player) OR (D41_DiedTimer == 0))};
		if(alive player && (D41_DiedTimer != 0))then{ systemchat "Respawntimer: 2min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt"; hint "Respawntimer: 2min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt";};
		waitUntil{(((time - _time) > (14 * 60)) OR (!alive player) OR (D41_DiedTimer == 0))};
		if(alive player && (D41_DiedTimer != 0))then{ systemchat "Respawntimer: 1min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt"; hint "Respawntimer: 1min übrig - Bleibe in einem 500m Umkreis zu Deinem Spawnpunkt";};
		if(!alive player)exitWith{};
		D41_DiedTimer = 0;
		[8] call SOCK_fnc_updatePartial;
	};

while{true}do
	{
		waitUntil{((player distance _pos) > 500 OR (D41_DiedTimer == 0))};
		if(!alive player)exitWith{};
		if(D41_DiedTimer == 0)exitWith{hint "15min Respawntimer abgelaufen. Du darfst dein Spawngebiet verlassen."; systemchat "15min Respawntimer abgelaufen. Du darfst dein Spawngebiet verlassen."};
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
		hint "nanana! Der 15min Timer ist noch nicht abgelaufen!";
		systemchat "nanana! Der 15min Timer ist noch nicht abgelaufen!";
		systemchat "nanana! Der 15min Timer ist noch nicht abgelaufen!";
	};