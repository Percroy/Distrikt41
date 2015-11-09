#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Raids the players house?
*/
private["_house","_playerid","_cpRate","_cP","_title","_titleText","_ui","_houseInvData","_houseInvVal"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};
if(isNil {[_house, "Alles"] call life_fnc_D41_GetHouseInfos}) exitWith {hint localize "STR_House_Raid_NoOwner"};

_playerid = [_house, "house_ownerPID"] call life_fnc_D41_GetHouseInfos;
//if(!([_playerid] call life_fnc_isUIDActive)) exitWith {hint localize "STR_House_Raid_OwnerOff"};
_Raiding = [_house, "locked"] call life_fnc_D41_GetHouseInfos;
if(_Raiding)exitWith{hint localize "STR_D41_OpenDoor_Before_Raid"};

life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_House_Raid_Searching";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.001;

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
	if(player distance _house > 13) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
if(player distance _house > 13) exitWith {life_action_inUse = false; titleText[localize "STR_House_Raid_TooFar","PLAIN"]};
if(!alive player) exitWith {life_action_inUse = false;};

	_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;
	_HouseInfos set[3,false]; //Locked = false
	_house setVariable["House_Infos",_HouseInfos,true];

_numberOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
if(_numberOfDoors == -1 OR _numberOfDoors == 0) exitWith {}; //MEH
for "_i" from 1 to _numberOfDoors do
{
	_house animate[format["door_%1_rot",_i],1];
};

life_action_inUse = false;

hint localize "STR_D41_House_Raided";