/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil
{
	_nearby = if(([independent,getPosATL player,120] call life_fnc_nearUnits)) then{"Yes"} else {"No"};
	_Result = "No";
	{
		if(side _x == independent)then
		{
			_IsMed = _x getVariable["IsMedic",false];
			if(_IsMed)then
			{
				_Result = "Yes";
				if(D41_MedReqDone)exitWith{((findDisplay 7300) displayCtrl 7303) ctrlEnable false;};
				((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
			};
		};
	}forEach playableUnits;
	
	_medicsOnline ctrlSetText format[localize "STR_Medic_Online",_Result];
	_medicsNear ctrlSetText format[localize "STR_Medic_Near",_nearby];
	sleep 1;
	(isNull (findDisplay 7300))
};