/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Searches the player and he returns information back to the player.
*/
private["_cop","_inv","_var","_val","_robber"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_inv = [];
_robber = false;
_counter = 0;

//Illegal items
{
	_counter = 0;
	_Item = _x select 0;
	while{_Item in magazines player} do
	{
			player removeMagazine _Item;
			_counter = _counter + 1;
	};
	_inv pushBack [_Item,_counter];
} foreach life_illegal_items;


if(!life_use_atm) then 
{
	D41_Geld = 0;
	_robber = true;
};

[[player,_inv,_robber],"life_fnc_copSearch",_cop,false] call life_fnc_MP;