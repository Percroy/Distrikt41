//::::::::::::  ::::::::::::\\
//	Filename: core/housing/fn_D41_GetHouseInfos.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Funktion zum abfragen der jeweiligen Hausinformationen. Bsp. siehe unten.
//::::::::::::  ::::::::::::\\
private["_GHIObject","_GHImode"];

_GHIObject = param [0, ObjNull, [ObjNull]];
_GHImode = param [1, "", [""]];
if(_GHImode == "")exitWith{systemchat "GetHouseInfos: _GHImode = Leerer String"};
_result = "KeineDaten";

if(_GHImode == "Alles")then{_result = _GHIObject getVariable "House_Infos";};										// [_house, "Alles"] call life_fnc_D41_GetHouseInfos
if(_GHImode == "house_id")then{_result = ((_GHIObject getVariable "House_Infos") select 0);};						// [_house, "house_id"] call life_fnc_D41_GetHouseInfos
if(_GHImode == "uid")then{_result = ((_GHIObject getVariable "House_Infos") select 1);};							// [_house, "uid"] call life_fnc_D41_GetHouseInfos
if(_GHImode == "house_owner")then{_result = ((_GHIObject getVariable "House_Infos") select 2);};					// [_house, "house_owner"] call life_fnc_D41_GetHouseInfos
if(_GHImode == "house_ownerPID")then{_result = ((_GHIObject getVariable "House_Infos") select 2) select 0;};		// [_house, "house_ownerPID"] call life_fnc_D41_GetHouseInfos
if(_GHImode == "house_ownerName")then{_result = ((_GHIObject getVariable "House_Infos") select 2) select 1;};		// [_house, "house_ownerName"] call life_fnc_D41_GetHouseInfos
if(_GHImode == "locked")then{_result = ((_GHIObject getVariable "House_Infos") select 3);};							// [_house, "locked"] call life_fnc_D41_GetHouseInfos
if(_GHImode == "containers")then{_result = ((_GHIObject getVariable "House_Infos") select 4);};						// [_house, "containers"] call life_fnc_D41_GetHouseInfos
if(_GHImode == "D41_CopRaid")then{_result = ((_GHIObject getVariable "House_Infos") select 5);};					// [_house, "D41_CopRaid"] call life_fnc_D41_GetHouseInfos

if(isNil "_result")then{_result = "KeineDaten";};
_result;



/*
Reine Abfrage aller Infos:
_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;

Wert neu setzen:
_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;
_HouseInfos set[4,DATA];
_house setVariable["House_Infos",_HouseInfos,true];
*/