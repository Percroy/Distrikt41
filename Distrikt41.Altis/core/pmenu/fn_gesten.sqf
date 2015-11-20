#include <macro.h>
/*
	File: fn_gesten.sqf
	Author: Distrikt41 - Avka
	
	Description:
	Sloth Gestures. Slowly but steady.
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
	

//Set Advance Button
_Btn0 ctrlSetText localize "STR_PM_Advance";
_Btn0 buttonSetAction "closeDialog 0; player playActionNow 'gestureAdvance';";

//Set Go  Button
_Btn1 ctrlSetText localize "STR_PM_Go";
_Btn1 buttonSetAction "closeDialog 0; player playActionNow (['gestureGo', 'gestureGoB'] select (floor random 2));";

//Set Follow Button
_Btn2 ctrlSetText localize "STR_PM_Follow";
_Btn2 buttonSetAction "closeDialog 0; player playActionNow 'gestureFollow';";

//Set Up Button
_Btn3 ctrlSetText localize "STR_PM_Up";
_Btn3 buttonSetAction "closeDialog 0; player playActionNow 'gestureUp';";

//Set Close Button
_Btn8 ctrlSetText localize "STR_Global_Close";
_Btn8 buttonSetAction "closeDialog 0;";

//Set Cover Button
_Btn4 ctrlSetText localize "STR_PM_Cover";
_Btn4 buttonSetAction "closeDialog 0; player playActionNow 'gestureCover';";

//Set CeaseFire Button
_Btn5 ctrlSetText localize "STR_PM_CeaseFire";
_Btn5 buttonSetAction "closeDialog 0; player playActionNow 'gestureCeaseFire';";

//Set Freeze Button
_Btn6 ctrlSetText localize "STR_PM_Freeze";
_Btn6 buttonSetAction "closeDialog 0; player playActionNow 'gestureFreeze';";

//Set Yes Button
_Btn7 ctrlSetText localize "STR_PM_Yes";
_Btn7 buttonSetAction "closeDialog 0; player playActionNow (['gestureYes', 'gestureNod'] select (floor random 2));";

//Set No Button
_Btn9 ctrlSetText localize "STR_PM_No";
_Btn9 buttonSetAction "closeDialog 0; player playActionNow 'gestureNo';";

//Set Hi Button
_Btn10 ctrlSetText localize "STR_PM_Hi";
_Btn10 buttonSetAction "closeDialog 0; player playActionNow (['gestureHi', 'gestureHiB', 'gestureHiC'] select (floor random 3));";






