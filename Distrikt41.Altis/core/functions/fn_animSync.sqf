/*
	File: fn_animSync.sqf
*/
private["_unit","_anim"];
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_anim = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _unit) exitWith {};

if(!(_anim in ["amovppnemstpsraswrfldnon","AinjPfalMstpSnonWnonDf_carried_fallwc","AwopPercMstpSgthWrflDnon_End2"])) exitWith {};
_unit switchMove _anim;