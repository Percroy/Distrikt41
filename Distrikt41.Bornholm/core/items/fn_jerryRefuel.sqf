/*
	File: fn_jerryRefuel.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState"];
_vehicle = cursorTarget;
closedialog 0;
life_interrupted = false;
if(isNull _vehicle) exitWith {hint localize "STR_ISTR_Jerry_NotLooking"};
if (!local _vehicle) exitWith {hint localize "STR_D41_GetInCarFirst";};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {hint localize "STR_ISTR_Jerry_NotNear"};

life_action_inUse = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
//_displayName = [_vehicle] call life_fnc_D41_GetVehName; //Will gerade nicht

_upp = format[localize "STR_ISTR_Jerry_Process",_displayName];
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
[] spawn life_fnc_D41_AnimLoop;

while{true} do
{
	sleep 0.2;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_interrupted) exitWith {};
};
life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};


switch (true) do
{
	case (!("D41_BenzinKanister" in (magazines player))): {hint localize "STR_D41_No_Bugusing"};
	
	case (_vehicle isKindOF "LandVehicle"):
	{
		if (!local _vehicle) exitWith {hint localize "STR_D41_last_driver";};
		_vehicle setFuel ((Fuel _vehicle) + 0.5);
		player removeMagazine "D41_BenzinKanister";
		player addMagazine "D41_BenzinKanisterLeer";
	};
	
	case (_vehicle isKindOf "Air"):
	{
		if (!local _vehicle) exitWith {hint localize "STR_D41_last_driver";};
		_vehicle setFuel ((Fuel _vehicle) + 0.2);
		player removeMagazine "D41_BenzinKanister";
		player addMagazine "D41_BenzinKanisterLeer";
	};
	
	case (_vehicle isKindOf "Ship"):
	{
		if (!local _vehicle) exitWith {hint localize "STR_D41_last_driver";};
		_vehicle setFuel ((Fuel _vehicle) + 0.35);
		player removeMagazine "D41_BenzinKanister";
		player addMagazine "D41_BenzinKanisterLeer";
	};
};
titleText[format[localize "STR_ISTR_Jerry_Success",_displayName],"PLAIN"];