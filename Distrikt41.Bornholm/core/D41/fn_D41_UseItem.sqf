//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_UseItem.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Nötig fürs Item benutzen?
//::::::::::::  ::::::::::::\\

private["_Item","_ItemName"];
disableSerialization;
_Item = _this select 0;
_ItemName = _this select 1;
_idc = _this select 2;
if(_idc == 640)exitWith {hint localize "STR_D41_IDC640";};

/*if(_ItemName == "First Aid Kit") then //Bsp. für ein Item OHNE Classname!
	{
		player setDamage 0;
		player removeItem "D41_MediKit";
		hint format ["First Aid Kit benutzt.\n\nSchaden: %1/1", damage player];
	};*/
if(_Item == "D41_MediKit")then
	{
		closeDialog 0;
		[] spawn life_fnc_D41_MedicSys;
	};
if(_Item == "D41_ToolKit") then
	{
		closeDialog 0;
		if	(
				(({_x == "D41_ToolKit"} count magazines player) >= 2) &&
				(playerside == West) &&
				(((getPos player) distance [10394.704,9232.5898,-0.5]) < 5)
			)
			then{[] spawn life_fnc_D41_KnastRep;}
		else
		{
			if	(
				(({_x == "D41_ToolKit"} count magazines player) >= 1) &&
				(playerside == West) &&
				(((getPos player) distance [10374.447,9252.2354,0]) < 5)
			)
			then{[] spawn life_fnc_D41_KnastZaunRep;}
			else
			{
				[] spawn life_fnc_D41_RepCar;
			};	
			
		};
		
	};
if(_Item == "D41_BeefJerky") then
	{
		player removeMagazine _Item;
		_val = 40;
		life_hunger = (life_hunger + 40);
		_sum = life_hunger + _val;
		if(_sum > 100) exitWith {_sum = 100; life_hunger = _sum; player setFatigue 1; hint localize "STR_D41_ueberfressen";};
		life_hunger = _sum;
	};
if(_Item == "D41_WaterBottle") then
	{
		player removeMagazine _Item;
		_val = 40;
		life_thirst = (life_thirst + 20);
		player setFatigue 0;
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 0;};
		life_thirst = _sum;
	};
if(_Item == "D41_Apfel") then
	{
		player removeMagazine _Item;
		life_thirst = (life_thirst + 5);
		_val = 5;
		life_hunger = (life_hunger + 10);
		_val2 = 10;
		player setFatigue 0;
		
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 0;};
		life_thirst = _sum;
				
		_sum2 = life_hunger + _val2;
		if(_sum2 > 100) then {_sum2 = 100; player setFatigue 1; hint localize "STR_D41_ueberfressen";};
		life_hunger = _sum2;
	};
if(_Item == "D41_Apfelsaft") then
	{
		player removeMagazine _Item;
		_val = 40;
		life_thirst = (life_thirst + 40);
		player setFatigue 0;
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 0;};
		life_thirst = _sum;
	};
if(_Item == "D41_Apfelschnaps") then
	{
		if (life_AlkKonsum >= 3) exitWith {hint localize "STR_D41_zuTodeSaufen";};
		if (life_Alkoholiker > 0) exitWith {hint localize "STR_D41_Futterluke";};
		if (life_thirst < 13) exitWith {hint localize "STR_D41_zuTodeSaufen";};
		if (life_Alkoholiker < 1) exitWith
		{
			player removeMagazine _Item;
			life_thirst = (life_thirst - 10);
			life_hunger = (life_hunger + 15);
			_val2 = 15;
			[] spawn life_fnc_AlkoholEffekt;
			life_AlkKonsum = life_AlkKonsum + 0.6;
			
			_sum2 = life_hunger + _val2;
			if(_sum2 > 100) then {_sum2 = 100; player setFatigue 1;};
			life_hunger = _sum2;
			
			if(life_AlkKonsum < 1.2) then {hint format[localize "STR_D41_TextRuelps",life_AlkKonsum];};
			if(life_AlkKonsum >= 1.2 && life_AlkKonsum <= 2.4 ) then {hint format[localize "STR_D41_TextAlkoholBesoffen", life_AlkKonsum];};
			if(life_AlkKonsum >= 2.5) then {hint format[localize "STR_D41_TextAlkoholTotalBesoffen", life_AlkKonsum];};
		};
	};
if(_Item == "D41_Pfirsich") then
	{
		player removeMagazine _Item;
		life_thirst = (life_thirst + 10);
		_val = 10;
		life_hunger = (life_hunger + 15);
		_val2 = 15;
		player setFatigue 0;
		
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 0;};
		life_thirst = _sum;
				
		_sum2 = life_hunger + _val2;
		if(_sum2 > 100) then {_sum2 = 100; player setFatigue 1; hint localize "STR_D41_ueberfressen";};
		life_hunger = _sum2;
	};
if(_Item == "D41_Pfirsichsaft") then
	{
		player removeMagazine _Item;
		_val = 40;
		life_thirst = (life_thirst + 40);
		player setFatigue 0;
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 0;};
		life_thirst = _sum;
	};
