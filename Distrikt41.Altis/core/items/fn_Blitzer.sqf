//::::::::::::  ::::::::::::\\
//	Filename: core\items\fn_Blitzer.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Platziert Blitzer?
//::::::::::::  ::::::::::::\\
private["_position","_Blitzer"];
if(D41_BlitzerCounter == 1) exitWith {hint localize "STR_ISTR_BlitzerSchonAktiv"};
_Blitzer = "Land_Blitzer" createVehicle [0,0,0];
_Blitzer attachTo[player,[0,3.0,0.25]];
_Blitzer setDir 180;
_Blitzer setVariable["item","BlitzerDeployed",true];

life_action_BlitzerDeploy =
player addAction[localize "STR_pAct_deploy_Spotlight",{if(!isNull life_Blitzer) then {detach life_Blitzer; life_Blitzer = ObjNull;};
player removeAction life_action_BlitzerDeploy; life_action_BlitzerDeploy = nil;},"",999,false,false,"",'!isNull life_Blitzer'];

life_Blitzer = _Blitzer;
waitUntil {isNull life_Blitzer};
if(!isNil "life_action_BlitzerDeploy") then {player removeAction life_action_BlitzerDeploy;};
if(isNull _Blitzer) exitWith {life_Blitzer = ObjNull;};
_Blitzer setPos [(getPos _Blitzer select 0),(getPos _Blitzer select 1),(getPos _Blitzer select 2)];
player removeMagazine "D41_Blitzer";
_Blitzer setName "D41_Blitzer";
_Blitzer setVariable ["D41_Blitzer", false, true];
_Blitzer allowDamage false;
D41_BlitzerCounter = 1;