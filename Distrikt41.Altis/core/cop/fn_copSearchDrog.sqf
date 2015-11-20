#include <macro.h>
/*
	File: fn_copSearchDrog.sqf
	Author: Distrikt41 - Dscha
	
	Description:
	Returns information on the search.
*/
life_action_inUse = false;
private["_civ","_invs","_license","_robber","_guns","_gun"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_DrogenGenommen = [_this,1,0] call BIS_fnc_param;

if(!alive _civ || player distance _civ > 5) exitWith {hint format[localize "STR_Cop_CouldntSearch",_civ getVariable["realname",name _civ]]};

hint parseText format[
"
<t color='#FFFF00'><t size='1.5'><br/>
%1
</t></t>
<br/>
<br/>
<t color='#FF0000'><t size='1.5'>Unter Drogen:</t></t>
<br/>
<br/>
<t color='#FFFFFF'><t size='1.5'>Wert
<br/>
(0.3 Toleranz)</t></t>
<br/>
<br/>
<t color='#FF0000'><t size='2'>%2</t></t>
<br/>
<br/>
",
(_civ getVariable["realname",name _civ]), [_DrogenGenommen] call life_fnc_numberText];