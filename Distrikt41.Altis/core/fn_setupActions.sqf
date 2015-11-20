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
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "C_Rubberboat" OR vehicle player isKindOf "C_Boat_Civil_01_F" OR vehicle player isKindOf "D41_Trawler") && speed (vehicle player) < 2 && speed (vehicle player) > -1 && ((getPos player) distance (getMarkerPos "D41_Fischzone_01") < 500 OR (getPos player) distance (getMarkerPos "D41_Fischzone_02") < 500 OR (getPos player) distance (getMarkerPos "D41_Fischzone_03") < 500 OR (getPos player) distance (getMarkerPos "D41_Fischzone_04") < 500) && !life_net_dropped ']];
		life_actions = [player addAction[localize "STR_pAct_DropCrapNet",life_fnc_gatherKrabben,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "D41_Trawler") && !(vehicle player isKindOf "C_Rubberboat") && speed (vehicle player) < 15 && speed (vehicle player) > 5 && ((getPos player) distance (getMarkerPos "D41_Krabbenzone_01") < 700 OR (getPos player) distance (getMarkerPos "D41_Krabbenzone_02") < 700) && !life_net_dropped ']];
		
		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && (cursorTarget getVariable "D41_geknueppelt") && !(cursorTarget getVariable["robbed",FALSE] ) ']];
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && !(cursorTarget getVariable "D41_geknueppelt") && (cursorTarget getVariable "surrender") && !(cursorTarget getVariable["robbed",FALSE] ) ']];
		
		//Trawler aufschließen
		life_actions = life_actions + [player addAction[localize "STR_pAct_lock_Trawler",life_fnc_unlockTrawler,"",0,false,false,"",'
		(cursorTarget isKindOf "D41_Trawler" && player distance cursorTarget < 30)']];
		//Trawler: Anker werfen (Stop auf 0)
		life_actions = life_actions + [player addaction[localize "STR_pAct_Anchor",life_fnc_D41_Anker,"",0,false,false,"",'
		((vehicle player isKindOf "D41_Trawler") && ((speed vehicle player) < 4) && ((speed vehicle player) > -4) && !((speed vehicle player) == 0))']];
		
		//Meth herstellen im "D41_gaz66_r142_msv"
		life_actions = life_actions + [player addAction[localize "STR_D41_Meth_Herstellen",life_fnc_gatherMeth,"",0,false,false,"",'
		( (typeOf(vehicle player) == "D41_gaz66_r142_msv") && ((speed vehicle player) < 1) &&  (count(crew vehicle player) == 2) && (isEngineOn vehicle player) && !life_action_gather )']];

	};
	
	case west:
	{
		life_actions = life_actions + [player addAction[localize "STR_pAct_Pack_Wall",life_fnc_packupmauer,"",0,false,false,"",'
		_mauer = nearestObjects[getPos player, ["Land_LandMark_F"],3] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")}']];
		life_actions = life_actions + [player addAction[localize "STR_pAct_Pack_Spotlight",life_fnc_packupstrahler,"",0,false,false,"",'
		_strahler = nearestObjects[getPos player, ["Land_PortableLight_double_F"],3] select 0; !isNil "_strahler" && !isNil {(_strahler getVariable "item")}']];
		life_actions = life_actions + [player addAction[localize "STR_pAct_Pack_Gate",life_fnc_packupSchranke,"",0,false,false,"",'
		_Schranke = nearestObjects[getPos player, ["Land_BarGate_F"],5] select 0; !isNil "_Schranke" && !isNil {(_Schranke getVariable "item")}']];
	};
	
	case independent:
	{
		life_actions = life_actions + [player addAction[localize "STR_pAct_Pack_Spotlight",life_fnc_packupstrahler,"",0,false,false,"",'
		_strahler = nearestObjects[getPos player, ["Land_PortableLight_double_F"],3] select 0; !isNil "_strahler" && !isNil {(_strahler getVariable "item")}']];
		life_actions = life_actions + [player addAction[localize "STR_pAct_Pack_Spotlight",life_fnc_packupleitkegel,"",0,false,false,"",'
		_leitkegel = nearestObjects[getPos player, ["RoadCone_L_F"],5] select 0; !isNil "_leitkegel" && !isNil {(_leitkegel getVariable "item")}']];
	};
};

//Handy zerstören/wegnehmen
life_actions = life_actions + [player addAction[localize "STR_pAct_Destroy_Phone",life_fnc_stealmobileAction,"",0,false,false,"",'
!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && (cursorTarget getVariable "D41_geknueppelt") && (call life_fnc_D41_CTgtHandyCheck)']];
life_actions = life_actions + [player addAction[localize "STR_pAct_Destroy_Phone",life_fnc_stealmobileAction,"",0,false,false,"",'
!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && !(cursorTarget getVariable "D41_geknueppelt") && (cursorTarget getVariable "surrender") && (call life_fnc_D41_CTgtHandyCheck)']];

//Entwaffnen
life_actions = life_actions + [player addAction[localize "STR_pAct_Disarm",life_fnc_entwaffnenAction,"",0,false,false,"",'
!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && (cursorTarget getVariable "restrained") ']];

//Tonne tragen
life_actions = life_actions + [player addAction[localize "STR_D41_Meth1_tragen",{[true] spawn life_fnc_D41_TransportTonne},'',0,false,false,"",'
(count(attachedObjects player) == 0) && (typeOf cursorTarget) isEqualTo "Land_MetalBarrel_F" ']];

//Tonne abstellen
life_actions = life_actions + [player addAction[localize "STR_D41_Meth1_abstellen",{[false] spawn life_fnc_D41_TransportTonne},'',0,false,false,"",'
(count(attachedObjects player) != 0) && (typeOf ((attachedObjects player) select 0) IsEqualTo "Land_MetalBarrel_F")']];

//Tonne einfüllen
life_actions = life_actions + [player addAction[localize "STR_D41_Meth1_einfuellen",{[true] spawn life_fnc_D41_TonneEinfuellen},'',0,false,false,"",'
_FuelTrucks = nearestObjects[getPos player, D41_TanklasterListe,5] select 0; !isNil "_FuelTrucks" && (count(attachedObjects player) == 0) && (typeOf cursorTarget) isEqualTo "Land_MetalBarrel_F"']];

//Anhänger - Container entladen
life_actions = life_actions + [player addAction[localize "STR_D41_AnhContainerEntladen",life_fnc_D41_UnLoadCargo,"",0,false,false,"",'
(cursorTarget isKindOf "D41_Trailer_A" && player distance cursorTarget < 5 && (cursorTarget animationPhase "HideCargo") == -1)']];

//Anhänger - Container aufladen
life_actions = life_actions + [player addAction[localize "STR_D41_AnhContainerAufladen",life_fnc_D41_LoadCargo,"",0,false,false,"",'
(cursorTarget isKindOf "D41_Trailer_A" && player distance cursorTarget < 5 && (cursorTarget animationPhase "HideCargo") == 0)']];

