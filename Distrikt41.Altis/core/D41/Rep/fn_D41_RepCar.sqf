//::::::::::::  ::::::::::::\\
//	Filename: D41/Rep/fn_D41_RepCar.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Neue Reperatur-GUI, mit einzeln zu reparierenden Teilen
//::::::::::::  ::::::::::::\\

private["_Veh","_CntWheels","_GetCfgProp","_HitPoints","_DmgList","_Dmg","_D41_RepScheiben","_Scheiben","_display","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_Btn12","_GlassList","_isKamaz"];
_Veh = cursorTarget;

if(isNull _Veh)exitWith{hint format [localize "STR_D41_Repair_Putt", _Veh];};
if(!(_Veh isKindOf "Car"))exitWith{hint localize "STR_D41_Repair_View"};
if(!("D41_ToolKit" in (magazines player))) exitWith {hint localize "STR_D41_KeinRepKit";};

life_pInact_curTarget = _Veh;

//Fahrzeug
#define Btn1 3341
#define Btn2 3343
#define Btn3 3344
#define Btn4 3342
#define Btn5 3346
#define Btn6 3345 
#define Btn7 3347
#define Btn20 3349
#define Btn21 3351
//LKW
#define Btn8 6678
#define Btn9 6680
#define Btn10 6681
#define Btn11 6679
#define Btn12 6685
#define Btn13 6682
#define Btn14 6686
#define Btn15 6684
#define Btn16 6687
#define Btn17 6683
#define Btn18 6688
#define Btn19 6690
#define Btn22 6692

_CntWheels = [];
_GetCfgProp = configProperties [configFile >> "CfgVehicles" >> (typeOf _Veh) >> "Wheels", "_CntWheels pushBack configName _x; true", true];
if(count(_CntWheels) == 4 && !dialog)then{if(!dialog) then {createDialog "d41_car_status";};};
if(count(_CntWheels) > 4 && !dialog)then{createDialog "d41_Lkw_Status";};

disableSerialization;
_HitPoints = [];
_DmgList = [];
_cnt = 0;
_cntDmg = 0;
_GlassList =	["HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitGlass5","HitGlass6","HitGlass7","HitGlass8","HitGlass9","HitGlass10","HitRGlass","HitLGlass"];

_GetCfgProp = configProperties [configFile >> "CfgVehicles" >> (typeOf _Veh) >> "HitPoints", "_HitPoints pushBack configName _x; true", true];
{
	_Dmg = _Veh getHitPointDamage _x;
	_cnt = _cnt + 1;
	_cntDmg = _cntDmg + _Dmg;
	if(_Dmg > 0)then
		{
			_DmgList pushback _x
		};
}forEach _HitPoints;

_DmgVeh = format ["%1%2",round((_cntDmg*100)/_cnt),"%"];

