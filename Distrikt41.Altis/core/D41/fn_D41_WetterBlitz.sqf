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

	_pos = position _BlitzOrt;

	sleep 0.1;

	_light = "#lightpoint" createvehicle _pos;
	_light setposatl [_pos select 0,_pos select 1,(_pos select 2) + 10];
	_light setLightDayLight true;
	_light setLightBrightness 300;
	_light setLightAmbient [0.05, 0.05, 0.1];
	_light setlightcolor [1, 1, 2];

	sleep 0.1;
	_light setLightBrightness 0;
	sleep (random 0.1);

	for "_i" from 0 to 1 do
	{
		_light setLightBrightness (100 + random 100);
		sleep 0.1;
	};

	sleep 0.2;
	deletevehicle _light;
	0 setlightnings 0;
	sleep 30;