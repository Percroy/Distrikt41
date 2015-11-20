//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_Verarbeiter.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Nötig fürs Item verarbeiten?
//::::::::::::  ::::::::::::\\

private["_ItemInput","_ItemInput2","_ItemOutput","_Mod","_Mod2","_ProcTimer","_ItemOutputCount","_Pos","_action","_CargoBP","_CargoVes","_CargoUni","_MagCount","_MagCount2"];

_ItemInput = param[0,"",[""]];
_ItemInput2 = param[1,"",[""]];
_ItemOutput = param[2,"",[""]];
_Mod = param[3,0,[0]];
_Mod2 = param[4,0,[0]];
_ProcTimer = param[5,0,[0]];
_ItemOutputCount = param[6,0,[0]];;
_Pos = position player;

_D41_CounterInput = 0;
_D41_CounterInput2 = 0;
_D41_CounterOutput = 0;
_D41_MultiProc = false;
if(_ItemInput2 != "") then {_D41_MultiProc = true};

if(({_x == _ItemInput} count magazines player) < _Mod) exitWith {hint format [localize "STR_D41_Process_Not_enough",([_ItemInput] call life_fnc_D41_GetMagName)];};
if(({_x == _ItemInput2} count magazines player) < _Mod2) exitWith {hint format [localize "STR_D41_Process_Not_enough",([_ItemInput2] call life_fnc_D41_GetMagName)];};

_action = [
format[localize "STR_D41_process_all"],localize "STR_D41_Process",localize "STR_D41_All",localize "STR_D41_Single"
] call BIS_fnc_guiMessage;

D41_WandeltUm = true;

if(_ItemInput in (magazines player)) then
	{
		//if(!(player canAddItem _ItemOutput)) exitWith {hint localize "STR_NOTF_InvFull";};
		if(_action) then
		{
			while{true}do
			{
								if((player distance _Pos) > 5) exitWith {};
				if(!alive player) exitWith {};
				_exit = false;
				
				if(!_D41_MultiProc) then
				{
					_CargoBP = getMagazineCargo backpackContainer player;
					_CargoVes = getMagazineCargo vestContainer player;
					_CargoUni = getMagazineCargo uniformContainer player;
					_MagCount = 0;
					
					//Check ItemInput1
					{
						_ArrPos = (_x select 0) find _ItemInput;
						if(_ArrPos != -1)then{_MagCount = _MagCount + (_x select 1 select _ArrPos)};
					}forEach[_CargoBP,_CargoVes,_CargoUni];
					
					//Check Amount
					if(_MagCount < _Mod)exitWith{_exit = true;};
					
					//Remove ItemInput1
					for "_i" from 1 to _Mod do
					{				
						player removeMagazine _ItemInput;
						_D41_CounterInput = _D41_CounterInput + 1;
					};
					//Give ItemOutput
					for "_i" from 1 to _ItemOutputCount do
					{
						player addMagazine _ItemOutput;
						_D41_CounterOutput = _D41_CounterOutput + 1;
					};
					// Hint msg
					hint format [localize "STR_D41_processed_2",_D41_CounterInput, ([_ItemInput] call life_fnc_D41_GetMagName)];
				}
				else
				{
					_CargoBP = getMagazineCargo backpackContainer player;
					_CargoVes = getMagazineCargo vestContainer player;
					_CargoUni = getMagazineCargo uniformContainer player;
					_MagCount = 0;
					_MagCount2 = 0;
					
					//Check ItemInput1
					{
						_ArrPos = (_x select 0) find _ItemInput;
						if(_ArrPos != -1)then{_MagCount = _MagCount + (_x select 1 select _ArrPos)};
					}forEach[_CargoBP,_CargoVes,_CargoUni];
					//Check ItemInput2
					{
						_ArrPos = (_x select 0) find _ItemInput2;
						if(_ArrPos != -1)then{_MagCount2 = _MagCount2 + (_x select 1 select _ArrPos)};
					}forEach[_CargoBP,_CargoVes,_CargoUni];
					
					//Check Amount
					if(_MagCount2 < _Mod2)exitWith	{_exit = true;};
					if(_MagCount < _Mod)exitWith	{_exit = true;};
					
					//Remove ItemInput1
					for "_i" from 1 to _Mod do				{player removeMagazine _ItemInput; _D41_CounterInput = _D41_CounterInput + 1;};
					//Remove ItemInput2
					for "_i" from 1 to _Mod2 do				{player removeMagazine _ItemInput2; _D41_CounterInput2 = _D41_CounterInput2 + 1;};
					//Give ItemOutput
					for "_i" from 1 to _ItemOutputCount do	{player addMagazine _ItemOutput; _D41_CounterOutput = _D41_CounterOutput + 1;};
					// Hint msg
					hint format [localize "STR_D41_Processed_1",_D41_CounterInput, ([_ItemInput] call life_fnc_D41_GetMagName), _D41_CounterInput2, ([_ItemInput2] call life_fnc_D41_GetMagName)];
				
				};
				if(_exit)exitWith{};
				sleep _ProcTimer;
			};
			
			D41_WandeltUm = false;
			if(_D41_MultiProc) then
				{
					hint format [localize "STR_D41_processed_3",_D41_CounterInput, ([_ItemInput] call life_fnc_D41_GetMagName), _D41_CounterInput2, ([_ItemInput2] call life_fnc_D41_GetMagName), _D41_CounterOutput, ([_ItemOutput] call life_fnc_D41_GetMagName)];
				}
				else
				{
					hint format [localize "STR_D41_processed_4",_D41_CounterInput, ([_ItemInput] call life_fnc_D41_GetMagName), _D41_CounterOutput, ([_ItemOutput] call life_fnc_D41_GetMagName)];
				};
		}
		else
		{
			if(({_x == _ItemInput} count magazines player) < _Mod) exitWith {};
			if(({_x == _ItemInput2} count magazines player) < _Mod2) exitWith {};
			for "_i" from 1 to _Mod do
			{
				player removeMagazine _ItemInput;
				_D41_CounterInput = _D41_CounterInput + 1;
			};
			
			if(_D41_MultiProc) then
			{
				for "_i" from 1 to _Mod2 do
				{
					player removeMagazine _ItemInput2;
					_D41_CounterInput2 = _D41_CounterInput2 + 1;
				};
			};
			
			for "_i" from 1 to _ItemOutputCount do
			{
				player addMagazine _ItemOutput;
				_D41_CounterOutput = _D41_CounterOutput + 1;
			};
			if(_D41_MultiProc) then
			{
				hint format [localize "STR_D41_processed_3",_D41_CounterInput, ([_ItemInput] call life_fnc_D41_GetMagName), _D41_CounterInput2, ([_ItemInput2] call life_fnc_D41_GetMagName), _D41_CounterOutput, ([_ItemOutput] call life_fnc_D41_GetMagName)];
			}
			else
			{
				hint format [localize "STR_D41_processed_4",_D41_CounterInput, ([_ItemInput] call life_fnc_D41_GetMagName), _D41_CounterOutput, ([_ItemOutput] call life_fnc_D41_GetMagName)];
			};
			D41_WandeltUm = false;
		};
	};

	//_val = getMagazineCargo backpackContainer player; hint format ["%1",_val];