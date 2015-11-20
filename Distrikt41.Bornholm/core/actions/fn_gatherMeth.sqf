//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_gatherMeth.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Wandelt Meth um?
//::::::::::::  ::::::::::::\\
private["_CantDo","_sum","_LvL","_rndm","_count","_time","_Lcap","_type","_skill","_skillNeeded","_skillAdd","_hType","_GatherText","_GatheredText","_fnc_gather","_Karma"];
if(playerSide != civilian)exitWith{};	
_GangKarma = (group player) getVariable "gang_Karma";
_MinKarma = -8000;
_CantDo = false;
if(!isNil "_GangKarma")then{_GangKarma = call compile format["%1", _GangKarma];};
if(isNil "_GangKarma")then{if(life_D41_Karma > _MinKarma)then{_CantDo = true;};}else{if(_GangKarma > _MinKarma)then{_CantDo = true;};};
if(_CantDo)exitWith{hint format[localize "STR_D41_NichtGenugKarma",_MinKarma];};
if(life_action_gather)exitWith{hint localize "STR_D41_doing_something"};
if( (({_x == "D41_Meth3"} count magazines player) < 2) OR !("D41_Meth4" in (magazines player)) )exitWith{hint localize "STR_D41_Meth_ZeugFehlt"};

_vehicle = vehicle player;
if(typeOf(_vehicle) != "D41_gaz66_r142_msv")exitWith{hint localize "STR_D41_Meth_KeineKueche"};
if((speed _vehicle) > 1)exitWith{hint localize "STR_D41_Meth_AmFahren"};
if(count(crew _vehicle) < 2)exitWith{hint localize "STR_D41_Meth_KeinTeam"};
if(!(isEngineOn _vehicle))exitWith{hint localize "STR_D41_Meth_MotorAus"};
_exit = false;
{
	if(_exit)exitWith{};
	_Dist = ((getPos player) distance (getMarkerPos _x));
	if(_Dist < 2500)exitWith{_exit = true};
}forEach [	"Safezone_01","Safezone_02","Safezone_03","Safezone_04","Safezone_05",
			"Safezone_06","Safezone_07","Safezone_08","Safezone_09","Safezone_10",
			"Safezone_11","Safezone_12","Safezone_13","Safezone_14","Safezone_15",
			"Safezone_16","Safezone_17","Safezone_18","Safezone_19"];
if(_exit)exitWith{hint "Dumm?\nWillste dich von der Pol erwischen lassen?\nSieh zu das Du genügend Abstand zu einer Safezone hast!\n\n(2.5Km Abstand)"};

