/*
	File: fn_D41_Tanke.sqf
	Author: Distrikt41 - Dscha

	Description:
	Jo ähm, befüllen der Karre halt.
*/
private["_vehicle","_Tankstand","_action", "_target", "_FuelSize", "_name","_ui","_progress","_pgText","_fuelMod"];

_vehicle = nearestObjects[getPos player,["Car","Air"],10];
if(count (_vehicle) < 1)exitWith{};
_vehicle = _vehicle select 0;

if(D41_Tankt) exitWith {hint localize "STR_D41_Fuel_hands"};
_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_action = [
format[localize "STR_D41_Ask_Refuel", _name, D41_BenzinPreis],localize "STR_D41_Refuel",localize "STR_Global_Yes",localize "STR_Global_No"
] call BIS_fnc_guiMessage;

D41_Tankt = true;
D41_TankeVebraucht = 0;
_fuel = 0;
_fuelMod = 0;
_fuel = getNumber(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "fuelCapacity");
if(_vehicle isKindOf "Car") then {_fuelMod = ((1/(_fuel / 100))/4000);};
if(_vehicle isKindOf "Air") then {_fuelMod = ((1/(_fuel / 100))/20);};

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_progress progressSetPosition (Fuel _vehicle);

_Tankstand = Fuel _vehicle;
life_action_inUse = true;
if(_action) then
{
	
	while{true}do
	{
		if(isNull _vehicle)exitWith{};
		if((D41_atmGeld - D41_BenzinPreis) < 0)exitWith{titleText[format[localize "STR_D41_Gang_noMoney",D41_atmGeld],"PLAIN"]; 5 cutText ["","PLAIN"];};
		if(_Tankstand >= 1)exitWith{titleText[format[localize "STR_D41_Refueled",_name],"PLAIN"]; 5 cutText ["","PLAIN"];};
		if((vehicle player) distance _vehicle > 5)exitWith{titleText[localize "STR_D41_Crazy_Fuel","PLAIN"]; 5 cutText ["","PLAIN"];};
		if(!alive player)exitWith{D41_Tankt = false;titleText[format[localize "STR_D41_Refuleing_Down",_name],"PLAIN"]; 5 cutText ["","PLAIN"];};
		if(vehicle player != player)exitWith{titleText[format[localize "STR_D41_Fat_ass",_name],"PLAIN"]; 5 cutText ["","PLAIN"];};
		//if(!IsNull (driver _Vehicle))exitWith{titleText[format[localize "STR_D41_FahrerRausTanke",_name],"PLAIN"]; 5 cutText ["","PLAIN"];};
		if(life_istazed)exitWith{};
		if(life_interrupted)exitWith{};
		
		D41_atmGeld = D41_atmGeld - D41_BenzinPreis;
		_vehicle setFuel (_Tankstand + _fuelMod);
		_Tankstand = Fuel _vehicle;
		_progress progressSetPosition _Tankstand;
		_pgText ctrlSetText format["%3 %4 (%1%2)...",round((_Tankstand) * 100),"%",localize "STR_D41_refueling", _name];
		D41_TankeVebraucht = D41_TankeVebraucht + 1;
		sleep 0.25
	};
};
_time = time;
if(!local _vehicle && IsNull (driver _Vehicle))then{[[player, _Vehicle, "1"],"D41_fnc_setOwner",false,false] spawn life_fnc_MP; waitUntil{sleep 0.1; ((local _vehicle) OR ((time - _time) > 5))}; if((time - _time) > 5)exitWith{ systemchat localize "STR_D41_Fehler"; }; _vehicle setFuel _Tankstand;};
if(!local _vehicle && !IsNull (driver _Vehicle))then{[[_vehicle,_Tankstand],"life_fnc_setFuel",(driver _vehicle),false] call life_fnc_MP;};
D41_Tankt = false;
life_action_inUse = false;
5 cutText ["","PLAIN"];
D41_TankeAbzugOel = round((D41_TankeVebraucht/2));
diag_log format [":::::::::::::: D41_TankeVebraucht: %1", D41_TankeAbzugOel];