if(_Item == "D41_Pfirsichschnaps") then
	{
		if (life_AlkKonsum >= 3) exitWith {hint localize "STR_D41_zuTodeSaufen";};
		if (life_Alkoholiker > 0) exitWith {hint localize "STR_D41_Futterluke";};
		if (life_thirst < 13) exitWith {hint localize "STR_D41_zuTodeSaufen";};
		if (life_Alkoholiker < 1) exitWith
		{
			player removeMagazine _Item;
			life_thirst = (life_thirst - 10);
			life_hunger = (life_hunger + 15);
			_val2 = 15;
			[] spawn life_fnc_AlkoholEffekt;
			life_AlkKonsum = life_AlkKonsum + 0.6;
			
			_sum2 = life_hunger + _val2;
			if(_sum2 > 100) then {_sum2 = 100; player setFatigue 1;};
			life_hunger = _sum2;
			
			if(life_AlkKonsum < 1.2) then {hint format[localize "STR_D41_TextRuelps",life_AlkKonsum];};
			if(life_AlkKonsum >= 1.2 && life_AlkKonsum <= 2.4 ) then {hint format[localize "STR_D41_TextAlkoholBesoffen", life_AlkKonsum];};
			if(life_AlkKonsum >= 2.5) then {hint format[localize "STR_D41_TextAlkoholTotalBesoffen", life_AlkKonsum];};
		};
	};
if(_Item == "D41_Hasenfleisch") then
	{
		player removeMagazine _Item;
		_val = 20;
		_sum = life_hunger + _val;
		if(_sum > 100) exitWith {_sum = 100; player setFatigue 1; hint localize "STR_D41_ueberfressen";};
		life_hunger = _sum;
		hint localize "STR_D41_TextHasen";
	};
if(_Item == "D41_Dosenfisch") then
	{
		player removeMagazine _Item;
		life_thirst = life_thirst - 10;
		[0.2] spawn life_fnc_D41_TeilHeilungNahrung;
	};
if(_Item == "D41_EnergyDrink") then
	{
		player removeMagazine _Item;
		life_thirst = 100;
		player setFatigue 0;
		[] spawn
		{
			life_energydrink_effect = time;
			titleText[localize "STR_D41_TextEnergy","PLAIN"];
			hint localize "STR_D41_TextEnergy";
			player enableFatigue false;
			waitUntil {!alive player OR ((time - life_energydrink_effect) > (3 * 60))};
			player enableFatigue true;
		};
	};
if(_Item == "D41_Cannabis") then
	{
		player removeMagazine _Item;
		[] spawn life_fnc_weedEffekt;
		life_DrogenKonsum = life_DrogenKonsum + 1;
		titleText[localize "STR_D41_TextCannabis","PLAIN"];
		hint localize "STR_D41_TextCannabis";
		player unassignItem "ItemGPS";
		player removeItem "ItemGPS";
		player unassignItem "ItemMap";
		player removeItem "ItemMap";
		[0.4] spawn life_fnc_D41_TeilHeilungNahrung;
	};
if(_Item == "D41_Kokain") then
	{
		player removeMagazine _Item;
		[] spawn life_fnc_kokainEffekt;
		life_DrogenKonsum = life_DrogenKonsum + 1;
		player setFatigue 0;
		[] spawn
		{
			life_KokaZeit = time;
			titleText[localize "STR_D41_TextKokain","PLAIN"];
			hint localize "STR_D41_TextKokain";
			player enableFatigue false;
			waitUntil {!alive player OR ((time - life_KokaZeit) > (10 * 60))};
			player enableFatigue true;
		};
	};
if(_Item == "D41_Heroin") then
	{
		player removeMagazine _Item;
		[] spawn life_fnc_heroinEffekt;
		life_DrogenKonsum = life_DrogenKonsum + 1;
		_random = floor(random 101);
		if(_random > 95) then 
		{
			_Part = "HitHands";
			_DmgMod = 0.2;
			_Dmg = ((player getHitPointDamage _Part) + _DmgMod);
			
			[_Part, _Dmg] spawn life_fnc_D41_TeilHeilung;
			titleText[localize "STR_D41_TextHeroinEi","PLAIN"];
			hint localize "STR_D41_TextHeroinEi";
		}
		else
		{
			titleText[localize "STR_D41_TextHeroin","PLAIN"];
			hint localize "STR_D41_TextHeroin";
			life_thirst = 200;
			life_hunger = 200;
		};
	};
if(_Item == "D41_Salema" OR _Item == "D41_Ornate" OR _Item == "D41_Mackrele" OR _Item == "D41_Tunfisch" OR _Item == "D41_Mullet" OR _Item == "D41_Katzenhai") then
	{
		hint localize "STR_D41_TextFisch";
	};