_type = "D41_Meth";
_skill = life_skillMeth;
_skillNeeded = {};
_skillAdd = {life_skillMeth = life_skillMeth + 1};
_hType = localize "STR_Item_Meth";
_Werkzeug = "";
_CheckWerkzeug = (_Werkzeug in (assignedItems player));
_GatherText = {titleText[format[localize "STR_D41_Produzieren",_hType],"PLAIN"];};
_GatheredText = {titleText[format[localize "STR_D41_Produziert",_rndm, _hType],"PLAIN"];};
_fnc_gather = 
{
	player removeMagazine "D41_Meth3";
	player removeMagazine "D41_Meth3";
	player removeMagazine "D41_Meth4";
	if(player canAdd _type) then
	{
		life_action_gather = true;
		
		_Counter = (1 / _time);
		_Timer = 0;
		_Abort = true;
		
		
		
		_StartZeit = serverTime;
		["MethTimer", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		[
			"MethTimer",
			"onEachFrame",
			{
				private["_StartZeit","_Mod"];
				_StartZeit = _this select 0;
				_Mod = _this select 1;
				
				_Prozent = ((round((_StartZeit + _Mod) - serverTime)/_Mod)*100);
				_ProzentAnzeige = format [localize "STR_D41_Meth_ProcAnzeige",_Prozent,"%"];
				if(_Prozent >= serverTime)exitWith{};
				drawIcon3D ["\A3\ui_f\data\igui\cfg\actions\take_ca.paa", [1,1,1,0.5], player modelToWorld [0, 0, 1], 1, 1, 0, _ProzentAnzeige, 1, 0.04, "TahomaB"];
			},
			[_StartZeit, _time]
		] call BIS_fnc_addStackedEventHandler;
		
		while{true}do
		{
			_vehicle = vehicle player;
			if(!(player canAdd _type))exitWith{};
			if(typeOf(_vehicle) != "D41_gaz66_r142_msv")exitWith{hint localize "STR_D41_Meth_KeineKueche"};
			if((speed _vehicle) > 1)exitWith{hint localize "STR_D41_Meth_AmFahren"};
			if(count(crew _vehicle) < 2)exitWith{hint localize "STR_D41_Meth_KeinTeam"};
			if(!(isEngineOn _vehicle))exitWith{hint localize "STR_D41_Meth_MotorAus"};
			
			_Timer = _Timer + _Counter;
			sleep 1;
			if(_Timer >= 1)exitWith{_Abort = false;};
			
		};
		
		["MethTimer", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
				
		
		if(_abort)exitWith{hint localize "STR_NOTF_ActionCancel"; systemchat localize "STR_NOTF_ActionCancel";};
		if(!(player canAdd _type))exitWith{};
		if(typeOf(_vehicle) != "D41_gaz66_r142_msv")exitWith{hint localize "STR_D41_Meth_KeineKueche"};
		if((speed _vehicle) > 1)exitWith{hint localize "STR_D41_Meth_AmFahren"};
		if(count(crew _vehicle) < 2)exitWith{hint localize "STR_D41_Meth_KeinTeam"};
		if(!(isEngineOn _vehicle))exitWith{hint localize "STR_D41_Meth_MotorAus"};
		
		if(alive player)then
		{
			call _skillAdd;
			call _GatheredText;
			for "_i" from 1 to _rndm do
			{
				player addMagazine _type;
			};
			[_Karma,0] call life_fnc_D41_KSys;
		};
	}
	else
	{
		hint localize "STR_NOTF_InvFull";
	};
};
_Farbe = "ff0000";


switch(true) do
{
	//Level 6
	case (_skill > 1249):					{_Karma = -3;	_LvL = 6; _rndm = [1,2] call BIS_fnc_selectRandom;	_count = "1-2"; _time = 33;	_Lcap = "MAX";	call _fnc_gather; [ format [localize "STR_D41_SkillstufeMaxLvLErreicht",_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 1249): 					{_Karma = -3;	_LvL = 6; _rndm = [1,2] call BIS_fnc_selectRandom;	_count = "1-2"; _time = 33;	_Lcap = "MAX";	call _fnc_gather; [ format [localize "STR_D41_SkillstufeLvLUpMax",		_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	//Level 5
	case (_skill > 849 && _skill < 1249):	{_Karma = -2;	_LvL = 5; _rndm = [1,2] call BIS_fnc_selectRandom;	_count = "1-2"; _time = 38;	_Lcap = 1250;	call _fnc_gather; [ format [localize "STR_D41_Skillstufe",				_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 849):					{_Karma = -2;	_LvL = 5; _rndm = [1,2] call BIS_fnc_selectRandom;	_count = "1-2"; _time = 38;	_Lcap = 1250;	call _fnc_gather; [ format [localize "STR_D41_SkillstufeLvLUp",			_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	//Level 4
	case (_skill > 499 && _skill < 849):	{_Karma = -2;	_LvL = 4; _rndm = 1;								_count = "1"; _time = 38;	_Lcap = 850;	call _fnc_gather; [ format [localize "STR_D41_Skillstufe",				_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 499):					{_Karma = -2;	_LvL = 4; _rndm = 1;								_count = "1"; _time = 38;	_Lcap = 850;	call _fnc_gather; [ format [localize "STR_D41_SkillstufeLvLUp",			_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	//Level 3
	case (_skill > 249 && _skill < 499):	{_Karma = -1;	_LvL = 3; _rndm = 1;								_count = "1"; _time = 43;	_Lcap = 500;	call _fnc_gather; [ format [localize "STR_D41_Skillstufe",				_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 249):					{_Karma = -1;	_LvL = 3; _rndm = 1;								_count = "1"; _time = 43;	_Lcap = 500;	call _fnc_gather; [ format [localize "STR_D41_SkillstufeLvLUp",			_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	//Level 2
	case (_skill > 49 && _skill < 249):		{_Karma = -1;	_LvL = 2; _rndm = 1;								_count = "1"; _time = 47;	_Lcap = 250;	call _fnc_gather; [ format [localize "STR_D41_Skillstufe",				_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	case (_skill == 49):					{_Karma = -1;	_LvL = 2; _rndm = 1;								_count = "1"; _time = 47;	_Lcap = 250;	call _fnc_gather; [ format [localize "STR_D41_SkillstufeLvLUp",			_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	//Level 1
	case (_skill < 49):						{_Karma = -1;	_LvL = 1; _rndm = 1;								_count = "1"; _time = 50;	_Lcap = 50;		call _fnc_gather; [ format [localize "STR_D41_Skillstufe",				_LvL, _count, _time, _skill+1, _Lcap, _Farbe], SzoneXW, SzoneYH, 5, 0.25 ] spawn BIS_fnc_dynamicText;};
	default {hint localize "STR_D41_KeineGartenschere";};
};

life_action_gather = false;