//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_EarPlug.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Ohrenstöpsel halt, nä?
//::::::::::::  ::::::::::::\\
_Mod = _this select 0;

if(_mod == 1)then{ 1 fadeSound 0.1; D41_EarPlugInUse = true;};
if(_mod == 0)then{ 1 fadeSound 1; D41_EarPlugInUse = false;};