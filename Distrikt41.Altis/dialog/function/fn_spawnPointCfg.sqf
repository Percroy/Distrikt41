/*
    File: fn_spawnPointCfg.sqf
    Author: Bryan "Tonic" Boardwine
    Edited: Insane
    
    Description:
    Master configuration for available spawn points depending on the units side.
    
    Return:
    [Spawn Marker,Spawn Name,Image Path]
*/
params [
    ["_side", civilian, [civilian]],
    "_return"
];
_return = [];


//Spawn Marker, Spawn Name, PathToImage
switch (_side) do {
    case west: {
        // BLU
        if (license_cop_gangfirma) then {
            // SECURITY 
            _return = [
                ["cop_spawn_5", "SEC HQ", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
                ["cop_spawn_10", "SEC Athira", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
                ["cop_spawn_6", "Airport", "\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
            ];
        } else {
            // COP
            _return = [
                ["cop_spawn_1", "Neochori", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
                ["cop_spawn_2", "Pyrgos", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
                ["cop_spawn_3", "Kavala", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
                ["cop_spawn_9", "Sofia", "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
                ["cop_spawn_4", "Syrta", "\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
                ["cop_spawn_6", "Airport", "\a3\ui_f\data\map\Markers\NATO\b_air.paa"],                
                ["cop_spawn_7", "Staatsgefängnis", "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"]
            ];
        };
    };    
    case independent: {
        // IND
        if (license_med_adac) then {
            // ADAC
            _return = [
                ["civ_spawn_32", "ADAC HQ Service", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
                ["civ_spawn_31", "ADAC Service", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"],                
                ["civ_spawn_33", "ADAC Service", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
                ["civ_spawn_34", "ADAC Service", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
            ];
        } else {
            // MEDIC
            _return = [
                ["medic_spawn_3", "Pyrgos Hospital", "\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
                ["medic_spawn_1", "Neochori Hospital", "\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
                ["medic_spawn_2", "Kavala Hospital", "\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
            ];
        };            
    };    
    case civilian: {
        if (license_civ_rebel && !license_civ_base05 && !license_civ_base06) then {
            // Normaler Rebell
            _return = [
                ["civ_spawn_reb1", "Banditenlager West", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
                ["civ_spawn_reb2", "Banditenlager Ost", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
                ["civ_spawn_reb3", "PVP-Gebiet", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
            ];
        };   
        
        if(!license_civ_rebel && !license_civ_base01 && !license_civ_base02) then {
            // Normaler CIV
            _return = [
                ["civ_spawn_1", "Neochori (Hauptstadt)", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
                ["civ_spawn_2", "Pyrgos", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
                ["civ_spawn_3", "Kavala", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
                ["civ_spawn_4", "Sofia", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
            ];
        }; 
        
        if ((count life_houses) > 0) then {
            {
                private ["_pos","_house","_houseName","_uid"];
                _pos = call compile format["%1", _x select 0];
                _house = [];
                _house = nearestObjects [_pos, D41_HausArray, 20];
                if (_house isEqualTo []) exitWith { systemchat "FEHLER! BEIM ADMIN MELDEN! HOUSING SYSTEM StorageBox!"; };
                if (isNil "_house") exitWith { systemchat "FEHLER! BEIM ADMIN MELDEN! HOUSING SYSTEM StorageBox! - IsNil"; };
                _house = _house select 0;
                _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
                _uid = [_house, "uid"] call life_fnc_D41_GetHouseInfos;
                if (_uid isEqualTo "KeineDaten") exitWith { diag_log format ["::::::::: FEHLER: SpawnPointCfg: isNil _uid: _House: %1", _house]; };
                if (!((typeOf _house) in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"])) then { _return pushBack [format["house_%1",_uid], _houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"]; };
                nil 
            } count life_houses;
        };
        
        /*if(license_civ_gangdmw && playerSide == civilian) then {
        _return = _return +[
                                ["civ_spawn_dmw01","DMW Basis","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
                                ["civ_spawn_dmw02","Waffendealer","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
                            ];
        };*/
        
        if (license_civ_base01) then {
            _return pushBack ["Base_1", "Gangbase 01 (Bandit)", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
        };
        
        if (license_civ_base02) then {
            _return pushBack ["Base_2", "Gangbase 02 (Bandit)", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
        };
        
        if (license_civ_base03) then {
            _return pushBack ["Base_3", "Gangbase 03 (Neutral)", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
        };
        
        if (license_civ_base04) then {
            _return pushBack ["Base_4","Gangbase 04 (Neutral)", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
        };
        
        if (license_civ_base05) then {
            _return pushBack ["Base_5","Gangbase 05 (Hero)", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
        };
        
        if (license_civ_base06) then {
            _return pushBack ["Base_6", "IHV Firmensitz", "\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
        };
    };
};

_return 