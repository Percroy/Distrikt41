//::::::::::::  ::::::::::::\\
//	Filename: life_Server/functions/D41/fn_BlockChemFabrik.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Blockiert einen weiteren Überfall auf die Chemie Fabrik, für 20min
//::::::::::::  ::::::::::::\\
private["_ChemFabrik","_Mode"];

	_ChemFabrik = _this select 0;
	_Mode = _this select 1;
	
	if(_Mode == "unblock")then
	{
		_ChemFabrik setVariable ["IsBlocked",false,true];
	};
	
	if(D41_AllChemBlocked)exitWith{};
	if(_Mode == "block")then
	{
		_GetOutSucker = false;
		
		_Status = _ChemFabrik getVariable "IsBlocked";
		if(!(isNil "_Status"))then{ if(_Status)exitWith{_GetOutSucker = true;};}; //Wenn schon geblockt, warum nochmal?! (WARUM EIGTL.??? naja... Sicher is sicher...)
		if(_GetOutSucker)exitWith{};
		_ChemFabrik setVariable ["IsBlocked",true,true];
		_waitTimer = servertime + ((15 * 60) + (round(random 20) * 60));
		[true] spawn D41_fnc_robBlock;
		waitUntil{sleep 1; ((servertime - _waitTimer) >= 0) OR !(_ChemFabrik getVariable "IsBlocked")};
		[false] spawn D41_fnc_robBlock;
		_ChemFabrik setVariable ["IsBlocked",false,true];
	};