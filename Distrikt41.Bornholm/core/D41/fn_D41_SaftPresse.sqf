//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_SaftPresse.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Saftpresse wird gestartet.
//::::::::::::  ::::::::::::\\

private["_Presse","_Cargo","_NotAllowedItems","_CounterA","_CounterP"];

	_Presse = nearestObjects[getPos player,["D41_Saftpresse_F"],4];
	if(count(_Presse) == 0)exitWith{hint "Zu weit weg, geh näher ran";};
	_Presse = _Presse select 0;
	
	if(life_action_gather)exitWith{hint "Du machst bereits etwas."};
	if((_Presse animationPhase "PressePressen") != 0)exitWith{hint "Presse ist bereits in Betrieb."};
	
	_Cargo = magazineCargo _Presse;
	_NotAllowedItems = false;
	if(count(_Cargo) == 0)exitWith{hint "Leerlauf??"};
	{
		if(!(_x in ["D41_Apfel","D41_Pfirsich"]))exitWith{_NotAllowedItems = true};
	}forEach _Cargo;
	
	if(_NotAllowedItems)exitWith{hint "Falsche Items in Presse"};
	
	life_action_gather = true;
	//Runterfahren
	_Presse animate ["PressePressen", 1];
	clearMagazineCargoGlobal _Presse;
	waitUntil{sleep 0.25; (_Presse animationPhase "PressePressen") == 1};
	
	//Hochfahren
	_Presse animate ["PressePressen", 0];
	waitUntil{sleep 0.25; (_Presse animationPhase "PressePressen") == 0};
	
	_CounterA = 0;
	_CounterP = 0;
	{
		if(_x == "D41_Apfel")then{_CounterA = _CounterA + 1;};
		if(_x == "D41_Pfirsich")then{_CounterP = _CounterP + 1;};
		if(_CounterA == 3)then{_CounterA = 0; _Presse addMagazineCargoGlobal ["D41_Apfelsaft", 1];};
		if(_CounterP == 3)then{_CounterP = 0; _Presse addMagazineCargoGlobal ["D41_Pfirsichsaft", 1];};
	}forEach _Cargo;
	
	//Resteausgabe
	if(_CounterA != 0)then{_Presse addMagazineCargoGlobal ["D41_Apfel", 1];};
	if(_CounterP != 0)then{_Presse addMagazineCargoGlobal ["D41_Pfirsich", 1];};
	life_action_gather = false;