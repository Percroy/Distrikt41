/*
	File: fn_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
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


private["_display","_curTarget","_Type","_Btn0","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];

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
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_Type = TypeOf _curTarget;

if ((!isNull _curTarget) && (_Type isKindOf "Man") && (isPlayer _curTarget) && (alive _curTarget) && (_curTarget distance player < 5) && (speed _curTarget < 1)) then 
{
	life_pInact_curTarget = _curTarget;


//Set Wanted Button
_Btn0 ctrlSetText localize "STR_Wanted_Title";
_Btn0 buttonSetAction "closeDialog 0; [] call life_fnc_wantedMenu;";

//Set Lizenz Button
_Btn1 ctrlSetText localize "STR_pInAct_checkLicenses";
_Btn1 buttonSetAction "closeDialog 0; [[player],'life_fnc_licenseCheck',life_pInact_curTarget,FALSE] spawn life_fnc_MP;";

//Set Search Button
_Btn2 ctrlSetText localize "STR_pInAct_SearchPlayer";
_Btn2 buttonSetAction "closeDialog 0; [life_pInact_curTarget,0] spawn life_fnc_searchAction;";

//Set Alk Button
_Btn3 ctrlSetText localize "STR_pIntAct_SearchAlk";
_Btn3 buttonSetAction "closeDialog 0; [life_pInact_curTarget,1] spawn life_fnc_searchAction;";

//Set Close Button
_Btn8 ctrlSetText localize "STR_Global_Close";
_Btn8 buttonSetAction "closeDialog 0;";

//Set Drugs Button
_Btn4 ctrlSetText localize "STR_pIntAct_SearchDrug";
_Btn4 buttonSetAction "closeDialog 0; [life_pInact_curTarget,2] spawn life_fnc_searchAction;";

//Set Ticket Button
_Btn5 ctrlSetText localize "STR_pInAct_TicketBtn";
_Btn5 buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_ticketAction;";

//Set Arrest Button
_Btn7 ctrlSetText localize "STR_pInAct_Arrest";
_Btn7 buttonSetAction "closeDialog 0; [] call life_fnc_showArrestDialog;";

//Set Lizenz Remove
_Btn9 ctrlSetText localize "STR_pInAct_RevokeLicense";
_Btn9 buttonSetAction "closeDialog 0;[life_pInact_curTarget] call life_fnc_revokeLicense;";


_Btn6 ctrlEnable false;
};












