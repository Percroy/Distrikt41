/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

if(D41_Geld < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license select 1];};

titleText[format[localize "STR_NOTF_B_1", _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
D41_Geld = D41_Geld - _price;
[] call life_fnc_hudUpdate;
[2] call SOCK_fnc_updatePartial;
missionNamespace setVariable[(_license select 0),true];