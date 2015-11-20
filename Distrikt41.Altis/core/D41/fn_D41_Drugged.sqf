//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_Drugged.sqf
//	Author: Distrikt41 - Avka
//
//	Beschreibung: Leute unter Drogen setzten.
//::::::::::::  ::::::::::::\\

private["_Droge"];
_Droge = _this select 0;
if(_Droge == "D41_Heroin")then {hint localize "STR_D41_Drugged";[] spawn life_fnc_heroinEffekt;};
if(_Droge == "D41_Kokain")then {hint localize "STR_D41_Drugged";[] spawn life_fnc_kokainEffekt;};
if(_Droge == "D41_Cannabis")then {hint localize "STR_D41_Drugged";[] spawn life_fnc_weedEffekt;};