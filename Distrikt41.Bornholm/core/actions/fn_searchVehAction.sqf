/*
	File: fn_searchVehAction.sqf
*/
private["_vehicle","_data"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then
{
	_owners = _vehicle getVariable "vehicle_info_owners";
	
	life_action_inUse = true;
	hint localize "STR_NOTF_Searching";
	sleep 3;
	life_action_inUse = false;
	if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {hint localize "STR_NOTF_SearchVehFail";};

	_owners = [_owners] call life_fnc_vehicleOwners;
	
	if(_owners == "any<br/>") then
	{
		_owners = "No Owner<br/>";
	};
	hint parseText format[localize "STR_NOTF_SearchVeh",_owners];
};