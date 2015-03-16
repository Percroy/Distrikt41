/*
	File: fn_D41_GetRentDate.sqf
	Author: Distrikt41 - Dscha

	Description:
	query rent time of house (blub - i hate writing descriptions in english! -.-)
*/
private["_house","_house2","_mode","_player","_D41_MietZeit","_D41_Umrechnung","_houseCfg","_action"];
_house = _this select 0;
_mode = _this select 1;
_house2 = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_player = player;
_RentDateCheck = false;

diag_log format ["::::::::::::::::::::::::: fn_D41_GetRentDate _house: %1", _house];
diag_log format ["::::::::::::::::::::::::: fn_D41_GetRentDate _mode: %1", _mode];
diag_log format ["::::::::::::::::::::::::: fn_D41_GetRentDate _house2: %1", _house2];
diag_log format ["::::::::::::::::::::::::: fn_D41_GetRentDate _player: %1", _player];


if(_mode == 0) then
{
	[[_house, _player,0],"D41_fnc_queryHouseRent",true,false] call life_fnc_MP;
	hint "Der Mieterbund schaut in seine Unterlagen...";
	sleep 2;
	D41_MietUmrechnung = 0;
	D41_Tage = 0;
	_D41_MietZeit = player getVariable["D41_MietZeit",[0]];
	_D41_Umrechnung = (_D41_MietZeit select 0)*4;
	if(isNil "_D41_Umrechnung") exitwith {_RentDateCheck = true;};
	D41_MietUmrechnung = _D41_Umrechnung;
	while{true} do 
		{
			if(D41_MietUmrechnung <= 23) exitWith {};
			if(D41_MietUmrechnung >= 24) then {D41_Tage = D41_Tage + 1;};
			D41_MietUmrechnung = D41_MietUmrechnung - 24;
		};
	diag_log format [":::::::::::::::: fn_D41_GetRentDate D41_Tage = %1  || D41_MietUmrechnung(Stunden) = %2",D41_Tage, D41_MietUmrechnung];
	hint format ["Verbleibende Mietzeit: %1 Tag(e) und %2 Stunde(n)",D41_Tage, D41_MietUmrechnung];
};

if(_mode == 1) then
{
	_houseCfg = [(typeOf _house2)] call life_fnc_houseConfig;
	if(isNull _house2) exitWith {};
	if(count _houseCfg == 0) exitWith {};
	_action = [
	format["Die Mietkosten für weitere 7 Tage belaufen sich auf <t color='#8cff9b'>€%1</t>.<br/> Möchtest Du die Miete zahlen?",
	[(_houseCfg select 0)] call life_fnc_numberText],"Miete","Miete zahlen","Abbrechen"
	] call BIS_fnc_guiMessage;

	if(_action) then
	{
		D41_MietUmrechnung = 0;
		D41_Tage = 0;
		if(!(_house2 isKindOf "House_F")) exitWith {};
		if(D41_atmGeld < (_houseCfg select 0)) exitWith {hint "Du hast nicht genügend Geld!"};
		D41_atmGeld = D41_atmGeld - (_houseCfg select 0);
		[[_house, _player,1],"D41_fnc_queryHouseRent",true,false] call life_fnc_MP;
		hint "Der Mieterbund aktualisiert seine Unterlagen...";
		sleep 1;
		[[_house, _player,0],"D41_fnc_queryHouseRent",true,false] call life_fnc_MP;
		sleep 2;
		_D41_MietZeit = player getVariable["D41_MietZeit",[0]];
		_D41_Umrechnung = (_D41_MietZeit select 0)*4;
		if(isNil "_D41_Umrechnung") exitwith {_RentDateCheck = true;};
		D41_MietUmrechnung = _D41_Umrechnung;
		while{true} do 
			{
				if(D41_MietUmrechnung <= 23) exitWith {};
				if(D41_MietUmrechnung >= 24) then {D41_Tage = D41_Tage + 1;};
				D41_MietUmrechnung = D41_MietUmrechnung - 24;
			};
		hint format ["Die neue verbleibende Mietzeit ist %1 Tag(e) und %2 Stunde(n)",D41_Tage, D41_MietUmrechnung];
	};
};

if(_RentDateCheck)exitWith {hint "Fehler beim abfragen! Beim Admin melden (Falsche Coords in DB?)"};