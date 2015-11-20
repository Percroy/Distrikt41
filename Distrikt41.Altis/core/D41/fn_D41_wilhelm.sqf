//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_wilhelm.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Ja.
//::::::::::::  ::::::::::::\\
private["_Target"];

if(!alive player) exitWith {};
//_Target say3D "Sounds\wilhelm.ogg";
//playSound3D ["D41_S\Sounds\AlifeSounds\wilhelm.ogg", player, false, getPosASL player, 2, 1, 50];
hint localize "STR_D41_FingerAb";

_Mod = 0.1;
_Part = "HitHands";

_Dmg = player getHitPointDamage _Part;
_Dmg = _Dmg + _Mod;
[_Part, _Dmg] spawn life_fnc_D41_TeilHeilung;