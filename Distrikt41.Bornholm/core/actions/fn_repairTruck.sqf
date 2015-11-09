/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	rewrote by Distrikt41 Dscha
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_vehicle","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_vehicle = life_pInact_curTarget;
_part = _this select 0;

life_interrupted = false;

if(isNull _vehicle) exitwith {};
if((_vehicle isKindOf "Car") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "Air")) then
{
	if("D41_ToolKit" in (magazines player)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.001;
		_cPMod = 0.03;
		if((side player) in [independent])then{_cPMod = 0.008};
		[] spawn life_fnc_D41_AnimLoop;
		
		while{true} do
		{
			
			sleep 0.27;
			_cP = _cP + _cPMod;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(vehicle player != player) exitWith {};
			if(life_interrupted) exitWith {};
			if(!("D41_ToolKit" in (magazines player))) exitWith {hint localize "STR_D41_BetrugsVersuch";};
		};
		
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted OR (!alive player)) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};
		if(vehicle player != player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
		if(!("D41_ToolKit" in (magazines player))) exitWith {hint localize "STR_D41_BetrugsVersuch";};
		D41_ToolKitUsed = D41_ToolKitUsed + 1;
		if((side player) in [independent, west])then{D41_ToolKitUsed = 0};
		if(D41_ToolKitUsed > 5)then{player removeMagazine "D41_ToolKit"; D41_ToolKitUsed = 0;};
		//life_skillReperatur
		_percent = 0;
		_Postdmg = 0;
		
		if((side player) in [independent])exitWith{_vehicle setDammage 0; titleText [format[localize "STR_NOTF_RepairedVehicle",100, 0, "%"],"PLAIN"];};
		if(_part == "Scheiben")then
		{
			[_vehicle] call life_fnc_D41_RepScheiben;
			life_skillReperatur = life_skillReperatur + 1;
			uisleep 0.1;
			titleText [format[localize "STR_NOTF_RepairedVehicle", 100, 0, "%"],"PLAIN"];
		}
		else
		{
			_PreDmg = 0;
			if(!(_vehicle isKindOf "Ship") OR !(_vehicle isKindOf "Air"))then{_PreDmg = _vehicle getHitPointDamage _part;};
			switch(true)do
			{
				case(life_skillReperatur <= 99):									{_Postdmg = _PreDmg - 0.2; _percent = 20;};
				case(life_skillReperatur < 250 && life_skillReperatur >= 100):		{_Postdmg = _PreDmg - 0.25; _percent = 25;};
				case(life_skillReperatur < 500 && life_skillReperatur >= 250):		{_Postdmg = _PreDmg - 0.35; _percent = 35;};
				case(life_skillReperatur < 1000 && life_skillReperatur >= 500):		{_Postdmg = _PreDmg - 0.5; _percent = 50;};
				case(life_skillReperatur < 2500 && life_skillReperatur >= 1000):	{_Postdmg = _PreDmg - 0.7; _percent = 70;};
				case(life_skillReperatur < 4000 && life_skillReperatur >= 2500):	{_Postdmg = _PreDmg - 0.8; _percent = 80;};
				case(life_skillReperatur >= 4000):									{_Postdmg = _PreDmg - 0.9; _percent = 90;};
			};
			if(_Postdmg < 0)then{_Postdmg = 0};
			life_skillReperatur = life_skillReperatur + 1;
			_exit = false;
			switch(true)do
			{
				case(!local _vehicle && isNull (driver _vehicle)):	{[[player, _vehicle, "1"],"D41_fnc_setOwner",false,false] call life_fnc_MP;};
				case(!local _vehicle && !isNull (driver _vehicle)):	{_exit = true; [[_part, _Postdmg],"D41_fnc_RepPart",(driver _vehicle),false] call life_fnc_MP;};
				case(isNull _vehicle):								{_exit = true; hint localize "STR_D41_KeinFahrzeug"; systemchat localize "STR_D41_KeinFahrzeug"};
				case((getDammage _vehicle) == 1):					{_exit = true; hint localize "STR_D41_FahrzeugIstZerstoert"; systemchat localize "STR_D41_FahrzeugIstZerstoert"};
				default{};
			};
			if(_exit)exitWith{};
			_timer = time;
			waituntil{sleep 0.2; ((local _vehicle) OR ((time - _timer) > 5))};
			if((time - _timer) > 5)exitWith{hint localize "STR_D41_Fehler"; systemchat localize "STR_D41_Fehler"; life_skillReperatur = life_skillReperatur - 1; D41_ToolKitUsed = D41_ToolKitUsed - 1;};
			if((_vehicle isKindOf "Ship") OR (_vehicle isKindOf "Air"))then{_vehicle setDammage 0; if(!((side player) in [independent, west]))then{player removeMagazine "D41_ToolKit";};}else{_vehicle setHitPointDamage [_part,_Postdmg];};
			uisleep 0.1;
			titleText [format[localize "STR_NOTF_RepairedVehicle",_percent,round((_vehicle getHitPointDamage _part)*100), "%"],"PLAIN"];
		};
	};
};