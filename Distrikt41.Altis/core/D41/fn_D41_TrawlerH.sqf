/*
	File: fn_D41_TrawlerLicht.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad entry!
if(!(typeOf _vehicle in ["D41_Trawler"])) exitWith {titleText [localize "STR_D41_NoCar","PLAIN"];};

[[_vehicle],"life_fnc_D41_Trawler_Horn",true,false] call life_fnc_MP;