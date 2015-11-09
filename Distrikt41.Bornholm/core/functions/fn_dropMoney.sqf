/*
	File: fn_dropItems.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called on death, player drops any 'virtual' items they may be carrying.
*/
private["_obj","_unit","_pos"];
_unit = player;

if(D41_Geld > 0) then
	{
		_pos = _unit modelToWorld[0,3,0];
		_pos = [_pos select 0, _pos select 1, 0];
		_obj = "Land_Money_F" createVehicle _pos;
		_obj setVariable["item",["money",D41_Geld],true];
		_obj setPos _pos;
	};