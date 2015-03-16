/*

	Shows cop arrest dlg

*/

if(playerSide != west) exitWith {};
if(!((player distance (getMarkerPos "cop_spawn_1") < 30) OR  (player distance (getMarkerPos "cop_spawn_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR (player distance (getMarkerPos "cop_spawn_4") < 30) OR (player distance (getMarkerPos "cop_spawn_7") < 30))) exitWith {closeDialog 0; hint "Du bist nicht in der Nähe einer Polizeistation";};

createDialog "jail_time";