/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_civHeli","_blocked"];
_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
 if(_mode) then {_basePrice = round(_basePrice * 4)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(D41_Geld < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - D41_Geld] call life_fnc_numberText];};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense"};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";
_blocked = false;

if((life_veh_shop select 0) == "med_air_hs") then
	{
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
	}
	else
	{
		//Check if there is multiple spawn points and find a suitable spawnpoint.
		if(typeName _spawnPoints == typeName []) then
		{
			//Find an available spawn point.
			{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],10]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
		}
		else
		{
			if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],10]) == 0) exitWith {_spawnPoint = _spawnPoints};
		};
	};

if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";};
if((life_veh_shop select 0) == "civ_air") then
	{
		if(count(nearestObjects[(getMarkerPos (_spawnPoints select 0)),["Car","Ship","Air"],20]) != 0) exitWith {_blocked = true};
	};
if(_blocked)exitWith {hint localize "STR_Shop_Veh_Block"};
D41_Geld = D41_Geld - _basePrice;
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];

//Spawn the vehicle and prep it.
if((life_veh_shop select 0) == "med_air_hs") then
	{
		_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
		waitUntil {!isNil "_vehicle"}; //Wait?
		_vehicle allowDamage false;
		_vehicle lock 2;
		_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
		_vehicle setDir (markerDir _spawnPoint);
		_vehicle setPos (getMarkerPos _spawnPoint);
		[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] call life_fnc_MP;
		[_vehicle] call life_fnc_clearVehicleAmmo;
		[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
		_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
	}
	else
	{
		_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
		waitUntil {!isNil "_vehicle"}; //Wait?
		_vehicle allowDamage false; //Temp disable damage handling..
		_vehicle lock 2;
		_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
		_vehicle setDir (markerDir _spawnPoint);
		_vehicle setPos (getMarkerPos _spawnPoint);
		[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] call life_fnc_MP;
		[_vehicle] call life_fnc_clearVehicleAmmo;
		[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
		_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
	};

//D41 Sitzplatzabfrage
_civHeli = ["B_Heli_Light_01_F","civ_md500_blueline","civ_md500_shadow","civ_md500_whitered","civ_md500_greywatcher","civ_md500_speedy","civ_md500_sunset","civ_md500_wasp","civ_md500_wave"];

//Side Specific actions.
switch(playerSide) do
{
	case civilian:
		{
			if((life_veh_shop select 2) == "civ" && {_className == "civ_md500_urban"}) then
				{
					[_vehicle,"civ_md500_urban",true] spawn life_fnc_vehicleAnimate;
				};

			if((life_veh_shop select 2) == "civ" && (_className in _civHeli)) then
				{
					[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
				};
		};
};

_vehicle allowDamage true;

life_vehicles pushBack _vehicle;
[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] call life_fnc_MP;

if(_mode) then {
	if(!(_className in ["B_MRAP_01_hmg_F"])) then {
		[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] call life_fnc_MP;
	};
};

//[[player, _vehicle, "1"],"D41_fnc_setOwner",false,false] call life_fnc_MP;
[6] call SOCK_FNC_updatePartial;
closeDialog 0; //Exit the menu.
true;