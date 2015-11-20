/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blocks the unit from taking something they should not have.
*/
private["_unit","_item"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?

switch(playerSide) do
{
	case west:	{
					if(_item in ["D41_medic_man_uniform","D41_TTrackerGummi"]) then
					{
						[_item,false,false,false,false] call life_fnc_handleItem;
						hint localize "STR_D41_PickUP_NotAllowed";
					};
				};
	case civilian:	{
						if(_item in ["D41_medic_man_uniform"]) then
						{
							[_item,false,false,false,false] call life_fnc_handleItem;
							hint localize "STR_D41_PickUP_NotAllowed";
						};
						
						if((_item in ["D41_TTrackerGummi","D41_Hero_Backpack_l","D41_Hero_Backpack_d"]) && !(life_D41_Karma >= 2000)) then
						{
							[_item,false,false,false,false] call life_fnc_handleItem;
							hint localize "STR_D41_Taser_karma";
						};
					};
	case independent: {};
};