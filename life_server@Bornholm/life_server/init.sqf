#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
DB_Async_Active = false;
D41_GKarmaQry = false;
//DB_Async_ExtraLock = false;	//DEV Ausgeschalten auf anraten von Itsyuka
life_server_isReady = false;
setTerrainGrid 45;
publicVariable "life_server_isReady";

[] execVM "\life_server\functions.sqf";
[] execVM "\life_server\eventhandlers.sqf";
[] execVM "\life_server\Functions\D41\fn_D41_RandomBlitze.sqf";
[] execVM "\life_server\Functions\D41\fn_KarmaGarageVehicleList.sqf";

//I am aiming to confuse people including myself, ignore the ui checks it's because I test locally.

_extDB = false;

//Only need to setup extDB2 once.
if(isNil {uiNamespace getVariable "life_sql_id"}) then {
        life_sql_id = round(random(9999));
        __CONST__(life_sql_id,life_sql_id);
        uiNamespace setVariable ["life_sql_id",life_sql_id];
 
        //extDB2 Version
        _result = "extDB2" callExtension "9:VERSION";
        diag_log format ["extDB2: Version: %1", _result];
        if(_result == "") exitWith {};
        if ((parseNumber _result) < 14) exitWith {diag_log "Error: extDB2 version 14 or Higher Required";};
 
        //Initialize the database
        _result = "extDB2" callExtension "9:ADD_DATABASE:Database2";
                                                                       
        if(_result != "[1]") exitWith {diag_log "extDB2: Error with Database Connection";};
       
        _result = "extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:Database2:SQL_CUSTOM_V2:%1:Distrikt41",(call life_sql_id)];
        if(_result != "[1]") exitWith {diag_log "extDB2: Error with Database Connection";};
        "extDB2" callExtension "9:LOCK";
        _extDB = true;
        diag_log "extDB2: Connected to Database";
} else {
        life_sql_id = uiNamespace getVariable "life_sql_id";
        __CONST__(life_sql_id,life_sql_id);
        _extDB = true;
        diag_log "extDB2: Still Connected to Database";
};

//Broadbase PV to Clients, to warn about extDB2 Error.
//	exitWith to stop trying to run rest of Server Code
if (!_extDB) exitWith {
	life_server_extDB_notLoaded = true;
	publicVariable "life_server_extDB_notLoaded";
	diag_log "extDB2: Error checked extDB2/logs for more info";
};

//Cleanup
["ServerCleanup",1] spawn DB_fnc_asyncCall;

//Zugriff auf Gangbasen einrichten
//waitUntil{!DB_Async_Active};
_query = ["GetRentedGangBases",2,true] call DB_fnc_asyncCall;
D41_RentedGangBasesIDs = [];
D41_RentedGangBasesLiz = [];
{
	D41_RentedGangBasesIDs pushback (_x select 0);
	D41_RentedGangBasesLiz pushback (_x select 1);
}forEach _query;
diag_log format [":::::::::::::::::::: INIT: D41_RentedGangBasesIDs GangID: %1", D41_RentedGangBasesIDs];
diag_log format [":::::::::::::::::::: INIT: D41_RentedGangBasesLiz LizName: %1", D41_RentedGangBasesLiz];
publicVariable "D41_RentedGangBasesIDs";
publicVariable "D41_RentedGangBasesLiz";

life_adminlevel = 0;
life_medicLevel = 0;
life_coplevel = 0;

//Null out harmful things for the server.
__CONST__(JxMxE_PublishVehicle,"No");

//[] execVM "\life_server\fn_initHC.sqf";

life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Police Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Zivi Knuddelz Chat <3<3<3", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0.9, 0, 0, 0.8], localize  "STR_D41_Medic_Channel", "%UNIT_NAME", []];
life_radio_Dead = radioChannelCreate [[0.9, 0.5, 0.5, 0.8], "I am dead", "%UNIT_NAME", []];

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

[] spawn TON_fnc_initHouses;
waitUntil{D41_HouseInitDone};

