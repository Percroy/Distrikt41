//::::::::::::  ::::::::::::\\
//	Filename: core/housing/fn_getBuildingPositions.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Setzt Häuserkisten auf vor-definierte Positionen, innerhalb des Hauses. FORMAT: modelToWorld Koordinaten - [x,y,z,Azimut]
//	Description: Sets the Crates to pre-defined positions inside of a house. FORMAT: modelToWorld Coordinates - [x,y,z,Azimut]
//::::::::::::  ::::::::::::\\

private["_building","_arr","_restricted","_exitLoop","_i"];
	_building = _this select 0;
	_arr = [];

	_restricted = switch(typeOf _building) do
	{
		case "Land_i_House_Big_02_V1_F": {[[1.4,-1.5,-2.5,-90],[-3.3,2,-2.5,90],[3.5,2,0.8,-90]]};
		case "Land_i_House_Big_02_V2_F": {[[1.4,-1.5,-2.5,-90],[-3.3,2,-2.5,90],[3.5,2,0.8,-90]]};
		case "Land_i_House_Big_02_V3_F": {[[1.4,-1.5,-2.5,-90],[-3.3,2,-2.5,90],[3.5,2,0.8,-90]]};
		case "Land_i_House_Big_01_V1_F": {[[1.25,0,-2.5,0],[1.25,-1,0.9,180],[-3.2,-1.5,0.9,90],[-3.2,2,-2.5,90]]};
		case "Land_i_House_Big_01_V2_F": {[[1.25,0,-2.5,0],[1.25,-1,0.9,180],[-3.2,-1.5,0.9,90],[-3.2,2,-2.5,90]]};
		case "Land_i_House_Big_01_V3_F": {[[1.25,0,-2.5,0],[1.25,-1,0.9,180],[-3.2,-1.5,0.9,90],[-3.2,2,-2.5,90]]};
		case "Land_i_Stone_HouseSmall_V1_F": {[[-1,4,0,-90],[4,4,-0.2,-90]]};
		case "Land_i_Stone_HouseSmall_V2_F": {[[-1,4,0,-90],[4,4,-0.2,-90]]};
		case "Land_i_Stone_HouseSmall_V3_F": {[[-1,4,0,-90],[4,4,-0.2,-90]]};
		case "Land_i_Shed_Ind_F": {[[-3,0.5,-0.8,0],[-0.5,0.5,-0.8,0],[2,0.5,-0.8,0],[4.5,0.5,-0.8,0],[7,0.5,-0.8,0],[9.5,0.5,-0.8,0],[9.5,5,-0.8,90]]};
		case "Land_Slum_House02_F": {[[2,1,-0.75,0]]};
		case "Land_i_House_Small_01_V1_F": {[[-3,0,-0.7,-90],[-3,-3,-0.7,-90]]};
		case "Land_i_House_Small_01_V2_F": {[[-3,0,-0.7,-90],[-3,-3,-0.7,-90]]};
		case "Land_i_House_Small_01_V3_F": {[[-3,0,-0.7,-90],[-3,-3,-0.7,-90]]};
		case "Land_i_House_Small_02_V1_F": {[[2,-1,-0.7,-90],[-0.3,-1.5,-0.65,-90]]};
		case "Land_i_House_Small_02_V2_F": {[[2,-1,-0.7,-90],[-0.3,-1.5,-0.65,-90]]};
		case "Land_i_House_Small_02_V3_F": {[[2,-1,-0.7,-90],[-0.3,-1.5,-0.65,-90]]};
		case "Land_i_House_Small_03_V1_F": {[[-4.5,-1,0,90],[-4.5,3,0,90],[3.7,-4,0,0]]};
		default {[0,0,0,0]};
	};
	
	{
		_pos = _building modelToWorld [(_x select 0), (_x select 1), (_x select 2)];
		_dir = (_x select 3);
		_pos pushback _Dir;
		_arr pushback _pos;
	}forEach _restricted;
	_arr;