/*
file: fn_robShops.sqf
Author: MrKraken
Description:
Executes the rob shob action!
Modified by: KrisSerbia

*/
private["_robber","_shop","_timer","_funds","_dist","_success","_pos","_robberyreward"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;
_timer = 300;
_funds = 5000 + round(random 10000);
_dist = _robber distance _shop;
_success = false;
_pos = GetPos player;

if ({side _x == west} count playableUnits < 2) exitWith {hint localize "STR_D41_MindestAnzahlCops2";};
if (vehicle player != _robber) exitWith { hint localize "STR_D41_VorherAussteigen";};
if (side _robber != Civilian) exitWith { hint localize "STR_D41_UeberfallIstCop";};
if (alive _robber && {currentWeapon _robber == ""}) exitWith { hint localize "STR_D41_UeberfallKeineWaffe";};
if (alive _robber && side _robber == Civilian && {currentWeapon _robber != ""} && {_funds > 0}) then
{
	hint format [localize "STR_D41_UeberfallTanke",_timer];
	[[2,localize "STR_D41_UeberfallMarker"],"life_fnc_broadcast",west,false] call life_fnc_MP;
	_shop switchMove "AmovPercMstpSsurWnonDnon";
	_shop removeAction _action;
	_Markername = format ["RobMethMarker%1",(getPlayerUID player)];


		_Pos = position player;
					_marker = createMarker [_Markername, _Pos];
					_Markername setMarkerColor "ColorRed";
					_Markername setMarkerText localize "STR_D41_UeberfallMarker";
					_Markername setMarkerType "mil_warning";

	while {true} do
	{
		hintsilent format [localize "STR_D41_UeberfallTankeTimer",_timer];
		sleep 1;
		_timer = _timer - 1;
		_dist = _robber distance _shop;
		
		if (!alive _robber) exitwith
		{
			deleteMarker _Markername;
			_shop switchMove "";
			_action = _shop addAction[localize "STR_D41_UberfallTankeAddAction",life_fnc_robShops];
		};
		
		if (_dist >= 6) exitwith
		{
			hint localize "STR_D41_UeberfallTankeAusReichweite";
			deleteMarker _Markername;
			_shop switchMove "";
			_action = _shop addAction[localize "STR_D41_UberfallTankeAddAction",life_fnc_robShops];
		};
		
		if(life_istazed) exitwith
		{
			hint localize "STR_D41_UeberfallTankeTazer";
			deleteMarker _Markername;
			_shop switchMove "";
			_action = _shop addAction[localize "STR_D41_UberfallTankeAddAction",life_fnc_robShops];
		};
		
		if(_timer < 1) exitWith { _success = true;};
	};
	
	if(!_success) exitWith {};
	D41_Geld = D41_Geld + _funds;
	hint format[localize "STR_D41_UberfallTankeWievielGestohlen",_funds];
	deleteMarker _Markername;
	if((side _robber) == civilian)then{ [[getPlayerUID _robber,name _robber,"212"],"life_fnc_wantedAdd",false,false] call life_fnc_MP; };
	[-30,0] call life_fnc_D41_KSys;

	_shop switchMove "";
	_funds = 0;
	sleep 800;//Cooldown between the robberies
	_action = _shop addAction[localize "STR_D41_UberfallTankeAddAction",life_fnc_robShops];
	[] call life_fnc_hudUpdate;
};