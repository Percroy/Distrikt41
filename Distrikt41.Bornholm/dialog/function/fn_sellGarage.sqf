#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price","_action"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

/*_action = [
	format["Möchtest Du dein Auto wirklich verkaufen?","D41"],"Fahrzeug verkaufen","Ja","Nein"
	] call BIS_fnc_guiMessage;

	if(_action) then
	{*/
		if(side player == west) exitWith {hint "Du kannst als Polizist keine Fahrzeuge verkaufen!"};
		if(isNil "_vehicle") exitWith {hint "Fehler bei der Auswahl..."};
		if(D41_GaragenVerkauf == 1) exitWith {hint "Du verkaufst bereits ein Fahrzeug."; diag_Log format [":::::::::::::::::::::::::::::: VERMEINTLICHER BUGUSING ALARM: Spieler %1 - PlayerUID: %2",player, _pid];};
		D41_GaragenVerkauf = 1;
		_price = [_vehicle,__GETC__(life_garage_sell)] call TON_fnc_index;
		if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_sell) select _price) select 1;};

		[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] call life_fnc_MP;
		[[1,format[localize "Fahrzeug verkauft",_price]],"life_fnc_broadcast",player,false] call life_fnc_MP;
		D41_atmGeld = D41_atmGeld + _price;

		closeDialog 0;
		D41_GaragenVerkauf = 0;
	/*};*/