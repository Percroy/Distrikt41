/*
	File: fn_clothingFilter.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Functionality for filtering clothing types in the menu.
*/
disableSerialization;
private["_control","_selection","_list","_filter"];
_control = _this select 0;
_selection = _this select 1;
life_clothing_filter = _selection;

if(_selection == 4) then
{
	life_shop_cam camSetTarget (player modelToWorld [0,-.15,1.3]);
	life_shop_cam camSetPos (player modelToWorld [1,-4,2]);
	life_shop_cam camCommit 1;
}
	else
{
	life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
	life_shop_cam camSetPos (player modelToWorld [1,4,2]);
	life_shop_cam camCommit 1;
};

if(isNull (findDisplay 3100)) exitWith {};
_list = (findDisplay 3100) displayCtrl 3101;
lbClear _filter;
lbClear _list;

//Temp code, subjected to become one master config in future
_clothes = switch (life_clothing_store) do
{
	case "bruce": {[_selection] call life_fnc_clothing_bruce;};
	case "work": {[_selection] call life_fnc_clothing_work;};
	case "luxus": {[_selection] call life_fnc_clothing_luxus;};
	case "cop": {[_selection] call life_fnc_clothing_cop;};
	case "cop_swat": {[_selection] call life_fnc_clothing_cop_swat;};
	case "cop_civil": {[_selection] call life_fnc_clothing_cop_civil;};
	case "med": {[_selection] call life_fnc_clothing_med;};
	case "rebnorth": {[_selection] call life_fnc_clothing_rebnorth;};
	case "rebsouth": {[_selection] call life_fnc_clothing_rebsouth;};
	case "rebcity": {[_selection] call life_fnc_clothing_rebcity;};
	case "dive": {[_selection] call life_fnc_clothing_dive;};
	case "kart": {[_selection] call life_fnc_clothing_kart;};
	case "adac": {[_selection] call life_fnc_clothing_adac;};
	case "gangdmw": {[_selection] call life_fnc_clothing_gangdmw;};
	case "base_01": {[_selection] call life_fnc_clothing_base_01;};
	case "base_02": {[_selection] call life_fnc_clothing_base_02;};
	case "base_03": {[_selection] call life_fnc_clothing_base_03;};
	case "base_04": {[_selection] call life_fnc_clothing_base_04;};
	case "base_05": {[_selection] call life_fnc_clothing_base_05;};
	case "base_06": {[_selection] call life_fnc_clothing_base_06;};
	case "gangfirma": {[_selection] call life_fnc_clothing_gangfirma;};
	case "hero": {[_selection] call life_fnc_clothing_hero;};
};

if(count _clothes == 0) exitWith {};
{
	_details = [_x select 0] call life_fnc_fetchCfgDetails;
	if(isNil {_x select 1}) then
	{
		_list lbAdd format["%1",(getText(configFile >> (_details select 6) >> (_x select 0) >> "DisplayName"))];
	}
		else
	{
		_list lbAdd format["%1", _x select 1];
	};
	_pic = getText(configFile >> (_details select 6) >> (_x select 0) >> "picture");
	_list lbSetData [(lbSize _list)-1,_x select 0];
	_list lbSetValue [(lbSize _list)-1,_x select 2];
	_list lbSetPicture [(lbSize _list)-1,_pic];
} foreach _clothes;