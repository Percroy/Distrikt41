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
		case "Land_i_House_Big_02_V1_F":		{[[2.4,-1.5,-2.6,-90],[-4.3,2,-2.6,90],[4.5,2,0.8,-90]]};
		case "Land_i_House_Big_02_V2_F":		{[[2.4,-1.5,-2.6,-90],[-4.3,2,-2.6,90],[4.5,2,0.8,-90]]};
		case "Land_i_House_Big_02_V3_F":		{[[2.4,-1.5,-2.6,-90],[-4.3,2,-2.6,90],[4.5,2,0.8,-90]]};
		case "Land_i_House_Big_01_V1_F":		{[[1.25,1,-2.6,0],[1.25,-2.5,0.8,180],[-4.2,-1.5,0.8,90],[-4.2,2,-2.6,90]]};
		case "Land_i_House_Big_01_V2_F":		{[[1.25,1,-2.6,0],[1.25,-2.5,0.8,180],[-4.2,-1.5,0.8,90],[-4.2,2,-2.6,90]]};
		case "Land_i_House_Big_01_V3_F":		{[[1.25,1,-2.6,0],[1.25,-2.5,0.8,180],[-4.2,-1.5,0.8,90],[-4.2,2,-2.6,90]]};
		case "Land_i_Stone_HouseSmall_V1_F":	{[[0.35,0.2,-0.6,-90],[1.3,0.2,-0.6,90]]};
		case "Land_i_Stone_HouseSmall_V2_F":	{[[0.35,0.2,-0.6,-90],[1.3,0.2,-0.6,90]]};
		case "Land_i_Stone_HouseSmall_V3_F":	{[[0.35,0.2,-0.6,-90],[1.3,0.2,-0.6,90]]};
		case "Land_i_Shed_Ind_F": 				{[[4,1.6,-1.5,0]]};
		case "Land_Slum_House02_F":				{[[1.5,3.6,-0.75,0]]};
		case "Land_i_House_Small_01_V1_F":		{[[-4.1,0.5,-0.8,90],[-4.1,-3,-0.8,90]]};
		case "Land_i_House_Small_01_V2_F":		{[[-4.1,0.5,-0.8,90],[-4.1,-3,-0.8,90]]};
		case "Land_i_House_Small_01_V3_F":		{[[-4.1,0.5,-0.8,90],[-4.1,-3,-0.8,90]]};
		case "Land_i_House_Small_02_V1_F":		{[[0.5,-1,-0.7,-90],[7.3,0,-0.65,-90]]};
		case "Land_i_House_Small_02_V2_F":		{[[0.5,-1,-0.7,-90],[7.3,0,-0.65,-90]]};
		case "Land_i_House_Small_02_V3_F":		{[[0.5,-1,-0.7,-90],[7.3,0,-0.65,-90]]};
		case "Land_i_House_Small_03_V1_F":		{[[-5.2,3,-0.3,90],[-5.2,-1,0,90],[2.4,-4,-0.3,90]]};
		default {[[0,0,0,0]]};
	};

	{
		_pos = _building modelToWorld [(_x select 0), (_x select 1), (_x select 2)];
		_dir = (_x select 3);
		_pos pushback _Dir;
		_arr pushback _pos;
	}forEach _restricted;
	_arr;