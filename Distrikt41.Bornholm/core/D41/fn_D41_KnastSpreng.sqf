//::::::::::::  ::::::::::::\\
//	Filename: Core/D41/fn_D41_KnastSpreng.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Aufsprengen der Knastbarrikade
//::::::::::::  ::::::::::::\\

private["_Knast_Spreng","_bumm","_bumm2","_Putt"];

	_Knast_Spreng = nearestObject [[10394.704,9232.5898,-0.5], "Land_Cargo_House_V3_F"];
	
	if(isNil "D41_TimerFertig")then{D41_TimerFertig = false;};
	if(D41_TimerFertig)exitWith{};
	if((player distance _Knast_Spreng) > 5)exitWith{};
	if(({_x == "D41_Sprengladung"} count magazines player) < 2)exitWith{hint localize "STR_ISTR_Blast_NichtGenugLadungen"};
	
	sleep random(1.5);
	
	_bumm = "DemoCharge_Remote_Ammo_Scripted" createVehicle [0,0,100];
	_bumm2 = "DemoCharge_Remote_Ammo_Scripted" createVehicle [0,0,100];
	_bumm allowDamage false;
	_bumm2 allowDamage false;
	
	if ((count (attachedObjects _Knast_Spreng)) != 0)exitWith{hint localize "STR_ISTR_Blast_AlreadyPlaced"; deleteVehicle _bumm; deleteVehicle _bumm2;};
	player removemagazine "D41_Sprengladung";
	player removemagazine "D41_Sprengladung";
	
	//Attach -> drehen -> Attach (sieht einfach nur besser aus)
	_bumm attachTo [_Knast_Spreng, [0,0,0]];
	_bumm2 attachTo [_Knast_Spreng, [0,0,0]];
	_bumm setVectorDirAndUp [[0,0,-1],[0,-1,0]];
	_bumm2 setVectorDirAndUp [[0,0,-1],[0,-1,0]];
	_bumm attachTo [_Knast_Spreng, [0.3, -0.27, 1.4]];
	_bumm2 attachTo [_Knast_Spreng, [0.3, -0.27, 0.5]];
	
	_TimerEndZeit = serverTime + (5 * 60); //x * x-seconds
	[[_TimerEndZeit, _Knast_Spreng, player],"life_fnc_D41_StartSatchelTimer",true,false] call life_fnc_mp;
	
	D41_TimerFertig = false;
	[
		"D41_CountdownTimer",
		"onEachFrame",
		{
			private["_TimerEndZeit","_Knast_Spreng","_CountdownTimer","_isects"];
			_TimerEndZeit = _this select 0;
			_Knast_Spreng = _this select 1;
			
			if(round(serverTime - _TimerEndZeit) >= 0) exitWith{D41_TimerFertig = true;};
			_CountdownTimer = format["%1",[(_TimerEndZeit - serverTime),"MM:SS.MS"] call BIS_fnc_secondsToString];
			if(IsNull _Knast_Spreng)exitWith{D41_TimerFertig = true;};
			_isects = lineIntersects [eyePos player, getPosASL _Knast_Spreng, _Knast_Spreng, player];
			if(!_isects && ((player distance (getPosASL _Knast_Spreng)) < 50) )then
			{
				drawIcon3D ["\A3\ui_f\data\igui\cfg\actions\settimer_ca.paa", [1,1,1,0.5], _Knast_Spreng modelToWorld [0.3, -0.27, 0.95], 1, 1, 0, _CountdownTimer, 1, 0.04, "TahomaB"];
			};
		},
		[_TimerEndZeit, _Knast_Spreng]
	] call BIS_fnc_addStackedEventHandler;
	
	waitUntil{sleep 0.1; (D41_TimerFertig OR ((count (attachedObjects _Knast_Spreng)) == 0))};
	D41_TimerFertig = false;
	
	if(IsNull _Knast_Spreng)exitWith{};
	if((count (attachedObjects _Knast_Spreng)) == 0)exitWith{hint localize "STR_ISTR_Blast_Disarmed";};
	
	_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL _Knast_Spreng select 0, getPosATL _Knast_Spreng select 1, (getPosATL _Knast_Spreng select 2)+0.5];
	{
	  deleteVehicle _x;
	} forEach attachedObjects _Knast_Spreng;
	
	if(isNull _Knast_Spreng)exitWith{diag_log "::::::::::::: fn_D41_KnastSpreng hat n Fehler (isNull _Knast_Spreng)";};
	_Putt = "Land_Cargo_House_V3_ruins_F" createVehicle [0,0,0];
	_Putt allowDamage false;
	_Putt setDir 223.70599;
	_Putt setPosATL [10394.704,9232.5898,-0.5];
	deleteVehicle _Knast_Spreng;