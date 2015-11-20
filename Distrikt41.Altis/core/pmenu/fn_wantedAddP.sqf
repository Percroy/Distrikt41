private["_unit","_amount"];
if(playerSide != west) exitWith {hint localize "STR_D41_Crimes_No_Cop"};
if((lbCurSel 2406) == -1) exitWith {hint localize "STR_D41_NoPers"};
if((lbCurSel 2407) == -1) exitWith {hint localize "STR_D41_NoCrime"};
_unit = lbData [2406,lbCurSel 2406];
_unit = call compile format["%1",_unit];
_amount = lbData [2407,lbCurSel 2407];
if(isNil "_unit") exitWith {};
if(side _unit == west) exitWith {hint localize "STR_D41_Crimes_Cop_Error"};
if(_unit == player) exitWith {hint localize "STR_D41_Crimes_Yourself_Error";};
if(isNull _unit) exitWith {};

[[1,format[localize "STR_D41_Crimes_Add",_unit getVariable["realname",name _unit],_amount,getPlayerUID _unit]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

[[getPlayerUID _unit,_unit getVariable["realname",name _unit],_amount],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP; 