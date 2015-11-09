/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [];
		
		if(!license_cop_gangfirma && playerSide == west) then
		{
			_return = [
			["cop_spawn_1","Roenne HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Aakirkeby","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Nexoe","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_9","Sandvig","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_6","Roenne Innenstadt","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","Uebungsgelaende","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["cop_spawn_7","Gefaengnis","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
			];
		};
		
		if(license_cop_gangfirma && playerSide == west) then {
		_return = _return +[
								["cop_spawn_5","Security HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
								["cop_spawn_10","Security Posten","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
								["cop_spawn_6","Roenne Innenstadt","\a3\ui_f\data\map\Markers\NATO\b_air.paa"]
							];
		};
		
	};
	
	case civilian:
	{
		_return = [];
		
		if(license_civ_rebel && !license_civ_base05 && !license_civ_base06 && playerSide == civilian) then
		{
			_return = [
				["civ_spawn_reb1","Banditenlager Nord",	"\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_reb2","Banditenlager Sued",	"\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_reb3","PVP-Gebiet",			"\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(!license_civ_rebel && !license_civ_base01 && !license_civ_base02 && playerSide == civilian) then
		{
			_return = [
				["civ_spawn_1","Hauptstadt Roenne","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_2","Aakirkeby","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_3","Nexoe","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				["civ_spawn_4","Sandvig","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
			];
		};
		
		if(count life_houses > 0) then
		{
			{
				_pos = call compile format["%1",_x select 0];
				_house = [];
				_house = nearestObjects [_pos, D41_HausArray, 20];
				if(count(_house) == 0)exitWith{systemchat "FEHLER! BEIM ADMIN MELDEN! HOUSING SYSTEM StorageBox!"};
				if(isNil "_house")exitWith{systemchat "FEHLER! BEIM ADMIN MELDEN! HOUSING SYSTEM StorageBox! - IsNil"};
				_house = _house select 0;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				_uid = [_house, "uid"] call life_fnc_D41_GetHouseInfos;
				if(_uid isEqualTo "KeineDaten")exitWith{diag_log format ["::::::::: FEHLER: SpawnPointCfg: isNil _uid: _House: %1", _house];};
				if(!((typeOf _house) in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]))then{_return pushBack [format["house_%1",_uid],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];};
			} foreach life_houses;
		};
		
		if(license_civ_gangdmw && playerSide == civilian) then {
		_return = _return +[
								["civ_spawn_dmw01","DMW Basis","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
								["civ_spawn_dmw02","Waffendealer","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
							];
		};
		
		if(license_civ_base01 && playerSide == civilian) then {
		_return = _return +[
								["Base_1","Gangbase 01 Bandit","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
							];
		};
		
		if(license_civ_base02 && playerSide == civilian) then {
		_return = _return +[
								["Base_2","Gangbase 02 Bandit","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
							];
		};
		
		if(license_civ_base03 && playerSide == civilian) then {
		_return = _return +[
								["Base_3","Gangbase 03 Neutral","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
							];
		};
		
		if(license_civ_base04 && playerSide == civilian) then {
		_return = _return +[
								["Base_4","Gangbase 04 Neutral","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
							];
		};
		
		if(license_civ_base05 && playerSide == civilian) then {
		_return = _return +[
								["Base_5","Gangbase 05 Hero","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
							];
		};
		
		if(license_civ_base06 && playerSide == civilian) then {
		_return = _return +[
								["Base_6","IHV Firmensitz","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
							];
		};

	};
	
	case independent:
	{
		_return = [];
		
		if(license_med_adac && playerSide == independent) then {
		_return = _return + [
								["civ_spawn_31","ADAC Service","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
								["civ_spawn_32","ADAC HQ Service","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
								["civ_spawn_33","ADAC Service","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
								["civ_spawn_34","ADAC Service","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
							];
		};
		
		if(((call life_mediclevel) >= 2) && playerSide == independent && !license_med_adac) then {
		_return = _return +[
								["medic_spawn_3","Aakirkeby Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
								["medic_spawn_1","Roenne Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
								["medic_spawn_2","Nexoe Regional","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
							];
		};
			
	};
};

_return;