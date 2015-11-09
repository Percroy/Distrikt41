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
	[[_house, _player,0],"D41_fnc_queryHouseRent",false,false] call life_fnc_MP;
	hint localize "STR_D41_Check_Rent";
	sleep 2;
	_D41_MietUmrechnung = 0;
	_D41_Tage = 0;
	_D41_MietZeit = (player getVariable["D41_MietZeit",[0]]) select 0;
	if(isNil "_D41_MietZeit") exitwith {_RentDateCheck = true;};
	_D41_MietUmrechnung = _D41_MietZeit;
	while{true} do 
		{
			if(_D41_MietUmrechnung < 24) exitWith {};
			if(_D41_MietUmrechnung >= 24) then {_D41_Tage = _D41_Tage + 1;};
			_D41_MietUmrechnung = _D41_MietUmrechnung - 24;
		};
	diag_log format [":::::::::::::::: fn_D41_GetRentDate _D41_Tage = %1  || _D41_MietUmrechnung(Stunden) = %2",_D41_Tage, _D41_MietUmrechnung];
	hint format [localize "STR_D41_Rent_Left",_D41_Tage, _D41_MietUmrechnung];
};

if(_mode == 1) then
{
	_houseCfg = [(typeOf _house2)] call life_fnc_houseConfig;
	if(isNull _house2) exitWith {};
	if(count _houseCfg == 0) exitWith {};
	_action = [
	format[localize "STR_D41_Pay_Rent_?",
	[(_houseCfg select 0)] call life_fnc_numberText],localize "STR_D41_Rent",localize "STR_D41_Pay_Rent",localize "STR_Global_Cancel"
	] call BIS_fnc_guiMessage;
	
	if(_action) then
	{
		_D41_MietUmrechnung = 0;
		_D41_Tage = 0;
		if(!(_house2 isKindOf "House_F")) exitWith {};
		if(D41_atmGeld < (_houseCfg select 0)) exitWith {hint localize "STR_D41_notenough_Money"};
		D41_atmGeld = D41_atmGeld - (_houseCfg select 0);
		[[_house, _player,1],"D41_fnc_queryHouseRent",false,false] call life_fnc_MP;
		hint localize "STR_D41_Update_rent";
		sleep 1;
		[[_house, _player,0],"D41_fnc_queryHouseRent",false,false] call life_fnc_MP;
		sleep 2;
		_D41_MietZeit = (player getVariable["D41_MietZeit",[0]]) select 0;
		
		if(isNil "_D41_MietZeit") exitwith {_RentDateCheck = true;};
		_D41_MietUmrechnung = _D41_MietZeit;
		while{true} do
			{
				if(_D41_MietUmrechnung < 24) exitWith {};
				if(_D41_MietUmrechnung >= 24) then {_D41_Tage = _D41_Tage + 1;};
				_D41_MietUmrechnung = _D41_MietUmrechnung - 24;
			};
		hint format [localize "STR_D41_new_Rent_time",_D41_Tage, _D41_MietUmrechnung];
	};
};

if(_RentDateCheck)exitWith {hint localize "STR_D41_Rent_error"};