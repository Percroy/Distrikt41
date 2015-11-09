/*
    File: fn_strahler.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_strahler"];
_strahler = "Land_PortableLight_double_F" createVehicle [0,0,0];
_strahler attachTo[player,[0,3.5,1]];
_strahler setDir 180;
_strahler setVariable["item","strahlerDeployed",true];

life_action_strahlerDeploy =
player addAction[localize "STR_pAct_deploy_Spotlight",{if(!isNull life_strahler) then {detach life_strahler; life_strahler = ObjNull;};
player removeAction life_action_strahlerDeploy; life_action_strahlerDeploy = nil;},"",999,false,false,"",'!isNull life_strahler'];

life_strahler = _strahler;
waitUntil {isNull life_strahler};
if(!isNil "life_action_strahlerDeploy") then {player removeAction life_action_strahlerDeploy;};
if(isNull _strahler) exitWith {life_strahler = ObjNull;};
player removeMagazine "D41_Strahler";
_strahler setPos [(getPos _strahler select 0),(getPos _strahler select 1),0];
_strahler allowDamage false;