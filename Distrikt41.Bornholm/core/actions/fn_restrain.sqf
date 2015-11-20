/*
	File: fn_restrain.sqf (CIV)
	Author: Bryan "Tonic" Boardwine
	EDIT: Distrikt41-Dscha
	Description:
	Retrains the client --- Since Tonic's Timer was crap - started EVERYTIME and stopped only when Timer ran out, so it was possible to unrestrain, when restrained 1s-4:59min earlier - i remade it...
*/
private["_cop","_player"];
_cop = param[0,Objnull,[Objnull]];
_player = player;
if(isNull _cop) exitWith {};
if(isNil "D41_HC_Timer")then{D41_HC_Timer = true};
//Timer neu geschrieben
[] spawn
{
	private["_time"];
	_time = time;
	while {true} do
	{
		if(D41_HC_Timer) then {_time = time; D41_HC_Timer = false;};
		if(!(player getVariable["restrained",false])) exitWith {D41_HC_Timer = true;};
		if((player getVariable ["escorting",TRUE])) then {D41_HC_Timer = true;};
		if((time - _time) > (5 * 60)) then
			{
				if(!(player getVariable["restrained",FALSE])) exitWith {D41_HC_Timer = true;};
				
				if (side player == civilian) then
				{
					if(!([west,getPos player,30] call life_fnc_nearUnits) && !([civilian,getPos player,20] call life_fnc_nearUnits) && (player getVariable["restrained",FALSE]) && vehicle player == player) exitWith
					{
						player setVariable["restrained",FALSE,TRUE];
						player setVariable["Escorting",FALSE,TRUE];
						player setVariable["transporting",false,true];
						detach player;
						D41_HC_Timer = true;
						titleText[localize "STR_D41_Auto_unrestrain","PLAIN"];
					};
				};
				
				if (side player == west) then
				{
					if(!([civilian,getPos player,20] call life_fnc_nearUnits) && (player getVariable["restrained",FALSE]) && vehicle player == player) exitWith
					{
						player setVariable["restrained",FALSE,TRUE];
						player setVariable["Escorting",FALSE,TRUE];
						player setVariable["transporting",false,true];
						detach player;
						D41_HC_Timer = true;
						titleText[localize "STR_D41_Auto_unrestrain","PLAIN"];
					};
				};
				D41_HC_Timer = true;
			};
		uisleep 30;
	};
};

if((player getVariable["surrender",FALSE])) then { player setVariable["surrender",FALSE,TRUE]; player switchMove ""; };


while {player getVariable "restrained"} do
{
	if(vehicle player == player) then
	{
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};

	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained") || vehicle player != _state};

	if(!alive player) exitWith
	{
		player setVariable ["restrained",false,true];
		player setVariable ["Escorting",false,true];
		player setVariable ["transporting",false,true];
		detach _player;
	};

	/*if(!alive _cop) exitWith {
		player setVariable ["Escorting",false,true];
		detach player;
	};*/

	if(vehicle player != player) then
	{
		//disableUserInput true;
		if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
	};
};

//disableUserInput false;

if(alive player) then
{	
	player spawn life_fnc_initGang;
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	detach player;
};