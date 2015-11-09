//::::::::::::  ::::::::::::\\
//	Filename: Core/D41/fn_D41_KnastRep.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Reparieren der Knastbarrikade
//::::::::::::  ::::::::::::\\

private["_Knast_Cut","_Starttime"];

	
	_Knast_Cut = "Land_Ground_sheet_F" createVehicle [10374.447,9252.2354,1];
	_Knast_Cut allowdamage false;
	_Knast_Cut enableSimulation false;
	if(IsNull _Knast_Cut)exitWith{};
	if(({_x == "D41_ToolKit"} count magazines player) < 1)exitWith{hint localize "STR_D41_KeinRepKit"};
	
	sleep random(1.5);
	
	D41_RepKnastDone = false;
	_Starttime = serverTime + (2 * 60);
	[
		"D41_KnastRepTimer",
		"onEachFrame",
		{
			private["_Knast_Cut","_Starttime","_CountdownTimer","_isects"];
			_Knast_Cut = _this select 0;
			_Starttime = _this select 1;
			
			if(round(serverTime - _Starttime) >= 0) exitWith{D41_RepKnastDone = true};
			_CountdownTimer = format["%1",[(_Starttime - serverTime),"MM:SS.MS"] call BIS_fnc_secondsToString];
			if(IsNull _Knast_Cut)exitWith{life_interrupted = true;};
			if((speed player >= 1) OR !(alive player))exitWith{life_interrupted = true;};
			_isects = lineIntersects [eyePos player, getPosASL _Knast_Cut, _Knast_Cut, player];
			if(_isects)then
			{
				drawIcon3D ["\A3\ui_f\data\igui\cfg\actions\repair_ca.paa", [1,1,1,0.5], _Knast_Cut modelToWorld [0.3, -0.27, 0.95], 1, 1, 0, _CountdownTimer, 1, 0.04, "TahomaB"];
			};
		},
		[_Knast_Cut, _Starttime]
	] call BIS_fnc_addStackedEventHandler;
	life_action_inUse = true;
	[] spawn life_fnc_D41_animLoop;
	
	waitUntil{sleep 0.1; (D41_RepKnastDone OR life_interrupted)};
	["D41_KnastRepTimer", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	life_action_inUse = false;
	if(life_interrupted)exitWith{life_interrupted = false; hint localize "STR_NOTF_ActionCancel"; systemchat localize "STR_NOTF_ActionCancel";};
	
	player removemagazine "D41_ToolKit";
	
	if(isNull _Knast_Cut)exitWith{};
	_Ganz = "Land_Mil_WiredFence_F" createVehicle [0,0,0];
	_Ganz allowDamage false;
	_Ganz setDir 41.339851;
	_Ganz setPosATL [10374.447,9252.2354,0];
	deleteVehicle _Knast_Cut;
	
	
	//Aufräumen
	_Knast_Cut = nil;