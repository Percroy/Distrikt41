/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};

disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target


if(_curTarget isKindOf "Land_Blitzer") exitWith
{

		_display = findDisplay 37400;
		_Btn1 = _display displayCtrl Btn1;
		_Btn2 = _display displayCtrl Btn2;
		_Btn3 = _display displayCtrl Btn3;
		_Btn4 = _display displayCtrl Btn4;
		_Btn5 = _display displayCtrl Btn5;
		_Btn6 = _display displayCtrl Btn6;
		_Btn7 = _display displayCtrl Btn7;
		_Btn8 = _display displayCtrl Btn8;
		life_pInact_curTarget = _curTarget;

		_Btn1 ctrlSetText "30";
		_Btn1 buttonSetAction "[1] spawn life_fnc_D41_Blitzer; _curTarget setVariable [""D41_Blitzer"", false, true]; closeDialog 0;";
		_Btn2 ctrlSetText "50";
		_Btn2 buttonSetAction "[2] spawn life_fnc_D41_Blitzer; _curTarget setVariable [""D41_Blitzer"", false, true]; closeDialog 0;";
		_Btn3 ctrlSetText "70";
		_Btn3 buttonSetAction "[3] spawn life_fnc_D41_Blitzer; _curTarget setVariable [""D41_Blitzer"", false, true]; closeDialog 0;";
		_Btn4 ctrlSetText "80";
		_Btn4 buttonSetAction "[4] spawn life_fnc_D41_Blitzer; _curTarget setVariable [""D41_Blitzer"", false, true]; closeDialog 0;";
		_Btn5 ctrlSetText "100";
		_Btn5 buttonSetAction "[5] spawn life_fnc_D41_Blitzer; _curTarget setVariable [""D41_Blitzer"", false, true]; closeDialog 0;";
		_Btn6 ctrlSetText "130";
		_Btn6 buttonSetAction "[6] spawn life_fnc_D41_Blitzer; _curTarget setVariable [""D41_Blitzer"", false, true]; closeDialog 0;";
		_Btn7 ctrlSetText localize "STR_D41_Pack_SpeedCam";
		_Btn7 buttonSetAction "[] spawn life_fnc_packupBlitzer; closeDialog 0;";
		_Btn8 ctrlShow false;
};

if(_curTarget in [zelle01,zelle02,zelle03,zelle04,CopRoenne]) exitWith
	{
		_display = findDisplay 37400;
		_Btn1 = _display displayCtrl Btn1;
		_Btn2 = _display displayCtrl Btn2;
		_Btn3 = _display displayCtrl Btn3;
		_Btn4 = _display displayCtrl Btn4;
		_Btn5 = _display displayCtrl Btn5;
		_Btn6 = _display displayCtrl Btn6;
		_Btn7 = _display displayCtrl Btn7;
		_Btn8 = _display displayCtrl Btn8;
		life_pInact_curTarget = _curTarget;
		
		_Btn1 ctrlSetText localize "STR_pInAct_Repair";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_repairDoor;";
		
		_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_doorAnimate;";
		_Btn3 ctrlSetText localize "STR_pInAct_LockHouse";
		_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_lockupHouse;";
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
	};
	
if((_curTarget in [waka01,waka02,waka03]) && ((call life_coplevel) >= 5)) exitWith
	{
		_display = findDisplay 37400;
		_Btn1 = _display displayCtrl Btn1;
		_Btn2 = _display displayCtrl Btn2;
		_Btn3 = _display displayCtrl Btn3;
		_Btn4 = _display displayCtrl Btn4;
		_Btn5 = _display displayCtrl Btn5;
		_Btn6 = _display displayCtrl Btn6;
		_Btn7 = _display displayCtrl Btn7;
		_Btn8 = _display displayCtrl Btn8;
		life_pInact_curTarget = _curTarget;
		
		
		_Btn1 ctrlSetText localize "STR_pInAct_CloseOpen";
		_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_doorAnimate;";
		_Btn2 ctrlSetText localize "STR_pInAct_LockHouse";
		_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_lockupHouse;";
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
	};
	
if(_curTarget isKindOf "House_F") exitWith
{	
	//if((nearestObject [[12407.1,14350.3,0],"Land_Offices_01_V1_F"]) == _curTarget OR (nearestObject [[12407.1,14350.3,0],"Land_Research_house_V1_F"]) == _curTarget) then {
	if(_curTarget == fed_bank_building) then
	{
		_display = findDisplay 37400;
		_Btn1 = _display displayCtrl Btn1;
		_Btn2 = _display displayCtrl Btn2;
		_Btn3 = _display displayCtrl Btn3;
		_Btn4 = _display displayCtrl Btn4;
		_Btn5 = _display displayCtrl Btn5;
		_Btn6 = _display displayCtrl Btn6;
		_Btn7 = _display displayCtrl Btn7;
		_Btn8 = _display displayCtrl Btn8;
		life_pInact_curTarget = _curTarget;
		
		_Btn1 ctrlSetText localize "STR_pInAct_Repair";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_repairDoor;";
		
		_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_doorAnimate;";
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
	} else {
		closeDialog 0;
	};
};
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
		