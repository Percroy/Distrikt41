//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_UnLoadCargo.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Container vom Anhänger abladen (Postion: ca 8,5m hinter Anhänger) und vorher eingelagertes in den Container legen
//::::::::::::  ::::::::::::\\

private["_Anhaenger","_exit0","_mtwPos","_pos","_list","_ToArray","_title","_ui","_progressBar","_titleText","_cP","_cpRate","_exit1","_exit2","_exit3","_SecCheck","_LoadingArea","_NearBuilding","_Container","_Gear","_GearMags","_GearMagsAmnt","_GearWpns","_GearWpnsAmnt","_GearItems","_GearItemsAmnt","_Item","_Amnt"];

	if(life_action_inUse)exitWith{hint localize "STR_D41_doing_something"};
	_Anhaenger = cursorTarget;
	if(!(_Anhaenger isKindOf "D41_Trailer_A"))exitWith{hint "Kein Trailer in Sicht."};
	
	_exit0 = false;
	{
		_LoadingArea = nearestObjects [(_Anhaenger modelToWorld _x), ["Man","Car","Truck","Air","Tank","Ship"], 5];
		if(count(_LoadingArea) > 0)exitWith{_exit0 = true;};
		
		_mtwPos = (_Anhaenger modelToWorld _x);
		_pos = [_mtwPos select 0, _mtwPos select 1,0];
		_list = nearestObjects [_pos,[],5];
		{
			_Item = str(_list select _ForEachIndex);
			_ToArray = toArray(_Item);
			if((_ToArray select 0) != 78)then
			{
				if((_ToArray select 0) != 66)then{_exit0 = true};
			};
		}forEach _list;
	}forEach [[0,-20,0],[0,-15,0],[0,-10,0]];
	
	disableSerialization;
	_title = localize "STR_D41_ActContainerAbladen";
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNamespace getVariable "life_progress";
	_progressBar = _ui displayCtrl 38201;
	_titleText = _ui displayCtrl 38202;
	_titleText ctrlSetText format["%2 (1%1)...","%",_title];
	_progressBar progressSetPosition 0.01;
	_cP = 0.01;
	_cpRate = 0.033;
	
	life_action_inUse = true;
	life_interrupted = false;
	[] spawn life_fnc_D41_AnimLoop;
	
	_exit1 = false;
	_exit2 = false;
	_exit3 = false;
	
	while {true} do
	{
		sleep 1;
		if(isNull _ui) then
		{
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNamespace getVariable "life_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
		};
		_cP = _cP + _cpRate;
		_progressBar progressSetPosition _cP;
		_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		
		if(_cP >= 1 OR !alive player) exitWith {};
		
		if(life_istazed) exitWith {};
		if((player getVariable["restrained",false])) exitWith {};
		if(life_interrupted) exitWith {};
		if((_Anhaenger animationPhase "HideCargo") != -1)exitWith{_exit1 = true; life_interrupted = true;};
		if((_Anhaenger animationPhase "ParkStuetze") != 1)exitWith{_exit1 = true; life_interrupted = true;};
		if((speed _Anhaenger) > 1)ExitWith{_exit3 = true;life_interrupted = true;};
	};
	
	//Kill the UI display and check for various states
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	
	if(_exit1)exitWith{life_action_inUse = false; hint "Doof? Wenn nix drauf, dann nix abladen (Warum wird Dir das eigtl. angezeigt?????)"};
	if(_exit2)exitWith{life_action_inUse = false; hint "Wenn Parkstützen nicht draußen, Anhänger kann nicht parken. Logisch, oder?"};
	if(_exit3)ExitWith{life_action_inUse = false; hint "Andere nicht fahren mit Anhänger, wenn Du rumfummeln an Anhänger! Nix gut!"};
	if(life_interrupted) exitWith {life_action_inUse = false; life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};
	if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
	if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
	
	life_action_inUse = false;
	
	
	_Container = "D41_CargoContainer_Orange" createVehicle [0,0,0];
	waitUntil{!isNull _Container};
	
	_Container setDir ((getDir _Anhaenger)-90);
	_Container setVectorUp (surfaceNormal (_Anhaenger modelToWorld [0,-15,1]));
	
	_Anhaenger animate ["HideCargo", 0];
	waitUntil{_Anhaenger animationphase "HideCargo" == 0};
	
	_Gear = [];
	_GearMag = getmagazineCargo _Anhaenger;
	_Gear pushback _GearMag;
	clearMagazineCargoGlobal _Anhaenger;
	_GearWpn = getWeaponCargo _Anhaenger;
	_Gear pushback _GearWpn;
	clearWeaponCargoGlobal _Anhaenger;
	_GearItm = getItemCargo _Anhaenger;
	_Gear pushback _GearItm;
	clearItemCargoGlobal _Anhaenger;
	
	_GearMags = _Gear select 0 select 0;
	_GearMagsAmnt = _Gear select 0 select 1;
	_GearWpns = _Gear select 1 select 0;
	_GearWpnsAmnt = _Gear select 1 select 1;
	_GearItems = _Gear select 2 select 0;
	_GearItemsAmnt = _Gear select 2 select 1;
	
	{
		_Item = _GearMags select _forEachIndex;
		_Amnt = _GearMagsAmnt select _forEachIndex;
		_Container addMagazineCargoGlobal [_Item,_Amnt];
	}forEach _GearMags;
	
	{
		_Item = _GearWpns select _forEachIndex;
		_Amnt = _GearWpnsAmnt select _forEachIndex;
		_Container addWeaponCargoGlobal [_Item,_Amnt];
	}forEach _GearWpns;
	
	{
		_Item = _GearItems select _forEachIndex;
		_Amnt = _GearItemsAmnt select _forEachIndex;
		_Container addItemCargoGlobal [_Item,_Amnt];
	}forEach _GearItems;
	
	
	_OrigContainerOwner = _Anhaenger getVariable["Orig_vehicle_info_owners",[]];
	_OrigContainerDBInfo = _Anhaenger getVariable["Orig_dbInfo",[]];
	
	_Container setVariable["vehicle_info_owners",_OrigContainerOwner,true];
	_Container setVariable["dbInfo",_OrigContainerDBInfo,true];
	
	[_Container] spawn
	{
		_Container = _this select 0;
		_Container allowDamage false;
		_Container addEventhandler ["handleDamage",{false}];
		sleep 5;
		_Container allowDamage true;
		_Container removeallEventHandlers "handleDamage";
	};
	
	_Container setPos (_Anhaenger modelToWorld [0,-15,1]);
	[_Anhaenger] spawn D41_fnc_gewichtssys;
	hint "Container abgeladen";