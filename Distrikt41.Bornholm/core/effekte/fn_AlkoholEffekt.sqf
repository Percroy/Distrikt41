/*
    File: fn_AlkoholEffekt.sqf
    Author: Kuchiha
	Edit by: Distrikt41 - Dscha
    Description:
    Alkohol Effekt.
*/

//Inventar schließen
closeDialog 0;

life_Alkoholiker = 1;
sleep 1;

"dynamicBlur" ppEffectEnable true;
"chromAberration" ppEffectEnable true;
enableCamShake true;

noesckey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"]; //ESC ausgeschalten
EffektStart = round(random 5);

//Dauer
if (life_AlkKonsum >= 2.4) then
	{
		if (EffektStart <= 2) exitWith {};
		for "_i" from 0 to 44 do
			{  
				"dynamicBlur" ppEffectAdjust  [random 8];
				"dynamicBlur" ppEffectCommit 1;
				addcamShake[random 15, 1, random 25];
				sleep 1;
			};
		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 5;
		sleep 6;
	};

if (life_AlkKonsum >= 1.2 && life_AlkKonsum <= 2.3) then
	{
		if (EffektStart <= 2) exitWith {};
		for "_i" from 0 to 29 do
			{
				"dynamicBlur" ppEffectAdjust  [random 5];
				"dynamicBlur" ppEffectCommit 1;
				addcamShake[random 10, 1, random 15];
				sleep 1;
			};
		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 5;
		sleep 6;
	};

(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey]; //ESC eingeschalten

"colorInversion" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
resetCamShake;

life_Alkoholiker = 0;