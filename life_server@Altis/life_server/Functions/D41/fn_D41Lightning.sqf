/*
	Author: Karel Moricky
	EDIT by: Distrikt41 - Dscha
	Description:
	Zeus lightning strike

	Parameter(s):
	http://community.bistudio.com/wiki/Arma_3_Modules

	Returns:
	NONE
*/

_BlitzOrt = _this select 0;

if(true)then
{
	_pos = position _BlitzOrt;

	_bolt = createVehicle ["D41_LightningBolt", _pos, [], 0, "CAN_COLLIDE"];
	_bolt setposatl _pos;
	_RndmSound =
	[
	"a3\sounds_f\ambient\thunder\thunder_01.wss",
	"a3\sounds_f\ambient\thunder\thunder_02.wss",
	"a3\sounds_f\ambient\thunder\thunder_03.wss",
	"a3\sounds_f\ambient\thunder\thunder_04.wss",
	"a3\sounds_f\ambient\thunder\thunder_05.wss",
	"a3\sounds_f\ambient\thunder\thunder_06.wss"
	] call BIS_fnc_selectRandom;
	playSound3D [_RndmSound, _BlitzOrt, false, getPosASL _BlitzOrt, 20, 1, 3000];
	sleep 0.1;
	_bolt setdamage 1;
	sleep (random 0.1);

	_class = ["D41_Lightning1_F","D41_lightning2_F"] call bis_fnc_selectrandom;
	_lightning = _class createvehicle [100,100,100];
	_lightning setpos _pos;

	sleep 0.75;
	deletevehicle _lightning;
	0 setlightnings 0;
	sleep 30;
	deletevehicle _bolt;
};