/*
	Displays the house owner
*/
private["_house"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR !((typeOf _house) in D41_HausArray)) exitWith {};
_HouseInfos = [_house, "Alles"] call life_fnc_D41_GetHouseInfos;

if(_HouseInfos isEqualTo "KeineDaten") exitWith {hint localize "STR_House_Raid_NoOwner"};
hint parseText format["<t color='#FF0000'><t size='2'>" +(localize "STR_House_Raid_Owner")+ "</t></t><br/>%1",([_house, "house_ownerName"] call life_fnc_D41_GetHouseInfos)];