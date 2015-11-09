/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Reveals nearest objects within 15 automatically to help with picking
	up various static objects on the ground such as money, water, etc.
	
	Can be taxing on low-end systems or AMD CPU users.
*/
private["_objects"];
_objects = nearestObjects[visiblePositionASL player, ["Land_Money_F","Man"], 15];
{
	player reveal _x;
	(group player) reveal _x;
} foreach _objects;