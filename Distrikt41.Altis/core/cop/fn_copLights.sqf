/*
	File: fn_copLights.sqf
	Author: mindstorm, modified by Adanteh
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/
Private ["_vehicle","_lightWhite","_lightBlue","_OffroadListe","_LadaListe","_lightleft","_lightright","_leftRed","_OffroadPol","_OffroadMedic","_OffroadAdac"];
_vehicle = _this select 0;

if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};
_lightWhite = [0,0,0];
_lightBlue = [0,0,0];
_OffroadListe = ["D41_Offroad_Pol","D41_Offroad_Snake_TFuel_TPS","D41_Offroad_SWAT","D41_Offroad_Medic2","D41_Offroad_Medic","D41_Offroad_ADAC3","D41_Offroad_ADAC2","D41_Offroad_ADAC"];
_LadaListe = ["D41_Lada_Civ_05","D41_Lada_Civ_05_tuned"];
if((typeOf _vehicle) in _OffroadListe OR (typeOf _vehicle) in _LadaListe)exitWith{};

_lightleft = "#lightpoint" createVehicle getpos _vehicle;
_lightright = "#lightpoint" createVehicle getpos _vehicle;
sleep 0.2;

_OffroadPol = ["D41_Offroad_Pol","D41_Offroad_Snake_TFuel_TPS","D41_Offroad_SWAT"];
_OffroadMedic = ["D41_Offroad_Medic2","D41_Offroad_Medic"];
_OffroadAdac = ["D41_Offroad_ADAC3","D41_Offroad_ADAC2","D41_Offroad_ADAC"];

if((typeOf _vehicle) in _OffroadPol)then		{_lightWhite = [0,0,0];			_lightBlue = [0, 0, 20];	_lightleft setLightAmbient [0,0,1]; _lightright setLightAmbient [0,0,1];};
if((typeOf _vehicle) in _OffroadMedic)then		{_lightWhite = [0,0,0]; 		_lightBlue = [0, 0, 20];	_lightleft setLightAmbient [0,0,1]; _lightright setLightAmbient [0,0,1];};
if((typeOf _vehicle) in _OffroadAdac)then		{_lightWhite = [20, 20, 0.1];	_lightBlue = [20, 20, 0];	_lightleft setLightAmbient [1,1,0]; _lightright setLightAmbient [1,1,0];};

//Pol: "D41_Lada_Civ_05","D41_Lada_Civ_05_tuned","D41_Offroad_Pol","D41_Offroad_Snake_TFuel_TPS","D41_Offroad_SWAT","D41_BMW_X6M_Pol2","D41_B_Truck_01_ammo_cop","D41_tigr_swat","D41_swat_hunter"
//Sani: "D41_B_HMMWV_Medevac","D41_Offroad_Medic2","D41_Offroad_Medic","D41_S1203_Civ_02"
//ADAC: "D41_Offroad_ADAC3","D41_Offroad_ADAC2","D41_Offroad_ADAC",




//if((typeOf _vehicle) in _OffroadListe)			then{_lightleft attachTo [_vehicle, [-0.37, 0.0, 0.56]];	_lightright attachTo [_vehicle, [0.37, 0.0, 0.56]]; _vehicle animate ["BeaconsStart",1];};
//if((typeOf _vehicle) in _LadaListe)				then{_lightleft attachTo [_vehicle, [-0.37,-1.2,0.42]];		_lightright attachTo [_vehicle, [0.37, 0.0, 0.56]];}; //ToDo
if((typeOf _vehicle) in ["D41_BMW_X6M_Pol2"])	then{_lightleft attachTo [_vehicle, [-0.4, 2.3, -0.55]];	_lightright attachTo [_vehicle, [0.4, 2.3, -0.55]];};
if((typeOf _vehicle) in ["D41_tigr_swat"])		then{_lightleft attachTo [_vehicle, [-0.37, -1.9, 0.7]];	_lightright attachTo [_vehicle, [0.37, -1.9, 0.7]];};
if((typeOf _vehicle) in ["D41_swat_hunter"])	then{_lightleft attachTo [_vehicle, [-0.37, -1.9, 0.7]];	_lightright attachTo [_vehicle, [0.37, -1.9, 0.7]];};

_lightleft setLightColor _lightWhite;
_lightleft setLightBrightness 0.2;
_lightleft setLightAttenuation [0.181, 0, 1000, 130];
_lightleft setLightIntensity 10;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;
_lightleft setLightDayLight true;

_lightright setLightColor _lightBlue;
_lightright setLightBrightness 0.2;
_lightright setLightAttenuation [0.181, 0, 1000, 130]; 
_lightright setLightIntensity 10;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare true;
_lightright setLightDayLight true;


_leftRed = true;
while{(alive _vehicle)} do
{
	if(!(_vehicle getVariable "lights")) exitWith {};
	if(_leftRed) then
	{
		_leftRed = false;
		_lightright setLightBrightness 0.0;
		sleep 0.05;
		_lightleft setLightBrightness 6;
	}
		else
	{
		_leftRed = true;
		_lightleft setLightBrightness 0.0;
		sleep 0.05;
		_lightright setLightBrightness 6;
	};
	sleep (_this select 1);
};
_vehicle animate ["BeaconsStart",0];
deleteVehicle _lightleft;
deleteVehicle _lightright;