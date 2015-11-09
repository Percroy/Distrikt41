/*
    File: fn_leitkegel.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_leitkegel"];
_leitkegel = "RoadCone_L_F" createVehicle [0,0,0];
_leitkegel attachTo[player,[0,3.5,1]];
_leitkegel setDir 180;
_leitkegel setVariable["item","leitkegelDeployed",true];

life_action_leitkegelDeploy =
player addAction[localize "STR_pAct_deploy_Spotlight",{if(!isNull life_leitkegel) then {detach life_leitkegel; life_leitkegel = ObjNull;};
player removeAction life_action_leitkegelDeploy; life_action_leitkegelDeploy = nil;},"",999,false,false,"",'!isNull life_leitkegel'];

life_leitkegel = _leitkegel;
waitUntil {isNull life_leitkegel};
if(!isNil "life_action_leitkegelDeploy") then {player removeAction life_action_leitkegelDeploy;};
if(isNull _leitkegel) exitWith {life_leitkegel = ObjNull;};
player removeMagazine "D41_Leitkegel";
_leitkegel setPos [(getPos _leitkegel select 0),(getPos _leitkegel select 1),0];
_leitkegel allowDamage false;