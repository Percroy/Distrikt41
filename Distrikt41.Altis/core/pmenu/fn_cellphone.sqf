#include <macro.h>
/*
	File: fn_cellphone.sqf
	Author: Alan
	
	Description:
	Opens the cellphone menu?
*/
#define Btn0 3023
private["_display","_units","_type"];

if(!(call life_fnc_D41_PlyrHandyCheck))exitWith{hint localize "STR_D41_Phone"; closeDialog 0;};

disableSerialization;



waitUntil {!isNull findDisplay 3000};
_display = findDisplay 3000;
_units = _display displayCtrl 3004;
_Btn0 = _display displayCtrl Btn0;

ctrlSetText [3003, ""];
lbClear _units;

if((__GETC__(life_adminlevel) < 1)) then
{
	ctrlShow[3020,false];
	ctrlShow[3021,false];
};

if((__GETC__(life_coplevel) < 1)) then
{
	_Btn0 ctrlSetText localize "STR_CELL_TextPolice";
	buttonSetAction [3023, "[] call TON_fnc_cell_textcop"];
}
else
{
	_Btn0 ctrlSetText localize "STR_CELL_PolicetoAll";
	buttonSetAction [3023, "[] call TON_fnc_cell_copmsgall"];
};
{
	if(alive _x && _x != player) then
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "Med"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach playableUnits;

lbSetCurSel [3004,0];
//buttonSetAction [3022, "ctrlSetText [3003, ''];"]; //Geändert auf: Letzte Nachricht anzeigen