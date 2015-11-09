/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//D41_Waffen/Items in Box schmeißen
//Medics dont spawn loot! nononononoooo!
//if(playerside != independent)then{ [] spawn life_fnc_D41_DelGWH; };
[] spawn life_fnc_D41_DelGWH;
////////////////////////

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu
((findDisplay 7300) displayCtrl 7303) ctrlEnable false;

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	
	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	round(_maxTime - time) <= 0 OR isNull _this OR D41_MedReqDone};
	if(D41_MedReqDone)then
	{
		_maxTime = time + (10 * 60);
		waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; round(_maxTime - time) <= 0 OR isNull _this};
	};
	_RespawnBtn ctrlEnable true;
	D41_MedReqDone = false;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then
{
	if(vehicle _killer isKindOf "LandVehicle") then
	{
		if(playerside == civilian)then{ [[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"life_fnc_wantedAdd",false,false] call life_fnc_MP; };
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
			[[2],"life_fnc_removeLicenses",_killer,FALSE] call life_fnc_MP;
		};
		[[-100,1,life_D41_Karma],"life_fnc_D41_KSys",_killer,false] call life_fnc_MP;
	}
	else
	{
		if((side _killer) == civilian)then{ [[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"life_fnc_wantedAdd",false,false] call life_fnc_MP; };
		
		if(!local _killer) then
		{
			[[3],"life_fnc_removeLicenses",_killer,FALSE] call life_fnc_MP;
		};
		[[-100,1,life_D41_Karma],"life_fnc_D41_KSys",_killer,false] call life_fnc_MP;
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	life_copRecieve = _killer;
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] call life_fnc_MP;
	[[0],"life_fnc_removeLicenses",(getPlayerUID player),false] call life_fnc_MP;
	if(life_D41_Karma > 5000)then{life_D41_Karma = life_D41_Karma - 800};
	if(life_D41_Karma < -5000)then{life_D41_Karma = life_D41_Karma + 40};
	[9] call SOCK_fnc_updatePartial;
	//Did I rob the federal reserve?
	if(!life_use_atm && {D41_Geld > 0}) then
	{
		[format[localize "STR_Cop_RobberDead",[D41_Geld] call life_fnc_numberText],"life_fnc_broadcast",true,false] call life_fnc_MP;
		D41_Geld = 0;
	};
};

life_hunger = 100;
life_thirst = 100;
[] call life_fnc_dropMoney;
D41_Geld = 0;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] call life_fnc_MP;

[6] call SOCK_FNC_updatePartial;
[3] call SOCK_fnc_updatePartial;
if(playerside == civilian)then{ D41_DiedTimer = 1; [8] call SOCK_fnc_updatePartial;};