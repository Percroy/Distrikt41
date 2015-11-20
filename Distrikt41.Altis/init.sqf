enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Distrikt41 Life V1.3";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "core\D41\fn_D41_wetter.sqf";
[] spawn life_fnc_D41_Wetter;

if (!isServer)then
{
	[] execVM "\D41\D41\scripts\Markt\fn_D41_sysM.sqf";
};
enableEnvironment true;
setTerrainGrid 45;
StartProgress = true;

//Haustypliste
D41_HausArray = ["Land_i_Garage_V1_F","Land_Hospital_main_F","Land_Airport_center_F","Land_Airport_right_F","Land_Airport_left_F","Land_i_Garage_V2_F","Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V3_F","Land_i_Shed_Ind_F","Land_Slum_House02_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F","Land_i_House_Small_03_V1_F"];

// Zone Menu
D41_Cop_Zones = [];

// Eventhandler Reset - Infos von: http://feedback.arma3.com/view.php?id=24841
{
    _event = _x;
    _namespaceId = "BIS_stackedEventHandlers_";
    _namespaceEvent = _namespaceId + _event;
    _data = missionNameSpace getVariable [_namespaceEvent, []];
    {
        private "_itemId";
        _itemId	= [_x, 0, "", [""]] call BIS_fnc_param;
        [_itemId,_event] call bis_fnc_removeStackedEventHandler;
    } forEach _data;
} forEach ["oneachframe", "onpreloadstarted", "onpreloadfinished", "onmapsingleclick", "onplayerconnected", "onplayerdisconnected"];

//tf_radio_channel_password = player getVariable "tf_channel_password";
tf_radio_channel_name = "D41_TFAR";

CopRoenne = nearestObject [[1277.33,7709.33,-0.0113144],"Land_Offices_01_V1_F"];
fed_bank_building = nearestObject [[16778.787,13642.496,10],"Land_MilOffices_V1_F"];
fed_bank_building allowdamage false;