//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_wilhelm.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Ja.
//::::::::::::  ::::::::::::\\
private["_Target"];

if(!alive player) exitWith {};
hint localize "STR_D41_FingerAb";

_Mod = 0.1;
_Part = "HitHands";

_Dmg = player getHitPointDamage _Part;
_Dmg = _Dmg + _Mod;
[_Part, _Dmg] spawn life_fnc_D41_TeilHeilung;