if(count(_CntWheels) == 4)then
{
	_display = findDisplay 3333;
	_Btn1 = _display displayCtrl Btn1;
	_Btn2 = _display displayCtrl Btn2;
	_Btn3 = _display displayCtrl Btn3;
	_Btn4 = _display displayCtrl Btn4;
	_Btn5 = _display displayCtrl Btn5;
	_Btn6 = _display displayCtrl Btn6;
	_Btn7 = _display displayCtrl Btn7;
	_Btn8 = _display displayCtrl Btn20;
	_Btn9 = _display displayCtrl Btn21;
	
	ctrlSetText [3351,_DmgVeh];
	if(!("HitBody" in _DmgList))	then{_Btn1 ctrlShow false}								else {_Btn1 buttonSetAction "closeDialog 0; [""HitBody""] spawn life_fnc_repairTruck;"};
	if(!("HitEngine" in _DmgList))	then{_Btn2 ctrlShow false; ctrlSetText [3339,""]}		else {_Btn2 buttonSetAction "closeDialog 0; [""HitEngine""] spawn life_fnc_repairTruck;"};
	if(!("HitFuel" in _DmgList))	then{_Btn3 ctrlShow false; ctrlSetText [3340,""]}		else {_Btn3 buttonSetAction "closeDialog 0; [""HitFuel""] spawn life_fnc_repairTruck;"};
	if(!("HitLFWheel" in _DmgList))	then{_Btn4 ctrlShow false; ctrlSetText [3335,""]}		else {_Btn4 buttonSetAction "closeDialog 0; [""HitLFWheel""] spawn life_fnc_repairTruck;";};
	if(!("HitRFWheel" in _DmgList))	then{_Btn5 ctrlShow false; ctrlSetText [3337,""]}		else {_Btn5 buttonSetAction "closeDialog 0; [""HitRFWheel""] spawn life_fnc_repairTruck;";};
	if(!("HitLF2Wheel" in _DmgList))then{_Btn6 ctrlShow false; ctrlSetText [3336,""]}		else {_Btn6 buttonSetAction "closeDialog 0; [""HitLF2Wheel""] spawn life_fnc_repairTruck;";};
	if(!("HitRF2Wheel" in _DmgList))then{_Btn7 ctrlShow false; ctrlSetText [3338,""]}		else {_Btn7 buttonSetAction "closeDialog 0; [""HitRF2Wheel""] spawn life_fnc_repairTruck;";};
	_Btn8 ctrlShow false; ctrlSetText [3348,""];
	{ if(_x in _GlassList)exitWith{ _Btn8 ctrlShow true; ctrlSetText [3348,"textures\carwindow.paa"]; _Btn8 buttonSetAction "closeDialog 0; [""Scheiben""] spawn life_fnc_repairTruck;"; }}forEach _DmgList;
};

