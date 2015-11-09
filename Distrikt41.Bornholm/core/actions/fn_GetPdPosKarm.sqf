/*
	File: fn_getPdPosKarm.sqf
	Author: Bryan "Tonic" Boardwine 
	Edited by: D41 - Avka
	
	Description:
	Based on Tonics DP Missions. Selects a random Point for a
	positive Karma Delivery Mission.
*/



private["_dp","_target","_item"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = ["D41_Blutkonserven", "D41_Pizzas", "D41_Teddybaer", "D41_Gummibaum"] call BIS_fnc_selectRandom;
D41_Pos_DelivItem = "";


//switch case abfrage wenn item x ausgewählt wähle delivery punkte y damit die zeile passen. blut konserve zum krankenhaus etc.
if(str(_target) in D41_pos_karma_points) then
{
	private["_point"];
	_point = D41_pos_karma_points - [(str(_target))];
	_dp = _point call BIS_fnc_selectRandom;
}
	else
{
	_dp = D41_pos_karma_points call BIS_fnc_selectRandom;
};



if(!(player canAdd _item)) exitWith {hint localize "STR_NOTF_InvFull";};
player addMagazine _item;

D41_Pos_DelivItem = _item;
life_pd_start = _target;

D41_pos_delivery_in_progress = true;
life_pd_point = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
life_cur_task = player createSimpleTask [format["Delivery_%1",life_pd_point]];
life_cur_task setSimpleTaskDescription [format[localize "STR_NOTF_DPStart",toUpper _dp],"Delivery Job",""];
life_cur_task setTaskState "Assigned";
player setCurrentTask life_cur_task;


["DeliveryAssigned",[format[localize "STR_NOTF_DPTask",toUpper _dp]]] call bis_fnc_showNotification;

[] spawn
{
	waitUntil {!D41_pos_delivery_in_progress OR !alive player};
	if(!alive player) then
	{
		life_cur_task setTaskState "Failed";
		player removeSimpleTask life_cur_task;
		["DeliveryFailed",[localize "STR_NOTF_DPFailed"]] call BIS_fnc_showNotification;
		D41_pos_delivery_in_progress = false;
		life_pd_point = nil;
	};
};