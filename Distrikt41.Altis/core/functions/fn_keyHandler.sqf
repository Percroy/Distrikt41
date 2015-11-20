/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
private ["_ButtonDisabled","_shift","_alt","_button","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_button = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_ButtonDisabled = false;

_IsWest = false;
if(playerside in [west])then{_IsWest = true};
			
_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _button;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_button in (actionKeys "GetOver") || _button in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _button in _interruptionKeys) then {life_interrupted = true;};
	_ButtonDisabled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith
{
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then
	{
		[] spawn 
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};


	//Space key for Jumping
	if(_button isEqualTo 57) then
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then
		{
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution 
			_ButtonDisabled = true;
		};
	};
	
	//Map Key
	if(_button isEqualTo _mapKey) then
	{
		switch (playerSide) do 
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
		};
	};
	
	//Holster / recall weapon.
	if(_button isEqualTo 35) then
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};
	// Check Ammo = Shift + T
	if(_button isEqualTo 20) then
	{
		if(_shift && currentWeapon player != "") then 
		{
			if(_shift && alive player && !(player getVariable "Escorting") && !(player getVariable "restrained") && !(player getVariable "transporting") && !life_istazed && !life_knockout && vehicle player == player) then
				{
					[] spawn life_fnc_checkAmmo;
				};
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(_button isEqualTo _interactionKey) then
	{
		if(!life_action_inUse) then
		{
			[] spawn 
			{
				_handle = [] spawn life_fnc_actionKeyHandler;
				private["_handle"];
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	//Restraining (Shift + R)
	if(_button isEqualTo 19) then
	{
		if(_shift) then {_ButtonDisabled = true;};
		if(_shift && _IsWest && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
			[cursorTarget] joinSilent (createGroup civilian);
			hint localize "STR_D41_arrested";
		};
	};

	//Shift+O Zipties ( Civilians can restrain )
	if(_button isEqualTo 24) then
	{
		if(_shift) then {_ButtonDisabled = true;};
		if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			if(side player == civilian && !("D41_Kabelbinder" in (magazines player))) exitWith {hint localize "STR_D41_No_CableTie"};
			if(side player != civilian)exitWith {};
			if(cursorTarget getVariable "D41_geknueppelt")then
			{
				[] call life_fnc_restrainAction;
				if(side cursorTarget in [civilian]) then {[cursorTarget] joinSilent (createGroup civilian);};
			};
		};
	};

	//Shift + G -- Knock out, this is experimental and yeah...
	if(_button isEqualTo 34) then
	{
		if(_shift) then
		{
			_ButtonDisabled = true;
		};
		if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
		};
	};

	//L Key?
	if(_button isEqualTo 38) then
	{
		if(_IsWest) then
		{
			if(!_alt && !_ctrlKey) then
			{
				[] call life_fnc_radar;
			};
		};
	};
	
	//CustomMenu
	//Taste Z
	if(_button isEqualTo 21) then
	{
		if(player getVariable "restrained" && player getVariable "D41_geknueppelt" && player getVariable "surrender") exitWith {hint "Du hast Deine Hände nicht frei!"};
		[cursorTarget] call life_fnc_combat; [] call life_fnc_hudUpdate;
	};
	
	//F Key
	if(_button isEqualTo 33) then
	{
		if(playerSide in [civilian] && vehicle player isKindOf "D41_Trawler" && (driver vehicle player == player)) then
		{
			[] spawn
			{
				if(D41_TrawlerHorn) exitWith {};
				D41_TrawlerHorn = true;
				_veh = vehicle player;
				[[_veh],"life_fnc_D41_trawler_horn",nil,true] call life_fnc_MP;
				sleep 15;
				D41_TrawlerHorn = false;
			};
		};
	};
	
	if(_button isEqualTo 62) then //F4 - Zivi: Halt stehen bleiben, Überfall! //Pol: Halt stehen bleiben, Polizei! 
	{
		if(_shift) then {_ButtonDisabled = true;};

		if (_shift) then
		{
			if (!(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if(_IsWest)then
				{
					[1] spawn life_fnc_D41_ChatMsgPrep;
				}
				else
				{
					[2] spawn life_fnc_D41_ChatMsgPrep;
				};
			};
		};
	};
	
	if(_button isEqualTo 63) then //F5 - Fahrzeug sofort stoppen und aussteigen! 
	{
		if(_shift) then {_ButtonDisabled = true;};

		if (_shift) then
		{
			if (!(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				[3] spawn life_fnc_D41_ChatMsgPrep;
			};
		};
	};
	
	if(_button isEqualTo 64) then //F6 - Sofort ergeben und die Waffe weg oder wir schießen!
	{
		if(_shift) then {_ButtonDisabled = true;};

		if (_shift) then
		{
			if (!(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				[4] spawn life_fnc_D41_ChatMsgPrep;
			};
		};
	};
	
	if(_button isEqualTo 65) then //F7 - "Ich ergebe Mich" inkl. Waffen weglegen
	{
		if(_shift) then {_ButtonDisabled = true;};

		if (_shift) then
		{
			if (!(player getVariable ["restrained", false])) then
			{
				[5] spawn life_fnc_D41_ChatMsgPrep;
			};
		};
	};
	
	
	if(_button isEqualTo 66) then //F8 - Nur Aufgeben inkl. Hände über Kopf
	{
		if (_shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else
				{
					[] spawn life_fnc_surrender;
				};
			};
			_ButtonDisabled = true;
		};
	};
	
	//U Key
	if(_button isEqualTo 22) then
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player == player) then	{_veh = cursorTarget;}
			else								{_veh = vehicle player;};
			if((typeOf _veh) in D41_HausArray && playerside == civilian)exitWith{};
			
			_locked = locked _veh;
			if(player getVariable "restrained") exitWith {hint localize "STR_D41_Tim_Magician"};
			if(_veh in life_vehicles && ((typeOf _veh) != "D41_CargoContainer_Orange") && player distance _veh < 8 OR vehicle player == _veh) then
			{
				if(_locked == 2) then
				{
					if(local _veh) then
					{
						_veh lock 0;
					}
					else
					{
						[[_veh,0],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
					};
					systemChat localize "STR_MISC_VehUnlock";
					[[_veh],"life_fnc_UnLockCarSound",true,false] call life_fnc_MP;
				}
				else
				{
					if(local _veh) then
					{
						_veh lock 2;
					}
					else
					{
						[[_veh,2],"life_fnc_lockVehicle",_veh,false] call life_fnc_MP;
					};	
					systemChat localize "STR_MISC_VehLock";
					[[_veh],"life_fnc_LockCarSound",true,false] call life_fnc_MP;
				};
			};
		};
	};
	
	if(_button in actionKeys 'TacticalView')then
	{	_ButtonDisabled = true;
		systemchat localize 'STR_D41_Tactical_View';
	};
	
	if(_button isEqualTo 41)then
	{
		_ButtonDisabled = true;
		if(_alt)exitWith{_ButtonDisabled = false; systemchat 'Alt + Circumflex = Alle Einheiten ausgewählt';};
		
		private['_house','_doors','_DoorList','_HouseSold','_HousePos'];
		_house = cursorTarget;
		
		if(_house in [waka01,waka02,waka03] && (!_IsWest OR ((call life_coplevel) < 5)))exitWith{};
		if(_house in [CopRoenne,fed_bank_building,zelle01,zelle02,zelle03,zelle04] && !_IsWest)exitWith{};
		if(!((typeOf _house) in D41_HausArray) && !(_house isKindOf 'House_F') && !(_house isKindOf 'Wall_F'))exitWith{};
		
		_HouseSold = false;
		_HousePos = getPosATL _house;
		{
			if(str(_x) isEqualTo str(_HousePos))exitWith{_HouseSold = true};
		}forEach D41_HausListe;
		
		_DoorBlocked = false;
		if(_HouseSold)then
		{
			if(_house in life_vehicles)exitWith{_DoorBlocked = false};
			_DoorBlocked = true;
		};
		if(_DoorBlocked)exitWith{systemchat 'House is sold'};
		
		_doors = 1;
		_doors = getNumber(configFile >> 'CfgVehicles' >> (typeOf _house) >> 'NumberOfDoors');
		_DoorList = [];
		for '_i' from 1 to _doors do
		{
			_selPos = _house selectionPosition format['Door_%1_Trigger',_i];
			_worldSpace = _house modelToWorld _selPos;
			if(player distance _worldSpace < 2) then {_DoorList pushback _i;};
		};
		if(count(_DoorList) == 0)exitWith{};
		
		if(_house animationPhase format['door_%1_rot',_DoorList select 0] < 1) then	{{_house animate[format['door_%1_rot',_x],1];}forEach _DoorList;}
		else																		{{_house animate[format['door_%1_rot',_x],0];}forEach _DoorList;};
	};
	
	if(_button in actionKeys 'CommandingMenu1')then
	{	_ButtonDisabled = true;
		if(playerSide in [west,independent]) then
		{
			_veh = vehicle player;
			if((typeOf _veh) in ['D41_Offroad_ADAC3','D41_Offroad_ADAC2','D41_Offroad_ADAC','D41_B_HMMWV_Medevac','D41_Offroad_Medic2','D41_Offroad_Medic','D41_S1203_Civ_02','D41_Lada_Civ_05','D41_Offroad_Pol','D41_BMW_X6M_Pol2','D41_B_Truck_01_ammo_cop','D41_Offroad_Snake_TFuel_TPS','D41_Offroad_SWAT','D41_tigr_swat','D41_Lada_Civ_05_tuned','D41_swat_hunter']) then
			{
				titleText [localize 'STR_D41_emergency_lights','PLAIN']; [_veh] call life_fnc_sirenLights;
			};
		};
	};
	
	if(_button in actionKeys 'CommandingMenu2')then
	{	_ButtonDisabled = true;
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable 'siren'}) then {_veh setVariable['siren',false,true];};
			if((_veh getVariable 'siren')) then
			{
				titleText [localize 'STR_D41_Siren','PLAIN'];
				_veh setVariable['siren',false,true];
			}
				else
			{
				titleText [localize 'STR_D41_Siren','PLAIN'];
				_veh setVariable['siren',true,true];
				if(_IsWest) then
				{
					[[_veh],'life_fnc_copSiren',nil,true] call life_fnc_MP;
				}
				else
				{
					[[_veh],'life_fnc_medicSiren',nil,true] call life_fnc_MP;
				};
			};
		};
	};
	
	if(_button in actionKeys 'CommandingMenu3')then{_ButtonDisabled = true;};
	if(_button in actionKeys 'CommandingMenu4')then{_ButtonDisabled = true;};
	if(_button in actionKeys 'CommandingMenu5')then{_ButtonDisabled = true;};
	if(_button in actionKeys 'CommandingMenu6')then{_ButtonDisabled = true;};
	if(_button in actionKeys 'CommandingMenu7')then{_ButtonDisabled = true;};
	if(_button in actionKeys 'CommandingMenu8')then{_ButtonDisabled = true;};
	if(_button in actionKeys 'CommandingMenu9')then{_ButtonDisabled = true;};
	if(_button in actionKeys 'CommandingMenu0')then{_ButtonDisabled = true;};
	
	if(_button in actionKeys 'SelectGroupUnit1')then
	{	_ButtonDisabled = true;
		if(!D41_EarPlugInUse)	exitWith{[1] spawn life_fnc_D41_EarPlug};
		if(D41_EarPlugInUse)	exitWith{[0] spawn life_fnc_D41_EarPlug};
	};
	
	if((_button in actionKeys 'SelectGroupUnit2'))then{_ButtonDisabled = true;};
	if((_button in actionKeys 'SelectGroupUnit3'))then{_ButtonDisabled = true;};
	if((_button in actionKeys 'SelectGroupUnit4'))then
	{
		
		if (!(player getVariable ['restrained', false]) && (animationState player) != 'Incapacitated' && !life_istazed) then
		{	_ButtonDisabled = true;
			if(_IsWest)then
			{
				[1] spawn life_fnc_D41_ChatMsgPrep;
			}
			else
			{
				[2] spawn life_fnc_D41_ChatMsgPrep;
			};
		};
	};
	
	if((_button in actionKeys 'SelectGroupUnit5'))then
	{	_ButtonDisabled = true;
		if (!(player getVariable ['restrained', false]) && (animationState player) != 'Incapacitated' && !life_istazed) then
		{
			[3] spawn life_fnc_D41_ChatMsgPrep;
		};
	};
	
	if((_button in actionKeys 'SelectGroupUnit6'))then
	{	_ButtonDisabled = true;
		if (!(player getVariable ['restrained', false]) && (animationState player) != 'Incapacitated' && !life_istazed) then
		{
			[4] spawn life_fnc_D41_ChatMsgPrep;
		};
	};
	
	if((_button in actionKeys 'SelectGroupUnit7'))then
	{	_ButtonDisabled = true;
		if (!(player getVariable ['restrained', false])) then
		{
			[5] spawn life_fnc_D41_ChatMsgPrep;
		};
	};
	
	if((_button in actionKeys 'SelectGroupUnit8'))then
	{	_ButtonDisabled = true;
		if (vehicle player == player && !(player getVariable ['restrained', false]) && (animationState player) != 'Incapacitated' && !life_istazed) then
		{
			if (player getVariable ['surrender', false]) then
			{
				player setVariable ['surrender', false, true];
			} else
			{
				[] spawn life_fnc_surrender;
			};
		};
	};
	
	
	if((_button in actionKeys 'SelectGroupUnit9'))then{_ButtonDisabled = true;};
	if((_button in actionKeys 'SelectGroupUnit0'))then{_ButtonDisabled = true;};
	
_ButtonDisabled;