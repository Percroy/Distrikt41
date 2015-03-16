//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_KillMalus.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Zieht Skillpunkte bei Spielern ab, die jemanden erschossen haben.
//::::::::::::  ::::::::::::\\
private["_rndm","_amount","_type","_remove","_Msg","_Display"];

	if(playerSide != civilian) exitWith {};
	
	if(life_D41_Karma >= -3000) exitWith {systemchat format ["NOCH hast Du genügend Karma übrig, bis zusätzlich Skillpunkte abgezogen werden: %1 Punkte übrig",(life_D41_Karma + 2999)];};
	
	D41_Counter = D41_Counter + 1;
	if(D41_Counter >= 100) exitWith {systemchat "Du hast nirgendwo genügend Skillpunkte gehabt! Glück(?) gehabt!"};
	
	_Msg = {systemchat format ["Für das töten eines Spielers hast Du %1 Punkte beim Skill %2 verloren!", _amount, _Display]};
	_remove = {[[getPlayerUID player, _type, _amount],"D41_fnc_removeSkillSys",false,false] call life_fnc_MP; D41_Counter = 0; call _Msg};
	_rndm = round(random 10);
	if (_rndm == 0) then	{if(life_skillKrabben < 199) exitWith {call life_fnc_D41_KillMalus};	_type = "D41_Krabben";		_Display = "Krabben";	_amount = "100";	life_skillKrabben = life_skillKrabben - 100;		call _remove;};
	if (_rndm == 1) then	{if(life_skillBruchstein < 199) exitWith {call life_fnc_D41_KillMalus};	_type = "D41_Bruchstein";	_Display = "Bruchstein";_amount = "100";	life_skillBruchstein = life_skillBruchstein - 100;	call _remove;};
	if (_rndm == 2) then	{if(life_skillTon < 199) exitWith {call life_fnc_D41_KillMalus};		_type = "D41_Tonerde";		_Display = "Tonerde";	_amount = "100";	life_skillTon = life_skillTon - 100;				call _remove;};
	if (_rndm == 3) then	{if(life_skillcoalu < 199) exitWith {call life_fnc_D41_KillMalus};		_type = "D41_KohleRoh";		_Display = "Kohle";		_amount = "100";	life_skillcoalu = life_skillcoalu - 100;			call _remove;};
	if (_rndm == 4) then	{if(life_skillDiamond < 199) exitWith {call life_fnc_D41_KillMalus};	_type = "D41_DiamantenRoh";	_Display = "Diamanten";	_amount = "50";		life_skillDiamond = life_skillDiamond - 50;			call _remove;};
	if (_rndm == 5) then	{if(life_skillCopperore < 199) exitWith {call life_fnc_D41_KillMalus};	_type = "D41_KupferRoh";	_Display = "Kupfer";	_amount = "100";	life_skillCopperore = life_skillCopperore - 100;	call _remove;};
	if (_rndm == 6) then	{if(life_skillIronore < 199) exitWith {call life_fnc_D41_KillMalus};	_type = "D41_EisenRoh";		_Display = "Eisen";		_amount = "100";	life_skillIronore = life_skillIronore - 100;		call _remove;};
	if (_rndm == 7) then	{if(life_skillSalt < 199) exitWith {call life_fnc_D41_KillMalus};		_type = "D41_Salz";			_Display = "Salz";		_amount = "100";	life_skillSalt = life_skillSalt - 100;				call _remove;};
	if (_rndm == 8) then	{if(life_skillSand < 199) exitWith {call life_fnc_D41_KillMalus};		_type = "D41_Sand";			_Display = "Sand";		_amount = "100";	life_skillSand = life_skillSand - 100;				call _remove;};
	if (_rndm == 9) then	{if(life_skillOilu < 199) exitWith {call life_fnc_D41_KillMalus};		_type = "D41_OelRoh";		_Display = "Öl";		_amount = "100";	life_skillOilu = life_skillOilu - 100;				call _remove;};
	if (_rndm == 10) then	{if(life_skillFischen < 199) exitWith {call life_fnc_D41_KillMalus};	_type = "D41_Fischen";		_Display = "Fischen";	_amount = "100";	life_skillFischen = life_skillFischen - 100;		call _remove;};