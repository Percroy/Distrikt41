/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Unlocks / locks the house.
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};

	_state = [_house, "locked"] call life_fnc_D41_GetHouseInfos;
	if(_state) then
	{
		_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;
		_HouseInfos set [3, false];
		_house setVariable ["House_Infos", _HouseInfos, true];
		titleText[localize "STR_House_StorageUnlock","PLAIN"];
	}
	else
	{
		_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;
		_HouseInfos set [3, true];
		_house setVariable ["House_Infos", _HouseInfos, true];
		titleText[localize "STR_House_StorageLock","PLAIN"];
	};