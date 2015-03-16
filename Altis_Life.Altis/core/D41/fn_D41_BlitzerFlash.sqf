//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_BlitzerFlash.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Führt Blitzereffekt aus
//::::::::::::  ::::::::::::\\
_maxSpd = _this select 0;
closeDialog 0;

_curSpd = speed player;
player say3D "D41_Blitzer";

sleep 0.25;
for "_i" from 0 to 2 do
{
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 1, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];
	"colorCorrections" ppEffectCommit 0.15; // Commit post process effect in given time. Sollte gehn noch net getestet damit alle blitze sehen ^^
	sleep 0.15;
	"colorCorrections" ppEffectEnable false;
	sleep 0.15;
};

if(playerSide in [west,independent]) exitWith {};
D41_atmGeld = D41_atmGeld - 500;
if(D41_atmGeld < 0) then {D41_atmGeld = 0;};

hint parseText format
["
<t color='#ff0000'><t size='2'>!! GEBLITZT !!</t></t><br/><br/>
<t color='#ffffff'><t size='1.25'>Du bist</t></t><br/>
<t color='#ff0000'><t size='1.75'>%1 </t></t><t color='#ffffff'><t size='1.25'>Km/h</t></t><br/>
<t color='#ffffff'><t size='1.25'>zu schnell gefahren</t></t><br/>
<t color='#ffffff'><t size='1.00'>500€ wurden vom Konto abgebucht.</t></t><br/>
",
(round(_CurSpd - _maxSpd))];