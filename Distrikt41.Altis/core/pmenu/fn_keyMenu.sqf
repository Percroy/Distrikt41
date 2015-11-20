/*
	File: fn_keyMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the key menu
	Will be revised.
*/
private["_display","_vehicles","_plist","_near_units","_pic","_name","_text","_color","_index"];
disableSerialization;

waitUntil {!isNull (findDisplay 2700)};
_display = findDisplay 2700;
_vehicles = _display displayCtrl 2701;
lbClear _vehicles;
_plist = _display displayCtrl 2702;
lbClear _plist;
_near_units = [];

{ if(player distance _x < 20) then {_near_units pushBack _x};} foreach playableUnits;

for "_i" from 0 to (count life_vehicles)-1 do
{
	_veh = life_vehicles select _i;
	if((!isNull _veh) && (alive _veh) && ((player distance _veh) < 101 OR !(_veh isKindOf "Car" OR _veh isKindOf "Air" OR _veh isKindOf "Ship"))) then
	{
		_color = [(typeOf _veh),(_veh getVariable "Life_VEH_color")] call life_fnc_vehicleColorStr;
		_text = format["(%1)",_color];
		if(_text == "()") then
		{
			_text = "";
		};
		
		_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
		_vehicles lbAdd format["%1 %3 - [Distance: %2m]",_name,round(player distance _veh),_text];
		if(_pic != "pictureStaticObject") then {
			_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
		};
		_vehicles lbSetData [(lbSize _vehicles)-1,str(_i)];
	};
};

{
	if(!isNull _x && alive _x && player distance _x < 20 && _x != player) then
	{
		_life_maskiert = false;
		if ((goggles _x) in D41_goggles_Array) then {_life_maskiert = true};
		if ((uniform _x) in D41_uniform_Array) then {_life_maskiert = true};
		if ((headgear _x) in D41_headgear_Array) then {_life_maskiert = true};
		if ((hmd _x) in D41_hmd_Array) then {_life_maskiert = true};
		if(_life_maskiert)then
		{
			_plist lbAdd format["%1 - %2",localize "STR_D41_MaskiertePerson", side _x];
			_plist lbSetData [(lbSize _plist)-1,str(_x)];
		}
		else
		{
			_plist lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
			_plist lbSetData [(lbSize _plist)-1,str(_x)];
		};
	};
} foreach _near_units;

if(((lbSize _vehicles)-1) == -1) then
{
	_vehicles lbAdd "You don't own any vehicles";
	_vehicles lbSetData [(lbSize _vehicles)-1,str(ObjNull)];
};