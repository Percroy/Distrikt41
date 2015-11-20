/*
	File: fn_getVehiclesImp.sqf
	Author: Bryan "Tonic" Boardwine
	ModifiedBy: Distrikt41-Dscha
	Description:
	Sends a request to query the database information and returns vehicles.
	EditByDscha:
	Modifiziert für Karmabasiertes Ausparken von Fahrzeugen (z.B. Keinen Trawler mit -12.000 ausparkbar)
	Modified for Karma based unparking of Vehicles (e.g.: no trawler unpark with - 12.000Karma)
*/
private["_pid","_side","_playerSide","_type","_unit","_ret","_tickTime","_queryResult","_PKarma","_GangKarma","_KarmaCheckList","_D41_PushItBack","_List","_KarmaVehicleList","_Array","_VehName"];
_pid = param [0,"",[""]];
_side =  param [1,sideUnknown,[west]];
_playerSide = param [1,sideUnknown,[west]];
_type = param [2,"",[""]];
_unit = param [3,ObjNull,[ObjNull]];
_PKarma = param [4,0,[]];
_Gangbase = param [5,"none",[""]];
_GangKarma = (group _unit) getVariable "gang_Karma";
if(!isNil "_GangKarma")then{_GangKarma = call compile format["%1", _GangKarma];};
if(isNil "_GangKarma")then{_GangKarma = _PKarma};

//Error checks
if(_pid == "" OR _side == sideUnknown OR _type == "" OR isNull _unit) exitWith
{
	if(!isNull _unit) then
	{
		[[[]],"life_fnc_impoundMenu",_unit,false] call life_fnc_MP;
	};
};

//_unit = owner _unit;
_side = switch(_side) do
{
	case west:{"cop"};
	case civilian: {"civ"};
	case independent: {"med"};
	default {"Error"};
};

if(_side == "Error") exitWith
{
	[[[],true],"life_fnc_impoundMenu",_unit,false] call life_fnc_MP;
};

_query = format["GetVehiclesImp:%1:%2:%3",_pid,_side,_type];

//waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

///////////////////////////////////
//KARMA BASIERTES AUSPARKEN START:
	_KarmaCheckList = [];
	_D41_PushItBack =
	{
		_List = _this select 0;
		{
			if(_x == "")exitWith{};
			_KarmaCheckList pushback _x;
		}foreach _List;
	};
	
	if(_GangKarma >= 9000	&& _GangKarma <= 12500 )then	{[D41_GarageList_Plus9kPlus]	call _D41_PushItBack;};
	if(_GangKarma >= 6000	&& _GangKarma <= 12500 )then	{[D41_GarageList_Plus6kPlus]	call _D41_PushItBack;};
	if(_GangKarma >= 3000	&& _GangKarma <= 12500 )then	{[D41_GarageList_Plus3kPlus]	call _D41_PushItBack;};
	if(_GangKarma >= 0		&& _GangKarma <= 12500 )then 	{[D41_GarageList_Plus0Plus]		call _D41_PushItBack;};
	if(_GangKarma >= -3000	&& _GangKarma <= 12500 )then 	{[D41_GarageList_Minus3kPlus]	call _D41_PushItBack;};
	if(_GangKarma >= -6000	&& _GangKarma <= 12500 )then 	{[D41_GarageList_Minus6kPlus]	call _D41_PushItBack;};
	if(_GangKarma >= -9000	&& _GangKarma <= 12500 )then 	{[D41_GarageList_Minus9kPlus]	call _D41_PushItBack;};
	
	if(_GangKarma <= 9000	&& _GangKarma >= -12500 )then 	{[D41_GarageList_Plus9kMinus]	call _D41_PushItBack;};
	if(_GangKarma <= 6000	&& _GangKarma >= -12500 )then 	{[D41_GarageList_Plus6kMinus]	call _D41_PushItBack;};
	if(_GangKarma <= 3000	&& _GangKarma >= -12500 )then 	{[D41_GarageList_Plus3kMinus]	call _D41_PushItBack;};
	if(_GangKarma <= 0 		&& _GangKarma >= -12500 )then 	{[D41_GarageList_Plus0Minus]	call _D41_PushItBack;};
	if(_GangKarma <= -3000	&& _GangKarma >= -12500 )then 	{[D41_GarageList_Minus3kMinus]	call _D41_PushItBack;};
	if(_GangKarma <= -6000	&& _GangKarma >= -12500 )then 	{[D41_GarageList_Minus6kMinus]	call _D41_PushItBack;};
	if(_GangKarma <= -9000	&& _GangKarma >= -12500 )then 	{[D41_GarageList_Minus9kMinus]	call _D41_PushItBack;};
	
	if(_Gangbase != "none")then
	{
		if(_Gangbase == "license_civ_base01")then			{[D41_Garage_GangBase01]		call _D41_PushItBack;};
		if(_Gangbase == "license_civ_base02")then			{[D41_Garage_GangBase02]		call _D41_PushItBack;};
		if(_Gangbase == "license_civ_base03")then			{[D41_Garage_GangBase03]		call _D41_PushItBack;};
		if(_Gangbase == "license_civ_base04")then			{[D41_Garage_GangBase04]		call _D41_PushItBack;};
		if(_Gangbase == "license_civ_base05")then			{[D41_Garage_GangBase05]		call _D41_PushItBack;};
		if(_Gangbase == "license_civ_base06")then			{[D41_Garage_GangBase06]		call _D41_PushItBack;};
	};
	
	
	diag_Log format ["::: _KarmaCheckList: %1", _KarmaCheckList];
	_KarmaVehicleList = [];
	{
		_Array = _x;
		_VehName = _x select 2;
		if(_VehName in D41_GarageList_KeinKarmaCheck)then{_KarmaVehicleList pushback _x}; //Karma Neutrale Fahrzeuge
		if(_VehName in _KarmaCheckList)then{_KarmaVehicleList pushback _x};
		
	}forEach _queryResult;
	diag_Log format [":::: _KarmaVehicleList: %1", _KarmaVehicleList];
//KARMA BASIERTES AUSPARKEN ENDE
///////////////////////////////////


if(typeName _KarmaVehicleList == "STRING") exitWith
{
	[[[],true],"life_fnc_impoundMenu",_unit,false] call life_fnc_MP;
};

if(_playerSide in [west,east,independent])exitWith{[[_queryResult,false],"life_fnc_impoundMenu",_unit,false] call life_fnc_MP;};
[[_KarmaVehicleList,true],"life_fnc_impoundMenu",_unit,false] call life_fnc_MP;