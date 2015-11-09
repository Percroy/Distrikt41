/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Locks up the entire house and closes all doors.
*/
private["_house","_numberOfDoors","_HouseInfos"];
if(!isServer)then{D41_HouseInitDone=true}else{D41_HouseInitDone = false;};
waitUntil{D41_HouseInitDone};
_house = param[0,ObjNull,[ObjNull]];
if(isNull _house OR !(_house isKindOf "House_F") && !(_house isKindOf "Land_i_Shed_Ind_F") && !(_house isKindOf "Land_Slum_House02_F") && !(_house isKindOf "Land_Medevac_house_V1_F") && !(_house isKindOf "Land_Cargo_House_V3_F")) exitWith {};

_numberOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
if(_numberOfDoors == -1 OR _numberOfDoors == 0) exitWith {}; //MEH

titleText [localize "STR_House_LockingUp","PLAIN"];
sleep 3;
for "_i" from 1 to _numberOfDoors do
{
	_house animate[format["door_%1_rot",_i],0];
};
diag_log str (_this select 0);
if((_this select 0) in ["D41_SafeZone","D41_SafeZone_1"])exitWith{}; // Spawndome abschließen

_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;
if(_HouseInfos isEqualTo "KeineDaten")exitWith{diag_log format ["::::::::: FEHLER: fnc_LockUpHouse: isNil _HouseInfos: _House: %1 || Zusatz:(D41_SafeZone+D41_SafeZone_1 ausgenommen)", _house];};
_HouseInfos set[3,true]; //Set Locked Var
_HouseInfos set[5,false]; //Set CopRaid Var
_house setVariable["House_Infos",_HouseInfos,true];

titleText[localize "STR_House_LockedUp","PLAIN"];




