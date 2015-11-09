#include <macro.h>
/*
	File: fn_animation.sqf
	Author: Distrikt41 - Avka
	
	Description:
	Sloth Animations. Slowly but steady.
*/
#define Btn0 1600
#define Btn1 1601
#define Btn2 1602
#define Btn3 1603
#define Btn4 1604
#define Btn5 1605
#define Btn6 1606
#define Btn7 1607
#define Btn8 1608
#define Btn9 1609
#define Btn10 1610


private["_display","_Btn0","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];

createDialog "CombatRose";

disableSerialization;
_display = findDisplay 1713999;
_Btn0 = _display displayCtrl Btn0;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;

if((player getVariable "Escorting") OR (player getVariable "restrained") OR (player getVariable "surrender") OR (player getVariable "D41_geknueppelt")) exitWith {closeDialog 0;};
	

//Set Kneebend Slow Button
_Btn0 ctrlSetText localize "STR_PM_Kneebend_Slow";
_Btn0 buttonSetAction "closeDialog 0; player playMove 'AmovPercMstpSnonWnonDnon_exercisekneeBendA';";

//Set Kneebend Fast Button
_Btn1 ctrlSetText localize "STR_PM_Kneebend_Fast";
_Btn1 buttonSetAction "closeDialog 0; player playMove 'AmovPercMstpSnonWnonDnon_exercisekneeBendB';";

//Set Pushups Button
_Btn2 ctrlSetText localize "STR_PM_Pushup";
_Btn2 buttonSetAction "closeDialog 0; player playMove 'AmovPercMstpSnonWnonDnon_exercisePushup';";

//Set Warning Shot Button
_Btn3 ctrlSetText localize "STR_PM_Warning_Shot";
_Btn3 buttonSetAction "closeDialog 0; player playMove 'Acts_starterPistol_fire';";

//Set Close Button
_Btn8 ctrlSetText localize "STR_Global_Close";
_Btn8 buttonSetAction "closeDialog 0;";

_Btn4 ctrlEnable false;
_Btn5 ctrlEnable false;
_Btn6 ctrlEnable false;
_Btn7 ctrlEnable false;
_Btn9 ctrlEnable false;
_Btn10 ctrlEnable false;








