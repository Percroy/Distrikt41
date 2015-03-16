/*
	File: fn_setupActions.sqf

	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_gatherFischen,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "C_Rubberboat" OR vehicle player isKindOf "D41_Trawler") && speed (vehicle player) < 2 && speed (vehicle player) > -1 && ((getPos player) distance (getMarkerPos "D41_Fischzone_01") < 500 OR (getPos player) distance (getMarkerPos "D41_Fischzone_02") < 500 OR (getPos player) distance (getMarkerPos "D41_Fischzone_03") < 500 OR (getPos player) distance (getMarkerPos "D41_Fischzone_04") < 500) && !life_net_dropped ']];
		life_actions = [player addAction["Krabenfallen auswerfen",life_fnc_gatherKrabben,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "D41_Trawler") && !(vehicle player isKindOf "C_Rubberboat") && speed (vehicle player) < 15 && speed (vehicle player) > 5 && ((getPos player) distance (getMarkerPos "D41_Krabbenzone_01") < 700 OR (getPos player) distance (getMarkerPos "D41_Krabbenzone_02") < 700) && !life_net_dropped ']];

		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && (cursorTarget getVariable "D41_geknueppelt") && !(cursorTarget getVariable["robbed",FALSE] ) ']];
		life_actions = life_actions + [player addAction["Ausrauben!",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && !(cursorTarget getVariable "D41_geknueppelt") && (cursorTarget getVariable "surrender") && !(cursorTarget getVariable["robbed",FALSE] ) ']];

		//Trawler aufschließen
		life_actions = life_actions + [player addAction["Trawler auf/abschließen!",life_fnc_unlockTrawler,"",0,false,false,"",'
		(cursorTarget isKindOf "D41_Trawler" && player distance cursorTarget < 30)']];

		//Trawler: Anker werfen (Stop auf 0)
		life_actions = life_actions + [player addaction["Anker werfen",life_fnc_D41_Anker,"",0,false,false,"",'
		((vehicle player isKindOf "D41_Trawler") && ((speed vehicle player) < 4) && ((speed vehicle player) > -4) && !((speed vehicle player) == 0))']];
	};

	case west:
	{
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Begrenzung einpacken</t>",life_fnc_packupmauer,"",0,false,false,"",'
		_mauer = nearestObjects[getPos player, ["Land_LandMark_F"],3] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Strahler einpacken</t>",life_fnc_packupstrahler,"",0,false,false,"",'
		_strahler = nearestObjects[getPos player, ["Land_PortableLight_double_F"],3] select 0; !isNil "_strahler" && !isNil {(_strahler getVariable "item")}']];
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Schranke einpacken</t>",life_fnc_packupSchranke,"",0,false,false,"",'
		_Schranke = nearestObjects[getPos player, ["Land_BarGate_F"],5] select 0; !isNil "_Schranke" && !isNil {(_Schranke getVariable "item")}']];
		//Knastzaun reparieren
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Gefängniszaun reparieren</t>",life_fnc_D41_KnastRep,"",0,false,false,"",'
		(player distance D41_KnastZaun < 4) && (getDammage D41_Knastzaun == 1)']];

	};
};

//Handy zerstören/wegnehmen
life_actions = life_actions + [player addAction["Handy wegnehmen und zerstören!",life_fnc_stealmobileAction,"",0,false,false,"",'
!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && ("ItemRadio" in (assignedItems  cursorTarget)) && (cursorTarget getVariable "D41_geknueppelt") ']];
life_actions = life_actions + [player addAction["Handy wegnehmen und zerstören!",life_fnc_stealmobileAction,"",0,false,false,"",'
!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && ("ItemRadio" in (assignedItems  cursorTarget)) && !(cursorTarget getVariable "D41_geknueppelt") && (cursorTarget getVariable "surrender") ']];

//Entwaffnen
life_actions = life_actions + [player addAction["Person entwaffnen!",life_fnc_entwaffnenAction,"",0,false,false,"",'
!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && (cursorTarget getVariable "restrained") ']];

//Earplugs
life_actions = life_actions + [player addAction["<t color='#ffff33'>Ohrenstöpsel einstecken</t>",life_fnc_D41_EarPlug,"",0,false,false,"",'(vehicle player isKindOf "Air") && (!D41_EarPlugInUse)']];
life_actions = life_actions + [player addAction["<t color='#ffff33'>Ohrenstöpsel einstecken</t>",life_fnc_D41_EarPlug,"",0,false,false,"",'(vehicle player isKindOf "Car") && (!D41_EarPlugInUse)']];
life_actions = life_actions + [player addAction["<t color='#ffff33'>Ohrenstöpsel einstecken</t>",life_fnc_D41_EarPlug,"",0,false,false,"",'(vehicle player isKindOf "Ship") && (!D41_EarPlugInUse)']];
life_actions = life_actions + [player addAction["<t color='#ffff33'>Ohrenstöpsel herausnehmen</t>",{D41_EarPlugInUse = false},"",0,false,false,"",'D41_EarPlugInUse']];

//Geld aufheben
life_actions = life_actions + [player addAction["Geld aufheben",{_obj = cursorTarget; _obj setVariable["inUse",TRUE,TRUE]; _handle = [_obj] spawn life_fnc_pickupMoney; waitUntil {scriptDone _handle};},"",0,false,false,"",'
((typeOf cursorTarget) == "Land_Money_F" && (player distance cursorTarget < 2))']];