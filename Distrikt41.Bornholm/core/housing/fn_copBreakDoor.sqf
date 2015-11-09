/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Allows cops to 'kick' in the door?
*/
private["_house","_door","_title","_titleText","_progressBar","_cpRate","_cP","_playerid"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {[_house, "Alles"] call life_fnc_D41_GetHouseInfos}) exitWith {hint localize "STR_House_Raid_NoOwner"};

_playerid = [_house, "house_ownerPID"] call life_fnc_D41_GetHouseInfos;
if(!([_playerid] call life_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"};

_door = [_house] call life_fnc_nearestDoor;
if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"};

life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_House_Raid_Progress";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.002;
[] spawn life_fnc_D41_AnimLoop;

[[2,"STR_House_Raid_NOTF",true,[([_house, "house_ownerName"] call life_fnc_D41_GetHouseInfos)]],"life_fnc_broadcast",true,false] call life_fnc_MP;

while {true} do
{
	uisleep 0.6;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_action_inUse = false;
_numberOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
if(_numberOfDoors == -1 OR _numberOfDoors == 0) exitWith {}; //MEH
for "_i" from 1 to _numberOfDoors do
{
	_house animate[format["door_%1_rot",_i],1];
};

_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;
_HouseInfos set[5,true]; //Set CopRaid Var
_house setVariable["House_Infos",_HouseInfos,true];