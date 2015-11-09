#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
{if(!isNil "_x")then{diag_log format ["::::: REQUEST RECEIVED: _this select %1 = %2", _forEachIndex, _x];};}forEach _this; //DEBUG

if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel")) exitWith {
	[[profileName,getPlayerUID player,"VariablesAlreadySet"],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
	[[profileName,format["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2",life_adminlevel,life_coplevel]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
	sleep 0.9;
	["SpyGlass",false,false] execVM "\a3\functions_f\Misc\fn_endMission.sqf";
};

//***

//Parse basic player information.
D41_Geld = parseNumber (_this select 2); //0 
D41_atmGeld = parseNumber (_this select 3);//15000
__CONST__(life_adminlevel,(_this select 4)); //0

//Loop through licenses
if(count (_this select 6) > 0) then { //[]
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};

life_gear = _this select 8; //[]
[] call life_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel,(_this select 7)); //false
		life_blacklisted = _this select 9;
		life_skillReperatur = 0;
		__CONST__(life_medicLevel,0);
	};
	
	case civilian: {
		__CONST__(life_coplevel,0);
		__CONST__(life_medicLevel,0);
		life_gangData = _this select 11;
		D41_GangInitDone = false;
		if(count life_GangData == 0)then{license_civ_base01 = false; license_civ_base02 = false; license_civ_base03 = false; license_civ_base04 = false; license_civ_base05 = false; license_civ_base06 = false; D41_GangInitDone = true;};
		if(count life_gangData != 0) then { [] spawn life_fnc_initGang; };
		
		
		life_is_arrested = _this select 7;
		life_houses = _this select 10;
		diag_log format [":::::::::: RequestReceived: life_houses: %1", life_houses];
		{
			_house = [];
			_house = nearestObjects [(_x select 0), D41_HausArray, 20];
			if(isNil "_house")exitWith{systemchat "FEHLER! BEIM ADMIN MELDEN! HOUSING SYSTEM RequestReceived! - IsNil"};
			if(count(_house) == 0)exitWith{systemchat "FEHLER! BEIM ADMIN MELDEN! HOUSING SYSTEM RequestReceived!"};
			_house = _house select 0;
			diag_log format [":::::::::: RequestReceived: _house: %1", _house];
			diag_log format [":::::::::: RequestReceived: getPosATL _house: %1", getPosATL _house];
			life_vehicles pushBack _house;
		} foreach life_houses;
		
		D41_LeftGang = false;
		if((parseNumber (_this select 50)) == 1)then {D41_LeftGang = true;};
		D41_DiedTimer =  parseNumber (_this select 13);
		[] spawn life_fnc_initHouses;
		life_D41_Karma =  parseNumber (_this select 14);
		life_skillApple =  parseNumber (_this select 15);
		life_skillPeach =  parseNumber (_this select 16);
		life_skillEhemalsRock = parseNumber (_this select 17);
		life_skillSalt =  parseNumber (_this select 18);
		life_skillSand =  parseNumber (_this select 19);
		life_skillIronore =  parseNumber (_this select 20);
		life_skillCopperore =  parseNumber (_this select 21);
		life_skillDiamond =  parseNumber (_this select 22);
		life_skillCannabis =  parseNumber (_this select 23);
		life_skillCocaine =  parseNumber (_this select 24);
		life_skillHeroinu =  parseNumber (_this select 25);
		life_skillOilu =  parseNumber (_this select 26);
		life_skillRawmeat =  parseNumber (_this select 27);
		life_skillcoalu =  parseNumber (_this select 28);
		life_skillBruchstein =  parseNumber (_this select 29);
		life_skillTon =  parseNumber(_this select 30);
		life_skillKrabben =  parseNumber (_this select 31);
		life_skillFischen =  parseNumber (_this select 32);
		life_skillReperatur =  parseNumber (_this select 33);
		life_skillMeth = parseNumber (_this select 34);
		D41_SpawnInfos = (_this select 35);
	};
	
	case independent: {
		__CONST__(life_medicLevel, (_this select 7));
		__CONST__(life_coplevel,0);
		life_skillReperatur = 0;
	};
};

if(count (_this select 12) > 0) then {
	{life_vehicles pushBack _x;} foreach (_this select 12);
};

life_session_completed = true;

//ALLE KNÖPPE AUS, BIS Spawnmenü geladen ist:
//disableUserInput true;