/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > D41_atmGeld) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && D41_atmGeld > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

D41_Geld = D41_Geld + _val;
D41_atmGeld = D41_atmGeld - _val;
hint format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
closeDialog 0;
[] call life_fnc_atmMenu;
[] call life_fnc_hudUpdate;