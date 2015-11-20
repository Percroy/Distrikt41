/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	N/A
*/
private["_MedIsOnline","_Done"];

_MedIsOnline = false;
{
	if(side _x == independent)then
	{
		_IsMed = _x getVariable["IsMedic",false];
		if(_IsMed)then
		{
			_MedIsOnline = true;
		};
	};
}forEach playableUnits;

_Done = true;
if(_MedIsOnline) then
{
	//There is medics let's send them the request.
	if(D41_MedReqDone)exitWith{((findDisplay 7300) displayCtrl 7303) ctrlEnable false;};
	[[life_corpse,profileName],"life_fnc_medicRequest",independent,FALSE] call life_fnc_MP;
	_Done = false;
	D41_MedReqDone = true;
};
//Bereits gerufen? Knopf kann aus! (Grund: Nicht nochmal den Timer starten!)
if(D41_MedReqDone && _done)exitWith{((findDisplay 7300) displayCtrl 7303) ctrlEnable false;};

//Create a thread to monitor duration since last request (prevent spammage).
[] spawn 
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	D41_MedReqDone = true;
	uisleep 120;
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
	D41_MedReqDone = false;
};