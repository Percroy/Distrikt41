//::::::::::::  ::::::::::::\\
//	Filename: life_server/Functions/D41/fn_D41_StartSatchelTimer.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Startet 3D-Timer an vorgegebener Position
//		[[TimerEndzeit,			Ignoriertes Objekt, ScriptInitiator],	"life_fnc_D41_StartSatchelTimer"] call life_fnc_mp;
//Bsp.:	[[(time + (10 * 60)),	cursorTarget, 		Civ_15],			"life_fnc_D41_StartSatchelTimer"] call life_fnc_mp;
//::::::::::::  ::::::::::::\\

private["_sender","_TimerStartZeit","_Delay","_Ignored_Obj","_Differenz","_TimerEndZeit"];

	_sender = _this select 2;
	if(_sender isEqualTo player)exitWith{};
	
	_TimerEndZeit = _this select 0;
	_Ignored_Obj = _this select 1;
	
	["D41_CountdownTimer", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	D41_TimerFertig = false;
	[
		"D41_CountdownTimer",
		"onEachFrame",
		{
			private["_Ignored_Obj","_TimerEndZeit","_CountdownTimer","_isects"];
			_Ignored_Obj = _this select 0;
			_TimerEndZeit = _this select 1;
			
			if(serverTime >= _TimerEndZeit)exitWith{D41_TimerFertig = true;};
			_CountdownTimer = format["%1",[(_TimerEndZeit - serverTime),"MM:SS.MS"] call BIS_fnc_secondsToString];
			if(IsNull _Ignored_Obj)exitWith{D41_TimerFertig = true;};
			_isects = lineIntersects [eyePos player, getPosASL _Ignored_Obj, _Ignored_Obj, player];
			if(!_isects && ((player distance (getPosASL _Ignored_Obj)) < 50) )then
			{
				drawIcon3D ["\A3\ui_f\data\igui\cfg\actions\settimer_ca.paa", [1,1,1,0.5], _Ignored_Obj modelToWorld [0.3, -0.27, 0.95], 1, 1, 0, _CountdownTimer, 1, 0.04, "TahomaB"];
			};
		},
		[_Ignored_Obj, _TimerEndZeit]
	] call BIS_fnc_addStackedEventHandler;
	
	waitUntil{sleep 0.1; D41_TimerFertig};
	D41_TimerFertig = false;
	["D41_CountdownTimer", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;