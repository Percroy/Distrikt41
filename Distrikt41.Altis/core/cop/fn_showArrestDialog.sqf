/*

	Shows cop arrest dlg

*/

if(playerSide != west) exitWith {};
if(!((player distance (getMarkerPos "cop_spawn_1") < 30) OR  (player distance (getMarkerPos "cop_spawn_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR (player distance (getMarkerPos "cop_spawn_4") < 30) OR (player distance (getMarkerPos "cop_spawn_7") < 30))) exitWith {closeDialog 0; hint localize "STR_D41_CopEinknastenReichweite";};

createDialog "jail_time";