//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_LoadCargo.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Container auf den Anhänger laden (Position von Container muss hinter Anhänger sein) und eingelagerte Items in die Variable "CargoGear" eintragen
//::::::::::::  ::::::::::::\\

private["_Anhaenger","_SecCheck","_CargoContainer","_Gear","_GearMag","_GearWpn","_GearItm"];

	if(life_action_inUse)exitWith{hint localize "STR_D41_doing_something"};
	_Anhaenger = cursorTarget;
	_CargoContainer = nearestObjects [(_Anhaenger modelToWorld [0,-15,1]), ["D41_CargoContainer_Orange"], 4];
	if(count(_CargoContainer) < 1)exitWith{hint "Nix Container hinter Anhänger, nix aufladen."};
	_CargoContainer = _CargoContainer select 0;
	
	if(!(_Anhaenger isKindOf "D41_Trailer_A"))exitWith{hint "Schau hin, was Du machst! Depp!"};
	
	
	disableSerialization;
	_title = localize "STR_D41_ActContainerAufladen";
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
		if((_Anhaenger animationPhase "HideCargo") != 0)exitWith{_exit1 = true; life_interrupted = true;};
		if((_Anhaenger animationPhase "ParkStuetze") != 1)exitWith{_exit2 = true;life_interrupted = true;};
		if((speed _Anhaenger) > 1)ExitWith{_exit3 = true;life_interrupted = true;};
	};
	
	//Kill the UI display and check for various states
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	
	if(_exit1)exitWith{life_action_inUse = false; hint "Mach ma die Glotzen auf! Der Anhänger ist schon beladen!"};
	if(_exit2)exitWith{life_action_inUse = false; hint "Wenn Parkstützen nicht draußen, Anhänger kann nicht parken. Logisch, oder?"};
	if(_exit3)ExitWith{life_action_inUse = false; hint "Andere nicht fahren mit Anhänger, wenn Du rumfummeln an Anhänger! Nix gut!"};
	if(isNull _CargoContainer)exitWith{life_action_inUse = false; hint "Container schon aufgeladen! Warste zu langsam, wa?"};
	if(life_interrupted) exitWith {life_action_inUse = false; life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};
	if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
	if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
	
	life_action_inUse = false;

	_Gear = [];
	_GearMag = getmagazineCargo _CargoContainer;
	_Gear pushback _GearMag;
	_GearWpn = getWeaponCargo _CargoContainer;
	_Gear pushback _GearWpn;
	_GearItm = getItemCargo _CargoContainer;
	_Gear pushback _GearItm;

	_OrigContainerOwner = _CargoContainer getVariable["vehicle_info_owners",[]];
	_OrigContainerDBInfo = _CargoContainer getVariable["dbInfo",[]];
	
	deleteVehicle _CargoContainer;

	_Anhaenger setVariable["Orig_vehicle_info_owners",_OrigContainerOwner,true];
	_Anhaenger setVariable["Orig_dbInfo",_OrigContainerDBInfo,true];


	_GearMags = _Gear select 0 select 0;
	_GearMagsAmnt = _Gear select 0 select 1;
	_GearWpns = _Gear select 1 select 0;
	_GearWpnsAmnt = _Gear select 1 select 1;
	_GearItems = _Gear select 2 select 0;
	_GearItemsAmnt = _Gear select 2 select 1;

	{
		_Item = _GearMags select _forEachIndex;
		_Amnt = _GearMagsAmnt select _forEachIndex;
		_Anhaenger addMagazineCargoGlobal [_Item,_Amnt];
	}forEach _GearMags;

	{
		_Item = _GearWpns select _forEachIndex;
		_Amnt = _GearWpnsAmnt select _forEachIndex;
		_Anhaenger addWeaponCargoGlobal [_Item,_Amnt];
	}forEach _GearWpns;

	{
		_Item = _GearItems select _forEachIndex;
		_Amnt = _GearItemsAmnt select _forEachIndex;
		_Anhaenger addItemCargoGlobal [_Item,_Amnt];
	}forEach _GearItems;

	_Anhaenger animate ["HideCargo", -1];
	waitUntil{_Anhaenger animationphase "HideCargo" == -1};

	[_Anhaenger] spawn D41_fnc_gewichtssys;
	hint "Container aufgeladen";