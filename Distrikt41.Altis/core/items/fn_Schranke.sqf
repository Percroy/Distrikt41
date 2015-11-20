/*
    File: fn_Schranke.sqf
    Author: OLLI aka Hauklotz
    
    Description:
    Holt das Item aus dem Inventar und setzt es auf der Map.
*/
private["_position","_Schranke"];
_Schranke = "Land_BarGate_F" createVehicle [0,0,0];
_Schranke attachTo[player,[0,3.0,4.1]];
_Schranke setDir 180;
_Schranke setVariable["item","schrankeDeployed",true];

life_action_SchrankeDeploy =
player addAction[localize "STR_pAct_deploy_Gate",{if(!isNull life_Schranke) then {detach life_Schranke; life_Schranke = ObjNull;};
player removeAction life_action_SchrankeDeploy; life_action_SchrankeDeploy = nil;},"",999,false,false,"",'!isNull life_Schranke'];

life_Schranke = _Schranke;
waitUntil {isNull life_Schranke};
if(!isNil "life_action_SchrankeDeploy") then {player removeAction life_action_SchrankeDeploy;};
if(isNull _Schranke) exitWith {life_Schranke = ObjNull;};
player removeMagazine "D41_Schranke";
_Schranke setPos [(getPos _Schranke select 0),(getPos _Schranke select 1),(getPos _Schranke select 2)];
_Schranke allowDamage false;