if(_Item == "D41_Donuts") then
	{
		player removeMagazine _Item;
		_val = 40;
		life_hunger = (life_hunger + 40);
		_sum = life_hunger + _val;
		if(_sum > 100) exitWith {_sum = 100; life_hunger = _sum; player setFatigue 1; hint localize "STR_D41_ueberfressen";};
		life_hunger = _sum;
		hint "hmm...\nDonuts\n...";
	};
if(_Item == "D41_Kaffee") then
	{
		player removeMagazine _Item;
		_val = 40;
		life_thirst = (life_thirst + 40);
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100;};
		life_thirst = _sum;
		hint localize "STR_D41_TextKaffee";
	};
if(_Item == "D41_BenzinKanisterLeer") then
	{
		_ItemOutput = "D41_BenzinKanister";
		_FSAbfrage = nearestObjects [player,["Land_FuelStation_Feed_F","Land_fs_feed_F"], 3];
		if((count _FSAbfrage) == 0) exitwith {closeDialog 0; hint localize "STR_D41_TankeZuWeitWeg";};
		if(!(player canAdd _ItemOutput)) exitWith {closeDialog 0; hint localize "STR_NOTF_NoSpace";};
		if((count _FSAbfrage) > 0) then
		{
			closeDialog 0;
			player removeMagazine _Item;
			player addMagazine _ItemOutput;
			titleText[localize "STR_D41_TankeKanisterAufgefuellt","PLAIN"];
		};
	};
if(_Item == "D41_BenzinKanister") then
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};
if(_Item == "D41_Nagelband") then
	{
		closeDialog 0;
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		[] spawn life_fnc_spikeStrip;
	};
if(_Item == "D41_Sprengladung") then
	{
		closeDialog 0;
		if	(
				(({_x == "D41_Sprengladung"} count magazines player) >= 2) &&
				(playerside == civilian) &&
				(((getPos player) distance [10394.704,9232.5898,-0.5]) < 10) &&
				(typeOf cursorTarget == "Land_Cargo_House_V3_F")
			)
			exitWith{[] spawn life_fnc_D41_KnastSpreng;};
		
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
if(_Item == "D41_Bolzenschneider") then
	{
		if( player distance D41_KnastZaun < 4 && (getDammage D41_Knastzaun == 0)) then
		{
			closeDialog 0;
			[] spawn life_fnc_D41_KnastZaun;
		}
		else
		{
			closeDialog 0;
			[cursorTarget] spawn life_fnc_boltcutter;
		};
	};
if(_Item == "D41_BombeWegMachtKit") then
	{
		closeDialog 0;
		[cursorTarget] spawn life_fnc_defuseKit;
	};
if(_Item == "D41_LagerkisteKlein") then
	{
		[_Item] call life_fnc_storageBox;
	};
if(_Item == "D41_LagerkisteGross") then
	{
		[_Item] call life_fnc_storageBox;
	};
if(_Item == "D41_LagerkisteLagerhaus") then
	{
		[_Item] call life_fnc_storageBoxHuge;
	};
if(_Item == "D41_Fahrzeugteile") then
	{
		closeDialog 0;
		player removeMagazine _Item;
		hint "WOHER HAST DU DAS???";
	};
if(_Item == "D41_Dietrich") then
	{
		closeDialog 0;
		[] spawn life_fnc_lockpick;
	};
if(_Item == "D41_Mauer") then
	{
		closeDialog 0;
		if(!isNull life_mauer) exitWith {hint localize "STR_ISTR_MauerSchonAktiv"};
		[] spawn life_fnc_mauer;
	};
if(_Item == "D41_Strahler") then
	{
		closeDialog 0;
		if(!isNull life_strahler) exitWith {hint localize "STR_ISTR_StrahlerSchonAktiv"};
		[] spawn life_fnc_strahler;
	};
if(_Item == "D41_Leitkegel") then
	{
		closeDialog 0;
		if(!isNull life_leitkegel) exitWith {hint localize "STR_ISTR_StrahlerSchonAktiv"};
		[] spawn life_fnc_Leitkegel;
	};
if(_Item == "D41_Schranke") then
	{
		closeDialog 0;
		if(!isNull life_Schranke) exitWith {hint localize "STR_ISTR_SchrankeSchonAktiv"};
		[] spawn life_fnc_Schranke;
	};
if(_Item == "D41_Blitzer") then
	{
		closeDialog 0;
		if(!isNull life_Blitzer) exitWith {hint localize "STR_ISTR_BlitzerSchonAktiv"};
		[] spawn life_fnc_Blitzer;
	};
if(_Item == "D41_FalscherAusweis") then
	{
		if (life_fakeid == 1) then 
		{
			closeDialog 0;
			player setVariable ["D41_FakeID",nil,true];	
			life_fakeid = 0;			
		}else {
			closeDialog 0;
			_FakeName = D41_Fake_ID_Array select floor random count D41_Fake_ID_Array;
			player setVariable ["D41_FakeID",_FakeName, true];
			life_fakeid = 1;
			D41_FakeName = _FakeName;
		};
		
	};

[] call life_fnc_hudUpdate;