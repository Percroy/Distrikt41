/*
file: fn_robShops.sqf
Author: MrKraken
Description:
Executes the rob shob action!
Modified by: KrisSerbia, Insane
*/
private["_timer","_funds","_dist","_success","_cooldown","_marker","_robberyreward"];
params [
    ["_shop", ObjNull, [ObjNull]],
    ["_robber", ObjNull, [ObjNull]],
    "_action"
];

_timer = 300;
_cooldown = 60 * 15;
_funds = 5000 + round(random 10000);
_dist = _robber distance _shop;


// checks
if (vehicle player != _robber) exitWith { hint localize "STR_D41_VorherAussteigen"; false };
if (side _robber != Civilian) exitWith { hint localize "STR_D41_UeberfallIstCop"; false };
if (alive _robber && {currentWeapon _robber == ""}) exitWith { hint localize "STR_D41_UeberfallKeineWaffe"; false };
if ((time - (_shop getVariable ["lastTimeRobbed", 0])) < _cooldown) exitWith { hint localize "STR_D41_UeberfallCooldown"; false };
if (_shop getVariable ["robberyInAction", false]) exitWith { hint localize "STR_D41_UeberfallBereitsImGange"; false };
if (({side _x == west} count playableUnits) < 2) exitWith {hint localize "STR_D41_MindestAnzahlCops2"; false };


_shop setVariable ["robberyInAction", true, true];
_pos = getPos player;
_success = false;
    
hint format [localize "STR_D41_UeberfallTanke",_timer];
[[2,localize "STR_D41_UeberfallMarker"],"life_fnc_broadcast",west,false] call life_fnc_MP;
    
_shop switchMove "AmovPercMstpSsurWnonDnon";
_shop removeAction _action;
    
_marker = createMarker [format["robbery_%1", _funds], _Pos];
_marker setMarkerColor "ColorRed";
_marker setMarkerText localize "STR_D41_UeberfallMarker";
_marker setMarkerType "mil_warning";

while {true} do {
    _timer = _timer - 1;
    _dist = _robber distance _shop;

    hintSilent format [localize "STR_D41_UeberfallTankeTimer", _timer];

    if (!alive _robber) exitWith {
        deleteMarker _marker;
        _shop switchMove "";
        _action = _shop addAction[localize "STR_D41_UberfallTankeAddAction",life_fnc_robShops];
        _shop setVariable ["robberyInAction", false, true];
    };

    if (_dist >= 6) exitWith {
        hint localize "STR_D41_UeberfallTankeAusReichweite";
        deleteMarker _marker;
        _shop switchMove "";
        _action = _shop addAction[localize "STR_D41_UberfallTankeAddAction",life_fnc_robShops];
        _shop setVariable ["robberyInAction", false, true];
    };

    if (life_istazed) exitWith {
        hint localize "STR_D41_UeberfallTankeTazer";
        deleteMarker _marker;
        _shop switchMove "";
        _action = _shop addAction[localize "STR_D41_UberfallTankeAddAction",life_fnc_robShops];
        _shop setVariable ["robberyInAction", false, true];
    };

    if (_timer < 1) exitWith { _success = true; };

    sleep 1;
};
    
if (!_success) exitWith { false };

D41_Geld = D41_Geld + _funds;
hint format[localize "STR_D41_UberfallTankeWievielGestohlen",_funds];

deleteMarker _marker;
_shop setVariable ["lastTimeRobbed", time, true];
_shop setVariable ["robberyInAction", false, true];
    
if ((side _robber) == civilian) then { [[getPlayerUID _robber,name _robber,"212"],"life_fnc_wantedAdd",false,false] call life_fnc_MP; };
[-30,0] call life_fnc_D41_KSys;

_shop switchMove "";
_action = _shop addAction[localize "STR_D41_UberfallTankeAddAction",life_fnc_robShops];
[] call life_fnc_hudUpdate;

true 