if(count(_CntWheels) > 4)then
{
	_display = findDisplay 6666;
	_Btn1 = _display displayCtrl Btn8;
	_Btn2 = _display displayCtrl Btn9;
	_Btn3 = _display displayCtrl Btn10;
	_Btn4 = _display displayCtrl Btn11;
	_Btn5 = _display displayCtrl Btn12;
	_Btn6 = _display displayCtrl Btn13;
	_Btn7 = _display displayCtrl Btn14;
	_Btn8 = _display displayCtrl Btn15;
	_Btn9 = _display displayCtrl Btn16;
	_Btn10 = _display displayCtrl Btn17;
	_Btn11 = _display displayCtrl Btn18;
	_Btn12 = _display displayCtrl Btn19;
	_Btn13 = _display displayCtrl Btn22;
	
	ctrlSetText [6692,_DmgVeh];
	if(!("HitBody" in _DmgList))	then	{_Btn1 ctrlShow false}	 							else {_Btn1 buttonSetAction "closeDialog 0; [""HitBody""] spawn life_fnc_repairTruck;"};
	if(!("HitEngine" in _DmgList))	then	{_Btn2 ctrlShow false; ctrlSetText [6675,""]}		else {_Btn2 buttonSetAction "closeDialog 0; [""HitEngine""] spawn life_fnc_repairTruck;"};
	if(!("HitFuel" in _DmgList))	then	{_Btn3 ctrlShow false; ctrlSetText [6676,""]}		else {_Btn3 buttonSetAction "closeDialog 0; [""HitFuel""] spawn life_fnc_repairTruck;"};
	
	_Btn12 ctrlShow false; ctrlSetText [6689,""];
	{if(_x in _GlassList)exitWith{ _Btn12 ctrlShow true; ctrlSetText [6689,"textures\carwindow.paa"]; _Btn12 buttonSetAction "closeDialog 0; [""Scheiben""] spawn life_fnc_repairTruck;"; };}forEach _DmgList;
	
	_isKamaz = [(configFile >> "CfgVehicles" >> (typeOf _Veh)),true ] call BIS_fnc_returnParents;
	if(!("Truck_02_base_F" in _isKamaz))then
	{
		if(!("HitLFWheel" in _DmgList))	then{_Btn4 ctrlShow false; ctrlSetText [6667,""]}	else {_Btn4 buttonSetAction "closeDialog 0; [""HitLFWheel""] spawn life_fnc_repairTruck;";};
		if(!("HitRFWheel" in _DmgList))	then{_Btn5 ctrlShow false; ctrlSetText [6671,""]}	else {_Btn5 buttonSetAction "closeDialog 0; [""HitRFWheel""] spawn life_fnc_repairTruck;";};
		if(!("HitLF2Wheel" in _DmgList))then{_Btn6 ctrlShow false; ctrlSetText [6668,""]}	else {_Btn6 buttonSetAction "closeDialog 0; [""HitLF2Wheel""] spawn life_fnc_repairTruck;";};
		if(!("HitRF2Wheel" in _DmgList))then{_Btn7 ctrlShow false; ctrlSetText [6672,""]}	else {_Btn7 buttonSetAction "closeDialog 0; [""HitRF2Wheel""] spawn life_fnc_repairTruck;";};
		if(!("HitLMWheel" in _DmgList))	then{_Btn8 ctrlShow false; ctrlSetText [6669,""]}	else {_Btn8 buttonSetAction "closeDialog 0; [""HitLMWheel""] spawn life_fnc_repairTruck;";};
		if(!("HitRMWheel" in _DmgList))	then{_Btn9 ctrlShow false; ctrlSetText [6673,""]}	else {_Btn9 buttonSetAction "closeDialog 0; [""HitRMWheel""] spawn life_fnc_repairTruck;";};
		if(!("HitLBWheel" in _DmgList))	then{_Btn10 ctrlShow false; ctrlSetText [6670,""]}	else {_Btn10 buttonSetAction "closeDialog 0; [""HitLBWheel""] spawn life_fnc_repairTruck;";};
		if(!("HitRBWheel" in _DmgList))	then{_Btn11 ctrlShow false; ctrlSetText [6674,""]}	else {_Btn11 buttonSetAction "closeDialog 0; [""HitRBWheel""] spawn life_fnc_repairTruck;";};
	}
	else
	{
		if(!("HitLFWheel" in _DmgList))	then{_Btn4 ctrlShow false; ctrlSetText [6667,""]}	else {_Btn4 buttonSetAction "closeDialog 0; [""HitLFWheel""] spawn life_fnc_repairTruck;";};
		if(!("HitRFWheel" in _DmgList))	then{_Btn5 ctrlShow false; ctrlSetText [6671,""]}	else {_Btn5 buttonSetAction "closeDialog 0; [""HitRFWheel""] spawn life_fnc_repairTruck;";};
		if(!("HitLF2Wheel" in _DmgList))then{_Btn10 ctrlShow false; ctrlSetText [6670,""]}	else {_Btn10 buttonSetAction "closeDialog 0; [""HitLF2Wheel""] spawn life_fnc_repairTruck;";};
		if(!("HitRF2Wheel" in _DmgList))then{_Btn11 ctrlShow false; ctrlSetText [6674,""]}	else {_Btn11 buttonSetAction "closeDialog 0; [""HitRF2Wheel""] spawn life_fnc_repairTruck;";};
		if(!("HitLMWheel" in _DmgList))	then{_Btn8 ctrlShow false; ctrlSetText [6669,""]}	else {_Btn8 buttonSetAction "closeDialog 0; [""HitLMWheel""] spawn life_fnc_repairTruck;";};
		if(!("HitRMWheel" in _DmgList))	then{_Btn9 ctrlShow false; ctrlSetText [6673,""]}	else {_Btn9 buttonSetAction "closeDialog 0; [""HitRMWheel""] spawn life_fnc_repairTruck;";};
		if(!("HitLBWheel" in _DmgList))	then{_Btn6 ctrlShow false; ctrlSetText [6668,""]}	else {_Btn6 buttonSetAction "closeDialog 0; [""HitLBWheel""] spawn life_fnc_repairTruck;";};
		if(!("HitRBWheel" in _DmgList))	then{_Btn7 ctrlShow false; ctrlSetText [6672,""]}	else {_Btn7 buttonSetAction "closeDialog 0; [""HitRBWheel""] spawn life_fnc_repairTruck;";};
	};
};