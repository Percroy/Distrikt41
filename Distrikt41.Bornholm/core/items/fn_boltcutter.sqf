/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui","_playerid"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _building) exitWith {};

if(_building in [waka01,waka02,waka03])exitWith{hint localize "STR_D41_noDoor"};
if(!((typeOf _building) in D41_HausArray) && !(_building in [zelle01,zelle02,zelle03,zelle04,fed_bank_building])) exitWith {hint localize "STR_D41_noDoor"};

if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

if((_building == fed_bank_building) && {side _x == west} count playableUnits < 8) exitWith {hint localize"STR_D41_Not_Enoguh_Cops"};

if((player distance fed_bank_building) < 30) then
{
	[[[0,1,2],"STR_ISTR_Bolt_AlertFed",true,[]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	if(playerside == civilian)then{ [[getPlayerUID player,profileName,"30"],"life_fnc_wantedAdd",false,false] call life_fnc_MP; };
}
else
{
	_getOut = false;
	if(!(_building isKindOf "Land_Medevac_house_V1_F") && !(_building isKindOf "Land_Cargo_House_V3_F") && !(_building isKindOf "Land_Offices_01_V1_F"))then
	{
		_playerid = [_building, "house_ownerPID"] call life_fnc_D41_GetHouseInfos;
		if(_playerid isEqualTo "KeineDaten")exitWith{diag_log format ["::::::::: FEHLER: boltcutter: isNil _playerid: _building: %1", _building];};
		if(!([_playerid] call life_fnc_isUIDActive)) exitWith {_getOut = true;};
	};
	if(_getOut)exitWith{hint localize "STR_House_Break_OwnerOff"};
	[[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	if(playerside == civilian)then{ [[getPlayerUID player,profileName,"459"],"life_fnc_wantedAdd",false,false] call life_fnc_MP; };
};
_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
	if(player distance _worldSpace < 5) exitWith {_door = _i;};
};

if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.

life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
[] spawn life_fnc_D41_AnimLoop;

switch (typeOf _building) do {
	case "Land_MilOffices_V1_F": {_cpRate = 0.003;};
	case "Land_Medevac_house_V1_F": {_cpRate = 0.01;};
	case "Land_Offices_01_V1_F" : {_cpRate = 0.005};
	case "Land_Cargo_House_V3_F": {_cpRate = 0.0001;};
	default {_cpRate = 0.002;}
};


while {true} do
{
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;
if(life_boltcutter_uses >= 3) then
{
	player removeMagazine "D41_Bolzenschneider";
	life_boltcutter_uses = 0;
};

_doors = 1;
_doors = getNumber(configFile >> 'CfgVehicles' >> (typeOf _building) >> 'NumberOfDoors');
_DoorList = [];
for '_i' from 1 to _doors do
	{
		_selPos = _building selectionPosition format['Door_%1_Trigger',_i];
		_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) then {_DoorList pushback _i;};
	};
	if(count(_DoorList) == 0)exitWith{};
		
	if(_building animationPhase format['door_%1_rot',_DoorList select 0] < 1) then	{{_building animate[format['door_%1_rot',_x],1];}forEach _DoorList;}
	else																		{{_building animate[format['door_%1_rot',_x],0];}forEach _DoorList;};

[-20,0] call life_fnc_D41_KSys;