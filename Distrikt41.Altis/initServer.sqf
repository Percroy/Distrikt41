/*
	File: initServer.sqf
	
	Description:
	Starts the initialization of the server.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
if(!(_this select 0)) exitWith {}; //Not server
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";

setTimeMultiplier 12;
[] execVM "\life_server\Functions\D41\fn_updateStock.sqf";
[] execVM "\life_server\Functions\D41\PVPAreaMissions.sqf";