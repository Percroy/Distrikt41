//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_KSys.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Karma is a bi...
//::::::::::::  ::::::::::::\\

private["_Mod","_Mode","_Karma"];
//Gather: Mode = 0
//Killed: Mode = 1

	_Mod = _this select 0;
	_Mode = _this select 1;
	if(playerSide != civilian) exitWith {};
	
	_LicRemMsg =
	{
		_License = _this select 0;
		systemchat format [localize "STR_D41_LicenseRemoved",life_D41_Karma, ([_License] call life_fnc_varToStr)];
		hint format [localize "STR_D41_LicenseRemoved",life_D41_Karma, ([_License] call life_fnc_varToStr)];
	};
	//Lizenzencheck
	if((life_D41_Karma > -8000)	&& license_civ_meth)								then{license_civ_meth = false;			["license_civ_meth"] call _LicRemMsg;};
	if((life_D41_Karma > -6000)	&& license_civ_heroin)								then{license_civ_heroin = false;		["license_civ_heroin"] call _LicRemMsg;};
	if((life_D41_Karma > -3000)	&& license_civ_coke)								then{license_civ_coke = false;			["license_civ_coke"] call _LicRemMsg;};
	if((life_D41_Karma < -4000) && license_civ_Saft)								then{license_civ_Saft = false;			["license_civ_Saft"] call _LicRemMsg;};
	if((life_D41_Karma < -4000)	&& license_civ_Schnaps)								then{license_civ_Schnaps = false;		["license_civ_Schnaps"] call _LicRemMsg;};
	if((life_D41_Karma > -2000) && license_civ_rebel)								then{license_civ_rebel = false;			["license_civ_rebel"] call _LicRemMsg;};
	if((life_D41_Karma < 0)		&& license_civ_Bruchstein)							then{license_civ_Bruchstein = false;	["license_civ_Bruchstein"] call _LicRemMsg;};
	if((life_D41_Karma < 0)		&& license_civ_Ton)									then{license_civ_Ton = false;			["license_civ_Ton"] call _LicRemMsg;};
	if((life_D41_Karma < 0)		&& license_civ_sand)								then{license_civ_sand = false;			["license_civ_sand"] call _LicRemMsg;};
	if((life_D41_Karma > 3000)	&& license_civ_marijuana)							then{license_civ_marijuana = false;		["license_civ_marijuana"] call _LicRemMsg;};
	if((life_D41_Karma < 2000)	&& license_civ_Dosenfisch)							then{license_civ_Dosenfisch = false;	["license_civ_Dosenfisch"] call _LicRemMsg;};
	if((life_D41_Karma < 2000)	&& license_civ_oil)									then{license_civ_oil = false; 			["license_civ_oil"] call _LicRemMsg;};
	if((life_D41_Karma < 4000)	&& license_civ_iron)								then{license_civ_iron = false;			["license_civ_iron"] call _LicRemMsg;};
	if(((life_D41_Karma < 6000) && (life_D41_Karma > -6000)) && license_civ_diamond)then{license_civ_diamond = false;		["license_civ_diamond"] call _LicRemMsg;};
	if((life_D41_Karma < 8000)	&& license_civ_Krabben)								then{license_civ_Krabben = false;		["license_civ_Krabben"] call _LicRemMsg;};
	if((life_D41_Karma < 6000)	&& license_civ_Kerosin)								then{license_civ_Kerosin = false;		["license_civ_Kerosin"] call _LicRemMsg;};
	if((life_D41_Karma < 8000)	&& license_civ_Stahl)								then{license_civ_Stahl = false;			["license_civ_Stahl"] call _LicRemMsg;};
	//if(((life_D41_Karma < 8000) && (life_D41_Karma > -8000)) && license_civ_WKompL)	then{license_civ_WKompL = false;		["license_civ_WKompL"] call _LicRemMsg;};
	
	
	
	if(_Mode == 0) exitWith {if(((life_D41_Karma+_Mod) <= 12500) && ((life_D41_Karma+_Mod) >= -12500))then{life_D41_Karma = life_D41_Karma + _Mod;}else{systemchat "Maximales Karma erreicht!"; hint "Maximales Karma erreicht!"}; if(life_D41_Karma > 12500)then{life_D41_Karma = 12500}; if(life_D41_Karma < -12500)then{life_D41_Karma = -12500};};
	_Karma = _this select 2;
	
	call life_fnc_D41_KillMalus;
	
	if(_Karma >= -999) then 						{if(life_D41_Karma < -12400)	exitWith{life_D41_Karma = -12500;	systemchat format [localize "STR_D41_Karma_Kill_1_Max",_Mod, life_D41_Karma];}; life_D41_Karma = life_D41_Karma + _Mod; systemchat format [localize "STR_D41_Karma_Kill_1", _Mod, life_D41_Karma];};
	if((_Karma <= -1000) && (_Karma >= -2499)) then {if(life_D41_Karma > 12400)		exitWith{life_D41_Karma = 12500;	systemchat format [localize "STR_D41_Karma_Kill_2_Max",_Mod, life_D41_Karma];};	life_D41_Karma = life_D41_Karma + 10; 	systemchat format [localize "STR_D41_Karma_Kill_2", _Mod, life_D41_Karma];};
	if((_Karma <= -2500) && (_Karma >= -4999)) then {if(life_D41_Karma > 12300)		exitWith{life_D41_Karma = 12500;	systemchat format [localize "STR_D41_Karma_Kill_3_Max",_Mod, life_D41_Karma];};	life_D41_Karma = life_D41_Karma + 20; 	systemchat format [localize "STR_D41_Karma_Kill_3", _Mod, life_D41_Karma];};
	if((_Karma <= -5000) && (_Karma >= -9999)) then {if(life_D41_Karma > 12100)		exitWith{life_D41_Karma = 12500;	systemchat format [localize "STR_D41_Karma_Kill_4_Max",_Mod, life_D41_Karma];};	life_D41_Karma = life_D41_Karma + 40; 	systemchat format [localize "STR_D41_Karma_Kill_4", _Mod, life_D41_Karma];};
	if(_Karma <= -10000) then 						{if(life_D41_Karma > 11700)		exitWith{life_D41_Karma = 12500;	systemchat format [localize "STR_D41_Karma_Kill_5_Max",_Mod, life_D41_Karma];}; life_D41_Karma = life_D41_Karma + 80; 	systemchat format [localize "STR_D41_Karma_Kill_5", _Mod, life_D41_Karma];};
	[9] call SOCK_fnc_updatePartial;