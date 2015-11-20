//::::::::::::  ::::::::::::\\
//	Filename: life_server/Functions/D41/D41_randomBlitze.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Erzeugt Blitze boom boom in Random Area!
//::::::::::::  ::::::::::::\\
private["_CreateBlitze","_BlitzOrt"];

_CreateBlitze =
{
	_BlitzRadius = 0;
	if(worldName == "Bornholm")then {_BlitzRadius = 8000;};
	if(worldName == "Altis")then {_BlitzRadius = 13000;};
	_BlitzOrt = createVehicle ["GroundWeaponHolder", getMarkerPos "D41_MapCenter", ["D41_MapCenter"], _BlitzRadius, "NONE"];
	//civ_1 setPos [getPos _BlitzOrt select 0, (getPos _BlitzOrt select 1) + 100, 0.5];
	//civ_2 setPos [(getPos _BlitzOrt select 0) + 2, (getPos _BlitzOrt select 1) + 100, 0.5];
	[[_BlitzOrt],"life_fnc_D41_WetterBlitz",true,false] call life_fnc_MP;
	_nul = [_BlitzOrt, nil, true] spawn D41_fnc_D41Lightning;
	sleep 1;
	deleteVehicle _BlitzOrt;
};

while{true}do
{
	waitUntil {sleep 1; (D41_Blitze == 1)};
	[] spawn _CreateBlitze;
	sleep 45;
};