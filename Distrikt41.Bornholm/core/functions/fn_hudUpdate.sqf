/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health","_Geld"];
disableSerialization;
	
	_ui = (findDisplay 602);
	if(isNull _ui)exitWith{};
	
	_food = _ui displayCtrl 1930;
	_water = _ui displayCtrl 1932;
	_health = _ui displayCtrl 1936;
	
	_Hunger = if(life_hunger >= 100)then{0.3555}else{((life_hunger / 100)*0.3555);};
	_food ctrlSetPosition  [0.3425,-0.005,_Hunger,0.04];
	_food ctrlCommit 0;

	_Durst = if(life_thirst >= 100)then{0.3555}else{((life_thirst / 100)*0.3555);};
	_water ctrlSetPosition  [0.708,-0.005,_Durst,0.04];
	_water ctrlCommit 0;

	_HealthBar = if(damage player == 0)then{0}else{(0.9 * damage player)};
	_health ctrlSetPosition [1.08,0.049,0.04,_HealthBar];
	_health ctrlCommit 0;