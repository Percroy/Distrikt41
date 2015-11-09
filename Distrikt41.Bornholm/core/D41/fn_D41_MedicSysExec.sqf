//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_MedicSys.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Basic Medic System
//::::::::::::  ::::::::::::\\

private[];

_Part = _this select 0;
_Mod = _this select 1;
_IsMedic = _this select 2;

_Dmg = player getHitPointDamage _Part;
_Dmg = _Dmg - _Mod;

if(_IsMedic)then{_Dmg = _Dmg - 0.5; if(_Dmg < 0)then{_Dmg = 0;};}else{if(_Dmg < 0.25)then{_Dmg = 0.25;};};

closeDialog 0;
[_Part, _Dmg] spawn life_fnc_D41_TeilHeilung;