//Lockup the dome
if(worldName == "Bornholm")then
{
	private["_dome","_rsb"];
	_dome = nearestObject [[5799.5044,8080.9805,1],"Land_Offices_01_V1_F"];
	D41_Hausliste pushback (getPosATL _dome);
	for "_i" from 1 to 8 do {_dome animate [format["Door_%1_rot",_i],0];};
	_dome allowDamage false;
	
	//Lockup Police Roenne
	for "_i" from 1 to 8 do {CopRoenne animate [format["Door_%1_rot",_i],0];};
	CopRoenne allowDamage false;
	
	//Lockup the Wakas
	{
		_x animate [format["Door_%1_rot",1],0];
	}forEach [waka01, waka02, waka03];
	
	//LockUp fed_bank_building
	for "_i" from 1 to 8 do {fed_bank_building animate [format["Door_%1_rot",_i],0];};
};
if(worldName == "Altis")then
{
	private["_dome","_rsb"];
	_dome = nearestObject [[12407.433,14351.427,0],"Land_Offices_01_V1_F"];
	for "_i" from 1 to 8 do {_dome animate [format["Door_%1_rot",_i],0];};
	_dome allowDamage false;
	//Lockup the Wakas
	{
		_x animate [format["Door_%1_rot",1],0];
	}forEach [waka01, waka02, waka03];
};


//Fill PoliceCrates
[] spawn
{
	_PolWpnList = [["RH_Hk416",3],["RH_Hk416",3],["RH_M16A3",3],["srifle_DMR_03_F",1],["arifle_MX_SW_Black_F",1],["rhs_weap_M320",1]];
	{
		Pol_Waffenkiste01 addWeaponCargoGlobal [_x select 0, _x select 1];
		Pol_Waffenkiste02 addWeaponCargoGlobal [_x select 0, _x select 1];
		Pol_Waffenkiste03 addWeaponCargoGlobal [_x select 0, _x select 1];	
	}forEach _PolWpnList;
	_PolMagList = [["3Rnd_SmokeGreen_Grenade_shell", 3],["3Rnd_UGL_FlareWhite_F", 2],["20Rnd_762x51_Mag", 6],["30Rnd_556x45_Stanag", 46],["100Rnd_65x39_caseless_mag_Tracer", 6]];
	{
		Pol_Waffenkiste01 addMagazineCargoGlobal [_x select 0, _x select 1];
		Pol_Waffenkiste02 addMagazineCargoGlobal [_x select 0, _x select 1];
		Pol_Waffenkiste03 addMagazineCargoGlobal [_x select 0, _x select 1];
	}forEach _PolMagList;
	_PolItmList = [["optic_Hamr", 8],["FHQ_optic_AC12136", 8],["optic_AMS", 1],["HandGrenade_Stone", 6],["SmokeShellBlue", 4]];
	{
		Pol_Waffenkiste01 addItemCargoGlobal [_x select 0, _x select 1];
		Pol_Waffenkiste02 addItemCargoGlobal [_x select 0, _x select 1];
		Pol_Waffenkiste03 addItemCargoGlobal [_x select 0, _x select 1];
	}forEach _PolItmList;
};

//Re-Build Knast_Spreng dingenskirchens
[] spawn
{
	_Ganz = "Land_Cargo_House_V3_F" createVehicle [10394.704,9232.5898,-0.5];
	waitUntil{!IsNull _Ganz};
	_Ganz allowDamage false;
	_Ganz setPosATL [10394.704,9232.5898,-0.5];
	D41_Hausliste pushback [10394.704,9232.5898,-0.5];
	_Ganz setDir 223.70599;
	//LockUp
	_Ganz animate [format["Door_%1_rot",1],0];
};
publicVariable "D41_HausListe";

life_server_isReady = true;
publicVariable "life_server_isReady";

//tf_channel_password = compileFinal ("Gdouhgd9h97dg");
//publicVariable "tf_channel_password";
D41_AllChemBlocked = false;
publicVariable "D41_AllChemBlocked";
