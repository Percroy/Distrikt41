//::::::::::::  ::::::::::::\\
//	Filename: Core/D41/fn_D41_TransportTonne.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Einfüllen der Meth Tonne in ein Tankfahrzeug
//::::::::::::  ::::::::::::\\
private["_CurTarget","_Mod","_StartZeit","_TargetTruck"];

	_CurTarget = cursorTarget;
	_Mod = 20;
	_StartZeit = serverTime;
	
	if(!((typeOf _CurTarget) isEqualTo "Land_MetalBarrel_F"))exitWith{};
	_TargetTruck = nearestObjects[getPos player, D41_TanklasterListe,5] select 0;
	if(isNil "_TargetTruck")exitWith{hint "No Truck"};
	if(!(_TargetTruck canAdd "D41_Meth1"))exitWith{hint "Truck ist voll"};
	
	["TonneTimer", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	D41_TonneExit = false;
	[
		"TonneTimer",
		"onEachFrame",
		{
			private["_StartZeit","_Mod","_CurTarget","_TargetTruck"];
			_StartZeit = _this select 0;
			_Mod = _this select 1;
			_CurTarget = _this select 2;
			_TargetTruck = _this select 3;
			
			if(round((_StartZeit + _Mod) - serverTime) <= 0)exitWith{D41_TonneExit = true;};
			if((player distance _CurTarget) > 5)exitWith{D41_TonneExit = true;};
			if((player distance _TargetTruck) > 5)exitWith{D41_TonneExit = true;};
			if(isNull _CurTarget)exitWith{D41_TonneExit = true;};
			
			_Prozent = format ["%1%2 left",((round((_StartZeit + _Mod) - serverTime)/_Mod)*100),"%"];
			_isects = lineIntersects [eyePos player, getPosASL _CurTarget, _CurTarget, player];
			if(!_isects)then
			{
				drawIcon3D ["\A3\ui_f\data\igui\cfg\actions\take_ca.paa", [1,1,1,0.5], _CurTarget modelToWorld [0, 0, 0.25], 1, 1, 0, _Prozent, 1, 0.04, "TahomaB"];
			};
		},
		[_StartZeit, _Mod, _CurTarget, _TargetTruck]
	] call BIS_fnc_addStackedEventHandler;
	
	waitUntil{sleep 0.1; D41_TonneExit};
	["TonneTimer", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	
	if(round((_StartZeit + _Mod) - serverTime) > 0)exitWith{};
	if((player distance _CurTarget) > 5)exitWith{};
	if((player distance _TargetTruck) > 5)exitWith{};
	if(isNull _CurTarget)exitWith{};
	if(isNull _TargetTruck)exitWith{};
	
	deleteVehicle _CurTarget;
	_TargetTruck addMagazineCargoGlobal ["D41_Meth1", 2];