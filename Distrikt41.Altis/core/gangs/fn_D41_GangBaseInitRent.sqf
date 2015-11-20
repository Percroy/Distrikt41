//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_GangBaseInitRent.sqf
//	Author: Distrikt41 - Dscha
//	
//	Beschreibung: Führt das erste anmieten einer Base aus.
//Bsp:	["Neutral","license_civ_base03"] spawn life_fnc_D41_GangBaseInitRent;
//::::::::::::  ::::::::::::\\
private["_type","_Lizenz","_gang","_gangID","_gangBank","_WillBase","_Item","_Amount"];
	diag_log format ["::::::::: fn_D41_GangBaseInitRent _this: %1", _this];
	_type = (_this select 3) select 0;
	_Lizenz = (_this select 3) select 1;
	
	_gang = group player;
	_gangID = _gang getVariable "gang_id";
	if(isNil "_gangID")exitWith{hint localize "STR_GNOTF_CreateGang"; systemchat localize "STR_GNOTF_CreateGang";};
	
	//Check: Hat bereits Base?!
	if(_gangID in D41_RentedGangBasesIDs)exitWith{hint "Hat bereits base"};
	if(_Lizenz in D41_RentedGangBasesLiz)exitWith{hint "Base bereits vergeben"};	
	
	_GangKarma = _gang getVariable "gang_Karma";
	if(!isNil "_GangKarma")then{_GangKarma = call compile format["%1", _GangKarma];};
	if(isNil "_GangKarma")then{_GangKarma = life_D41_Karma};
	
	//Base01+02 = Rebel || Base03+04 = Neutral || Base05+06 = Hero
	if((_Lizenz in ["license_civ_base01","license_civ_base02"]) && _GangKarma > -6000)exitWith{hint format [localize "STR_D41_NichtGenugKarma", -6000]; systemchat format [localize "STR_D41_NichtGenugKarma", -6000];};
	if((_Lizenz in ["license_civ_base03","license_civ_base04"]) && (_GangKarma < -6000 OR _GangKarma > 6000))exitWith{hint format [localize "STR_D41_NichtGenugKarma", "-6000/+6000"]; systemchat format [localize "STR_D41_NichtGenugKarma", -6000];};
	if((_Lizenz in ["license_civ_base05","license_civ_base06"]) && _GangKarma < 6000)exitWith{hint format [localize "STR_D41_NichtGenugKarma", 6000]; systemchat format [localize "STR_D41_NichtGenugKarma", 6000];};
	
	//Check: Genug Geld auf GangKonto?
	_gangBank = _gang getVariable "gang_bank";
	if(_gangBank < 6000000)exitWith{hint format ["Deine Gang hat nicht genug Geld auf dem Konto.\n\nDerzeit:\n%1/6,000,000",[_gangBank] call life_fnc_numberText]};
	
	_WillBase =
	[
		format[localize "STR_D41_BaseAnmietenFrage",[_Lizenz] call life_fnc_varToStr],
		format[localize "STR_D41_BaseAnmietenFrageStatus",[_Lizenz] call life_fnc_varToStr],
		localize "STR_D41_Rent",
		localize "STR_Global_Cancel"
	] call BIS_fnc_guiMessage;
	
	//Na dann, Initialkosten bezahlen, neue Werte angeben und dem Anmietenden die Lizenz geben.
	if(!(_gangID in D41_RentedGangBasesIDs) && _WillBase)then
	{
		_Item = "Geld";
		_Amount = 6000000;
		_gang setVariable["gang_bank",(_gangBank - _Amount),true];
		[[1,group player],"TON_fnc_updateGang",false,false] call life_fnc_MP;
		missionNamespace setVariable[_Lizenz,true];
		[[2, Player, _Item, _Amount,_Type,true],"D41_fnc_GangBaseManagement",false,false] call life_fnc_MP;
		[[_gangID, _Lizenz],"D41_fnc_GangBaseVarUpdate",false,false] call life_fnc_MP;
		if((player distance (getMarkerPos "Base_marker_1")) < 100)	then { "Base_marker_1" setMarkerColor "ColorRed"; "Base_marker_1" setMarkerText format[localize "STR_D41_Gang_Base",(group player) getVariable "gang_name"];};
		if((player distance (getMarkerPos "Base_marker_2")) < 100)	then { "Base_marker_2" setMarkerColor "ColorRed"; "Base_marker_2" setMarkerText format[localize "STR_D41_Gang_Base",(group player) getVariable "gang_name"];};
		if((player distance (getMarkerPos "Base_marker_3")) < 100)	then { "Base_marker_3" setMarkerColor "ColorOrange"; "Base_marker_3" setMarkerText format[localize "STR_D41_Gang_Base",(group player) getVariable "gang_name"];};
		if((player distance (getMarkerPos "Base_marker_4")) < 100)	then { "Base_marker_4" setMarkerColor "ColorOrange"; "Base_marker_4" setMarkerText format[localize "STR_D41_Gang_Base",(group player) getVariable "gang_name"];};
		if((player distance (getMarkerPos "Base_marker_5")) < 100)	then { "Base_marker_5" setMarkerColor "ColorBlue"; "Base_marker_5" setMarkerText format[localize "STR_D41_Gang_Base",(group player) getVariable "gang_name"];};
		if((player distance (getMarkerPos "Base_marker_6")) < 100)	then { "Base_marker_6" setMarkerColor "ColorBlue"; "Base_marker_6" setMarkerText format[localize "STR_D41_Gang_Base",(group player) getVariable "gang_name"];};
	};