#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
setTerrainGrid 45;
publicVariable "life_server_isReady";

[] execVM "\life_server\functions.sqf";
[] execVM "\life_server\eventhandlers.sqf";
[] execVM "\life_server\Functions\D41\fn_D41_RandomBlitze.sqf";
//[] execVM "\life_server\Functions\D41\fn_CleanupTest.sqf";

//I am aiming to confuse people including myself, ignore the ui checks it's because I test locally.

_extDB = false;

//Only need to setup extDB once.
if(isNil {uiNamespace getVariable "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	__CONST__(life_sql_id,life_sql_id);
	uiNamespace setVariable ["life_sql_id",life_sql_id];

	//extDB Version
	_result = "extDB" callExtension "9:VERSION";
	diag_log format ["extDB: Version: %1", _result];
	if(_result == "") exitWith {};
	if ((parseNumber _result) < 14) exitWith {diag_log "Error: extDB version 14 or Higher Required";};

	//Initialize the database
	_result = "extDB" callExtension "9:DATABASE:Database2";
	if(_result != "[1]") exitWith {diag_log "extDB: Error with Database Connection";};
	_result = "extDB" callExtension format["9:ADD:DB_RAW_V2:%1",(call life_sql_id)];
	if(_result != "[1]") exitWith {diag_log "extDB: Error with Database Connection";};
	"extDB" callExtension "9:LOCK";
	_extDB = true;
	diag_log "extDB: Connected to Database";
} else {
	life_sql_id = uiNamespace getVariable "life_sql_id";
	__CONST__(life_sql_id,life_sql_id);
	_extDB = true;
	diag_log "extDB: Still Connected to Database";
};

//Broadbase PV to Clients, to warn about extDB Error.
//	exitWith to stop trying to run rest of Server Code
if (!_extDB) exitWith {
	life_server_extDB_notLoaded = true;
	publicVariable "life_server_extDB_notLoaded";
	diag_log "extDB: Error checked extDB/logs for more info";
};

//Run procedures for SQL cleanup on mission start.
["CALL resetLifeVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteOldHouses",1] spawn DB_fnc_asyncCall;
["CALL deleteOldGangs",1] spawn DB_fnc_asyncCall; //Maybe delete old gangs
["DELETE FROM houses WHERE owned='0'",1] spawn DB_fnc_asyncCall;

life_adminlevel = 0;
life_medicLevel = 0;
life_coplevel = 0;

//Null out harmful things for the server.
__CONST__(JxMxE_PublishVehicle,"No");

//[] execVM "\life_server\fn_initHC.sqf";

life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Polizei Kanal (NON-RP)", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Zivi Knuddelz Chat <3<3<3", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0.9, 0, 0, 0.8], "Medizinischer Notfall", "%UNIT_NAME", []];

serv_sv_use = [];

fed_bank setVariable["safe",(count playableUnits),true];

//General cleanup for clients disconnecting.
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}]; //Do not second guess this, this can be stacked this way.

[] execVM "\life_server\Functions\Systems\fn_cleanup.sqf";

life_gang_list = [];
publicVariable "life_gang_list";
life_wanted_list = [];
client_session_list = [];

[] execFSM "\life_server\cleanup.fsm";

[] spawn
{
	private["_logic","_queue"];
	while {true} do
	{
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
	};
};

[] spawn TON_fnc_federalUpdate;

[] spawn
{
	while {true} do
	{
		sleep (30 * 60);
		{
			_x setVariable["sellers",[],true];
		} foreach [Dealer_1,Dealer_2];
	};
};

