//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_GangBaseItemsEinzahlen.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Zum einzahlen von Items für die Gangbasen
//::::::::::::  ::::::::::::\\
private["_gang","_gangID","_Modus","_Type","_exit","_Kiste","_KistenInv","_KistenInvNames","_KistenInvAmount","_KistenInvNamesRest","_KistenInvAmountRest","_Item","_Amount"];

	_gang = group player;
	
	_gangID =  _gang getVariable "gang_id";
	if(isNil "_gangID")exitWith{hint localize "STR_GNOTF_CreateGang"; systemchat localize "STR_GNOTF_CreateGang";};
	//SecCheck: Hat keine Base?!
	if(!(_gangID in D41_RentedGangBasesIDs))exitWith{};
	
	_Modus = 2;
	_Type = "";
	
	_exit = false;
	switch(true)do
	{
		case (license_civ_base01 OR license_civ_base02): {_Type = "Bandit"};
		case (license_civ_base03 OR license_civ_base04): {_Type = "Neutral"};
		case (license_civ_base05 OR license_civ_base06): {_Type = "Hero"};
		default{_exit = true;};
	};
	if(_exit)exitWith{diag_log "::::::::::: FEHLER BEIM EINZAHLEN DER GANGKOSTEN! KEINE LIZENZ VORHANDEN!"};
	
	_Kiste = ObjNull;
	switch(true)do
	{
		case((player distance Base_01_Miete) < 10): {_Kiste = Base_01_Miete;};
		case((player distance Base_02_Miete) < 10): {_Kiste = Base_02_Miete;};
		case((player distance Base_03_Miete) < 10): {_Kiste = Base_03_Miete;};
		case((player distance Base_04_Miete) < 10): {_Kiste = Base_04_Miete;};
		case((player distance Base_05_Miete) < 10): {_Kiste = Base_05_Miete;};
		case((player distance Base_06_Miete) < 10): {_Kiste = Base_06_Miete;};
		default{_Kiste = ObjNull; systemchat "ObjNull";};
	};
	if(IsNull _Kiste)exitWith{hint "Fehler: Keine Kiste gefunden!"};
	closedialog 0; 
	
	_KistenInv = getMagazineCargo _Kiste;
	if(count(_KistenInv select 0) < 1)exitWith{hint "Nix inner Kiste"};
	clearMagazineCargoGlobal _Kiste;
	_KistenInvNames = _KistenInv select 0;
	_KistenInvAmount = _KistenInv select 1;
	_KistenInvNamesRest = [];
	_KistenInvAmountRest = [];
	
	_Item = "";
	_Amount = 0;
	{
		if(_x in D41_BaseItemArray)then
		{
			_Item = _x;
			_Amount = _KistenInvAmount select _forEachIndex;
			
			[[_Modus, Player, _Item, _Amount,_Type],"D41_fnc_GangBaseManagement",false,false] call life_fnc_MP;
			sleep 1;
			systemchat format ["%1x %2 eingebucht",_Amount, [_Item] call life_fnc_D41_GetMagName];
		}
		else
		{
			_KistenInvNamesRest pushback _x;
			_KistenInvAmountRest pushback (_KistenInvAmount select _forEachIndex);
		};
	}forEach _KistenInvNames;
	
	{
		_Kiste addMagazineCargoGlobal [_x, (_KistenInvAmountRest select _ForEachIndex)];
	}forEach _KistenInvNamesRest;
	
	
	
	
	
	