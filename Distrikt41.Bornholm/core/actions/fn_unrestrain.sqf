/*
	File: fn_unrestrain.sqf
*/
private["_unit","_groupName","_title","_ui","_progressBar","_titleText","_cP","_cpRate","_D41_HC_Chance2"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

if((player getVariable["restrained",TRUE])) exitWith {hint localize "STR_D41_UnrestrainNope"};

if(side player == civilian && !("D41_Dietrich" in (magazines Player))) exitWith {hint localize "STR_D41_UnrestrainKeinDietrich";};

if (side player == civilian) then
	{
		life_action_inUse = true;
		
		[-10,0] call life_fnc_D41_KSys;
		
		//Setup the progress bar
		disableSerialization;
		_title = localize "STR_D41_UnrestrainGuiText";
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
		_titleText ctrlSetText format["%2 (1%1)...","%",_title];
		_progressBar progressSetPosition 0.01;
		_cP = 0.01;
		_cpRate = 0.02;
		[] spawn life_fnc_D41_AnimLoop;

		while {true} do
		{
			uisleep 0.6;
			if(isNull _ui) then {
				5 cutRsc ["life_progress","PLAIN"];
				_ui = uiNamespace getVariable "life_progress";
			};
			_cP = _cP + _cpRate;
			_progressBar progressSetPosition _cP;
			_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
			if(_cP >= 1 OR !alive player) exitWith {};
			if(life_interrupted) exitWith {};
		};

		//Kill the UI display and check for various states
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(!alive player) exitWith {life_action_inUse = false;};
		if(life_interrupted) exitWith {};
		life_action_inUse = false;
		player removeMagazine "D41_Dietrich";
	};

if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

D41_HC_Chance = FALSE;
if (side player == civilian) then
	{
		D41_HC_Chance = TRUE;
		D41_HC_Chance2 = random(100);
		if(D41_HC_Chance2 > 50) exitWith {D41_HC_Chance = FALSE;};
	};

if(D41_HC_Chance) exitWith {hint localize "STR_ISTR_Lock_Failed";};

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;
//player say3D "Sounds\cuff.ogg";
//playSound3D ["D41_S\Sounds\AlifeSounds\cuff.ogg", _unit, false, getPosASL _unit, 1, 1, 5];

_life_maskiert = false;
if ((goggles player) in D41_goggles_Array) then {_life_maskiert = true};
if ((uniform player) in D41_uniform_Array) then {_life_maskiert = true};
if ((headgear player) in D41_headgear_Array) then {_life_maskiert = true};
if ((hmd player) in D41_hmd_Array) then {_life_maskiert = true};

if (_life_maskiert) then	{ [[0,format[localize "STR_D41_UnrestrainEntfesselt",_unit getVariable["realname", name _unit], localize "STR_D41_Masked"]],"life_fnc_broadcast",_unit,false] call life_fnc_MP; [-25,0] call life_fnc_D41_KSys; }
else						{ [[0,format[localize "STR_D41_UnrestrainEntfesselt",_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",_unit,FALSE] call life_fnc_MP; [-25,0] call life_fnc_D41_KSys; };






