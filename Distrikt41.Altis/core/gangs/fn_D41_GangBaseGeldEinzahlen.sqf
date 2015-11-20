//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_GangBaseMenu.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Zum einzahlen von Geld für die Gangbasen
//::::::::::::  ::::::::::::\\
private["_gang","_gangID","_GangGeld","_Modus","_Item","_Amount","_Type","_exit"];

	_gang = group player;
	
	_gangID =  _gang getVariable "gang_id";
	if(isNil "_gangID")exitWith{hint localize "STR_GNOTF_CreateGang"; systemchat localize "STR_GNOTF_CreateGang";};
	//SecCheck: Hat keine Base?!
	if(!(_gangID in D41_RentedGangBasesIDs))exitWith{};
	
	_GangGeld = _gang getVariable "gang_bank";
	if(!isNil "_GangGeld")then{_GangGeld = call compile format["%1", _GangGeld];};
	
	_Modus = 2;
	_Item = "Geld";
	_Amount = parseNumber(ctrlText 1400);
	
	//if(_Amount < 50000) exitWith {hint "Realy?\npff...\n\npff...\nnope...";}; //No Localize needed :D
	if(_Amount > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
	if(!([str(_Amount)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
	if(_Amount > _GangGeld)exitWith{hint localize "STR_GNOTF_GangBankMSGNotEnoughMoney"};
	closedialog 0; 
	
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
	_gang setVariable ["gang_bank", (_GangGeld - _Amount), true];
	[[1,group player],"TON_fnc_updateGang",false,false] call life_fnc_MP;
	[[_Modus, Player, _Item, _Amount,_Type],"D41_fnc_GangBaseManagement",false,false] call life_fnc_MP;
