/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_curTarget","_amount","_life_maskiert"];
//_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_curTarget = _this select 0;
_Type = TypeOf _curTarget;
life_pInact_curTarget = _curTarget;
_amount = ctrlText 2018;

if((isNull _curTarget)) exitWith {hint localize "STR_D41_NoOne";};
if(!(_Type isKindOf "Man")) exitWith {hint localize "STR_D41_NoPers";};
if(!(isPlayer _curTarget)) exitWith {hint localize "STR_D41_NoPlayer";};
if(!(alive _curTarget)) exitWith {hint localize "STR_D41_DeadPlayer";};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint localize "STR_D41_GiveMoney_Robbed";};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum";};
if(parseNumber(_amount) <= 0) exitWith {hint localize "STR_D41_Number_Zero";};
if(parseNumber(_amount) > D41_Geld) exitWith {hint localize "STR_ATM_NotEnoughCash";};
if(player distance _curTarget > 5) exitWith {hint localize "STR_D41_Range";};

_name = life_pInact_curTarget getVariable["realname",name life_pInact_curTarget];
_life_maskiert = false;
if ((goggles life_pInact_curTarget) in D41_goggles_Array) then {_life_maskiert = true};
if ((uniform life_pInact_curTarget) in D41_uniform_Array) then {_life_maskiert = true};
if ((headgear life_pInact_curTarget) in D41_headgear_Array) then {_life_maskiert = true};
if ((hmd life_pInact_curTarget) in D41_hmd_Array) then {_life_maskiert = true};
if(_life_maskiert)then{_name = localize "STR_D41_MaskiertePerson";};
hint format[localize "STR_D41_GiveMoney",[(parseNumber(_amount))] call life_fnc_numberText, _name];

D41_Geld = D41_Geld - (parseNumber(_amount));
[6] call SOCK_FNC_updatePartial;
[[_curTarget,_amount,player],"life_fnc_receiveMoney",_curTarget,false] call life_fnc_MP;