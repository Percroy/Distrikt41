/*
	Author: MrKraken
	filename: fn_surrender.sqf
	Description: places player into a surrendered state!
	Edited by Distrik 41 - Avka
*/
_holder = "GroundWeaponHolder" createVehicle position player;
player setVariable ["surrender", true, true]; //Set surrender to true
if(primaryWeapon player != "") then {
	player action [
		"DropWeapon",
		_holder,
		primaryWeapon player
	];
	sleep 1;
};

if(handgunWeapon player != "") then {	
	player action [
		"DropWeapon",
		_holder,
		handgunWeapon player
	];
	sleep 1;
};

if(secondaryWeapon player != "") then {	
	player action [
		"DropWeapon",
		_holder,
		secondaryWeapon player
	];
};

while { player getVariable ["surrender", false] }  do { 
	player playMove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"; //Animation in
	
	// Check if player is alive.
	if (!alive player) then {
		player setVariable ["surrender", false, true];
	};
};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"; //Animation out