//Strip NPC's of weapons
{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

D41_HouseInitDone = false;
[] spawn TON_fnc_initHouses;
waitUntil{D41_HouseInitDone};

//Lockup the dome
if(worldName == "Bornholm")then
{
	private["_dome","_rsb"];
	_dome = nearestObject [[1543.5426,12932.632,16.641211],"Land_MilOffices_V1_F"];
	for "_i" from 1 to 8 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
	_dome allowDamage false;
	//Lockup the Wakas
	private["_waka01","_waka02","_waka03"];
	_waka01 = nearestObject [[9419.01,5974.51,0],"Land_Cargo_House_V3_F"];
	_waka02 = nearestObject [[1990.3379,8977.2695,0],"Land_Cargo_House_V3_F"];
	_waka03 = nearestObject [[9305.70,2561.84,0],"Land_Cargo_House_V3_F"];
	_waka01 setVariable[format["bis_disabled_Door_%1",1],1,true]; _waka01 animate [format["Door_%1_rot",1],0];
	_waka02 setVariable[format["bis_disabled_Door_%1",1],1,true]; _waka02 animate [format["Door_%1_rot",1],0];
	_waka03 setVariable[format["bis_disabled_Door_%1",1],1,true]; _waka03 animate [format["Door_%1_rot",1],0];
};
if(worldName == "Altis")then
{
	private["_dome","_rsb"];
	_dome = nearestObject [[12407.433,14351.427,0],"Land_Offices_01_V1_F"];
	for "_i" from 1 to 8 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
	_dome allowDamage false;
	//Lockup the Wakas
	private["_waka01","_waka02","_waka03"];
	_waka01 = nearestObject [[20767.281,6815.1353,0],"Land_Cargo_House_V3_F"];
	_waka02 = nearestObject [[13809.527,18978.412,0],"Land_Cargo_House_V3_F"];
	_waka03 = nearestObject [[16599.314,12819.904,0],"Land_Cargo_House_V3_F"];
	_waka01 setVariable[format["bis_disabled_Door_%1",1],1,true]; _waka01 animate [format["Door_%1_rot",1],0];
	_waka02 setVariable[format["bis_disabled_Door_%1",1],1,true]; _waka02 animate [format["Door_%1_rot",1],0];
	_waka03 setVariable[format["bis_disabled_Door_%1",1],1,true]; _waka03 animate [format["Door_%1_rot",1],0];
};
//Fill PoliceCrates
avka01 addWeaponCargoGlobal ["hlc_rifle_M4",3]; avka01 addWeaponCargoGlobal ["rhs_weap_m16a4_grip",3]; avka01 addWeaponCargoGlobal ["rhs_weap_m14ebrri",1]; avka01 addWeaponCargoGlobal ["arifle_MX_SW_Black_F",1]; avka01 addWeaponCargoGlobal ["rhs_weap_M320",1]; avka01 addItemCargoGlobal ["optic_Hamr", 8]; avka01 addItemCargoGlobal ["FHQ_optic_AC12136", 8]; avka01 addItemCargoGlobal ["FHQ_optic_LeupoldERT", 1]; avka01 addItemCargoGlobal ["HandGrenade_Stone", 6]; avka01 addItemCargoGlobal ["SmokeShellBlue", 4]; avka01 addMagazineCargoGlobal ["3Rnd_SmokeGreen_Grenade_shell", 3]; avka01 addMagazineCargoGlobal ["3Rnd_UGL_FlareWhite_F", 2]; avka01 addMagazineCargoGlobal ["20Rnd_762x51_Mag", 6]; avka01 addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 36]; avka01 addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_Tracer", 36];
avka02 addWeaponCargoGlobal ["hlc_rifle_M4",3]; avka02 addWeaponCargoGlobal ["rhs_weap_m16a4_grip",3]; avka02 addWeaponCargoGlobal ["rhs_weap_m14ebrri",1]; avka02 addWeaponCargoGlobal ["arifle_MX_SW_Black_F",1]; avka02 addWeaponCargoGlobal ["rhs_weap_M320",1]; avka02 addItemCargoGlobal ["optic_Hamr", 8]; avka02 addItemCargoGlobal ["FHQ_optic_AC12136", 8]; avka02 addItemCargoGlobal ["FHQ_optic_LeupoldERT", 1]; avka02 addItemCargoGlobal ["HandGrenade_Stone", 6]; avka02 addItemCargoGlobal ["SmokeShellBlue", 4]; avka02 addMagazineCargoGlobal ["3Rnd_SmokeGreen_Grenade_shell", 3]; avka02 addMagazineCargoGlobal ["3Rnd_UGL_FlareWhite_F", 2]; avka02 addMagazineCargoGlobal ["20Rnd_762x51_Mag", 6]; avka02 addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 36]; avka02 addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_Tracer", 36];
avka03 addWeaponCargoGlobal ["hlc_rifle_M4",3]; avka03 addWeaponCargoGlobal ["rhs_weap_m16a4_grip",3]; avka03 addWeaponCargoGlobal ["rhs_weap_m14ebrri",1]; avka03 addWeaponCargoGlobal ["arifle_MX_SW_Black_F",1]; avka03 addWeaponCargoGlobal ["rhs_weap_M320",1]; avka03 addItemCargoGlobal ["optic_Hamr", 8]; avka03 addItemCargoGlobal ["FHQ_optic_AC12136", 8]; avka03 addItemCargoGlobal ["FHQ_optic_LeupoldERT", 1]; avka03 addItemCargoGlobal ["HandGrenade_Stone", 6]; avka03 addItemCargoGlobal ["SmokeShellBlue", 4]; avka03 addMagazineCargoGlobal ["3Rnd_SmokeGreen_Grenade_shell", 3]; avka03 addMagazineCargoGlobal ["3Rnd_UGL_FlareWhite_F", 2]; avka03 addMagazineCargoGlobal ["20Rnd_762x51_Mag", 6]; avka03 addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 36]; avka03 addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_Tracer", 36];

life_server_isReady = true;
publicVariable "life_server_isReady";
