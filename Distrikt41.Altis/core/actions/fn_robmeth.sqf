//::::::::::::  ::::::::::::\\
//	Filename: core/actions/fn_robmeth.sqf
//	Author: Distrikt41 - Cosmo (+Dscha)
//
//	Beschreibung: Executes the Meth01 Rob action!
//::::::::::::  ::::::::::::\\

private["_robber","_shop","_timer","_Meth","_dist","_success","_pos","_robberyreward","_Markername","_marker","_Building","_P1","_P2","_P3","_Tonne","_Obj"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;
_timer = 300;
_Meth = 5 + round(random 10);
_dist = _robber distance _shop;
_success = false;
_pos = GetPos player;
sleep (random(1));

if(D41_AllChemBlocked)exitWith{hint "Es läuft bereits ein Überfall oder die Lage hat sich noch nicht beruhigt!";};
if((_shop getVariable ["IsBlocked",false]))exitWith{hint localize "STR_D41_UeberfallMethTimerNichtFertig"};
if ({side _x == west} count playableUnits < 5) exitWith {hint localize "STR_D41_MindestAnzahlCops5";};
if (vehicle player != _robber) exitWith { hint localize "STR_D41_VorherAussteigen";};
if (side _robber != Civilian) exitWith { hint localize "STR_D41_UeberfallIstCop";};
if (alive _robber && {currentWeapon _robber == ""}) exitWith { hint localize "STR_D41_UeberfallKeineWaffe";};
if (alive _robber && side _robber == Civilian && {currentWeapon _robber != ""}) then
{
	hint format [localize "STR_D41_UeberfallMeth",_timer];
	[[2,localize "STR_D41_UeberfallMarkerMeth"],"life_fnc_broadcast",west,false] call life_fnc_MP;
	[[_shop,"block"],"D41_fnc_BlockChemFabrik",false,false] call life_fnc_MP;
	_shop removeAction _action;
	_Markername = format ["RobMethMarker%1",(getPlayerUID player)];

		_Pos = position player;
					_marker = createMarker [_Markername, _Pos];
					_Markername setMarkerColor "ColorRed";
					_Markername setMarkerText localize "STR_D41_UeberfallMarkerMeth";
					_Markername setMarkerType "mil_warning";

	while {true} do
	{
		hintsilent format [localize "STR_D41_UeberfallMethTimer",_timer];
		sleep 1;
		_timer = _timer - 1;
		_dist = _robber distance _shop;
		
		if (!alive _robber) exitwith
		{
			deleteMarker _Markername;
			_shop switchMove "";
			_action = _shop addAction[localize "STR_D41_UberfallMethAddAction",life_fnc_robmeth];
		};
		
		if (_dist >= 6) exitwith
		{
			hint localize "STR_D41_UeberfallMethAusReichweite";
			deleteMarker _Markername;
			_shop switchMove "";
			_action = _shop addAction[localize "STR_D41_UberfallMethAddAction",life_fnc_robmeth];
		};
		
		if(life_istazed) exitwith
		{
			hint localize "STR_D41_UeberfallTankeTazer";
			deleteMarker _Markername;
			_shop switchMove "";
			_action = _shop addAction[localize "STR_D41_UberfallMethAddAction",life_fnc_robmeth];
		};
		
		if(_timer < 1) exitWith { _success = true;};
	};
	
	if(!_success) exitWith {[[_shop,"unblock"],"D41_fnc_BlockChemFabrik",false,false] call life_fnc_MP;};
	
	_Building = nearestObject[(getPos player), "land_dp_mainFactory_F"];
	for "_i" from 1 to _meth do
	{
		_P1 = (-12-(random(8))); _P2 = (9.5-(random(25.5))); _P3 = -4.35;
		_pos = _Building modelToWorld [_P1,_P2,_P3];
		_Tonne = "Land_MetalBarrel_F" createVehicle [0,0,0];
		_Tonne allowDamage false;
		_Tonne setPos _pos;
		[_Tonne] spawn {sleep 1200; _Obj = _this select 0; if(!isNull _Obj)then{deleteVehicle _Obj};};
	};
	
	hint format[localize "STR_D41_UberfallMethWievielGestohlen",_Meth];
	deleteMarker _Markername;
	if((side _robber) == civilian)then{ [[getPlayerUID _robber,name _robber,"212"],"life_fnc_wantedAdd",false,false] call life_fnc_MP; };
	[-30,0] call life_fnc_D41_KSys;

	//sleep 800;//Cooldown between the robberies // Wird via Variable vom Server aus geregelt
	_action = _shop addAction[localize "STR_D41_UberfallMethAddAction",life_fnc_robmeth];
	[] call life_fnc_hudUpdate;
};







