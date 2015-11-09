/*
	File: fn_federalUpdate.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Uhhh, adds to it?
*/
private["_funds"];
D41_BankAddAmount = 10;
D41_Safe_Loot = 30;
while {true} do
{
	D41_Safe_Loot = D41_Safe_Loot + D41_BankAddAmount;
	publicVariable "D41_Safe_Loot";
	sleep (20 * 60);
};