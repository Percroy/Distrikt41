/*
	File: fn_D41_KnastZaun.sqf
	Author: Distrikt41 - Dscha
	
	Description:
	Jo ähm, befüllen der Karre halt.
*/
private["_action", "_ui","_cP","_progress","_progressBar","_titleText","_pgText"];

_action = [
format[localize "STR_D41_Ask_Cut_Fence",D41_Geld],localize "STR_D41_Cut_Fence",localize "STR_Global_Yes",localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then
{
	[[[0,1,2],localize "STR_D41_Someone_Cut_Fence"],"life_fnc_broadcast",true,false] call life_fnc_MP;
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNamespace getVariable ["life_progress",displayNull];
	_progressBar = _ui displayCtrl 38201;
	_titleText = _ui displayCtrl 38202;
	_title = localize "STR_D41_Cutting_Fence_1";
	_titleText ctrlSetText format[localize "STR_D41_Progress_Fence_cut","%",_title];
	_progressBar progressSetPosition 0.01;
	_cP = 0.01;
	[] spawn life_fnc_D41_AnimLoop;

	while {true} do
	{
		sleep 3;
		_cP = _cP + 0.005;
		_progressBar progressSetPosition _cP;
		_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		if(!alive player) exitWith {D41_KnastZ = 0;};
		if(_cP >= 1) exitWith{D41_KnastZ = 1;};
		if(life_istazed) exitWith {D41_KnastZ = 0;};
		if(life_interrupted) exitWith {D41_KnastZ = 0;};
		if(player distance D41_KnastZaun > 4) exitWith {D41_KnastZ = 0; hint localize "STR_D41_Cut_Fence_Far"};
		if((player getVariable["restrained",false])) exitWith {D41_KnastZ = 0;};
		if(_cp == 0.5) then {[[[0,1,2],localize "STR_D41_already_cutting_fence"],"life_fnc_broadcast",true,false] call life_fnc_MP;};
	};
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(life_interrupted) exitWith {D41_KnastZ = 0; life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
	if(D41_KnastZ == 1) then {D41_KnastZ = 0; D41_KnastZaun setDammage 1;};
	[-15,0] call life_fnc_D41_KSys;
};