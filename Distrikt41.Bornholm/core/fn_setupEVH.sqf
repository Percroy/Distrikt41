/*
	Master eventhandler file
*/
player addEventHandler["Killed", {_this spawn life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call life_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["Fired",{_this call life_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed; [3] call SOCK_fnc_updatePartial; [cursorTarget] spawn D41_fnc_gewichtssys;}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened; if(playerside == civilian)then{[9] call SOCK_fnc_updatePartial; [10] call SOCK_fnc_updatePartial;};}];
"life_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};