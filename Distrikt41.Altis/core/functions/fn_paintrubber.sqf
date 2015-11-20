/*
	File: fn_paintrubber.sqf
	Author: Bryan "Tonic" Boardwine
	Edit:// Avka - Distrikt41
	
	Description:
	Starts the tazed animation and broadcasts out what it needs to. Target gets a Red Screen and gets downed.
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; D41_GeGummigeschosst = false;};

if(_shooter isKindOf "Man" && alive player) then
{
	if(!D41_GeGummigeschosst) then
	{
		D41_GeGummigeschosst = true;
		
		[] spawn
		{
			for "_i" from 0 to 10 do
			{

				"colorCorrections" ppEffectEnable true;
				"colorCorrections" ppEffectAdjust [1, 1, 0, [1,0,0,0.4+(random(0.5))], [1,1,1,1], [1,1,1,1]];
				"colorCorrections" ppEffectCommit 1;
				sleep 1;
			};
		};
		
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
		_obj setPosATL (getPosATL _unit);
		[[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"life_fnc_animSync",true,false] call life_fnc_MP;

		life_maskiert = 0;
		if ((goggles _shooter) in D41_goggles_Array) then {life_maskiert = 1};
		if ((uniform _shooter) in D41_uniform_Array) then {life_maskiert = 1};
		if ((headgear _shooter) in D41_headgear_Array) then {life_maskiert = 1};
		if ((hmd _shooter) in D41_hmd_Array) then {life_maskiert = 1};

		if (life_maskiert > 0) then
			{
				[[0,format[localize "STR_D41_Rubber",_unit getVariable["realname", name _unit], localize "STR_D41_Masked"]],"life_fnc_broadcast",true,false] call life_fnc_MP;
			}
				else
			{
				[[0,format[localize "STR_D41_Rubber", _unit getVariable["realname",name _unit], _shooter getVariable["realname",name _shooter]]],"life_fnc_broadcast",true,false] call life_fnc_MP;
			};

		_unit attachTo [_obj,[0,0,0]];
		disableUserInput true;
		sleep 15;
		[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] call life_fnc_MP;
		if(!(player getVariable["Escorting",false])) then {
			detach player;
		};
		D41_GeGummigeschosst = false;
		player allowDamage true;
		disableUserInput false;
		"colorCorrections" ppEffectEnable false;
	};
}
	else
{
	_unit allowDamage true;
	D41_GeGummigeschosst = false;
	"colorCorrections" ppEffectEnable false;
};