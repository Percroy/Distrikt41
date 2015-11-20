//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_GangBaseMenu.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Blabla, Interface zum einzahlen von Items für die Gangbasen
// ausgeführt von Mapitem Addaction: " [[1, Player, """","""",""""],""D41_fnc_GangBaseManagement"",false,false] call life_fnc_MP; " (Mission.sqm)
//::::::::::::  ::::::::::::\\
private["_gang","_gangID","_Array","_ItemA","_Amount_ItemA_Gezahlt","_Amount_ItemA_Grund","_Amount_ItemA","_ItemB","_Amount_ItemB_Gezahlt","_Amount_ItemB_Grund","_Amount_ItemB","_ItemC","_Amount_ItemC_Gezahlt","_Amount_ItemC_Grund","_Amount_ItemC","_Amount_ItemG_Gezahlt","_Amount_ItemG_Grund","_Amount_ItemG""_display","_DiagOL","_DiagOR","_DiagUL","_DiagUR","_FrameItemA","_FrameItemB","_FrameItemC","_FrameItemG","_NameItemA","_AnzahlItemA","_NameItemB","_AnzahlItemB","_NameItemC","_AnzahlItemC","_NameItemG","_AnzahlItemG","_fnc_PosBerechnen","_Prozent","_pos0","_pos1","_pos","_time"];

	_gang = group player;
	_gangID =  _gang getVariable "gang_id";
	if(isNil "_gangID")exitWith{hint localize "STR_GNOTF_CreateGang"; systemchat localize "STR_GNOTF_CreateGang";};
	//SecCheck: Hat keine Base?!
	if(!(_gangID in D41_RentedGangBasesIDs))exitWith{};
	
	_Array = _this select 0;
	_Timer = _Array select 1;
	_Array = (_Array select 0) select 1;
	
	createdialog "Gangbase_Miete";
	waitUntil {!isNull (findDisplay 666)};
	
	_ItemA = (_Array select 0) select 0;
	if(_ItemA != "")then{ _ItemA = [_ItemA] call life_fnc_D41_GetMagName;}else{_ItemA = localize "STR_D41_BaseGUI_Nichts";};
	_Amount_ItemA_Gezahlt = _Array select 0 select 1;
	//if(_Amount_ItemA_Gezahlt == 0)then{_Amount_ItemA_Gezahlt = 1}; //Absolut KEINE Ahnung mehr, warum ich das drinne hatte oO
	_Amount_ItemA_Grund = _Array select 0 select 2;
	if(_Amount_ItemA_Grund == 0)then{_Amount_ItemA_Grund = 1};
	_Amount_ItemA = (_Amount_ItemA_Grund - _Amount_ItemA_Gezahlt);
	
	_ItemB = (_Array select 1) select 0;
	if(_ItemB != "")then{ _ItemB = [_ItemB] call life_fnc_D41_GetMagName;}else{_ItemB = localize "STR_D41_BaseGUI_Nichts";};
	_Amount_ItemB_Gezahlt = _Array select 1 select 1;
	//if(_Amount_ItemB_Gezahlt == 0)then{_Amount_ItemB_Gezahlt = 1}; //Absolut KEINE Ahnung mehr, warum ich das drinne hatte oO
	_Amount_ItemB_Grund = _Array select 1 select 2;
	if(_Amount_ItemB_Grund == 0)then{_Amount_ItemB_Grund = 1};
	_Amount_ItemB = (_Amount_ItemB_Grund - _Amount_ItemB_Gezahlt);
	
	_ItemC = (_Array select 2) select 0;
	if(_ItemC != "")then{ _ItemC = [_ItemC] call life_fnc_D41_GetMagName;}else{_ItemC = localize "STR_D41_BaseGUI_Nichts";};
	_Amount_ItemC_Gezahlt = _Array select 2 select 1;
	//if(_Amount_ItemC_Gezahlt == 0)then{_Amount_ItemC_Gezahlt = 1}; //Absolut KEINE Ahnung mehr, warum ich das drinne hatte oO
	_Amount_ItemC_Grund = _Array select 2 select 2;
	if(_Amount_ItemC_Grund == 0)then{_Amount_ItemC_Grund = 1};
	_Amount_ItemC = (_Amount_ItemC_Grund - _Amount_ItemC_Gezahlt);
	
	_Amount_ItemG_Gezahlt = _Array select 3;
	//if(_Amount_ItemG_Gezahlt == 0)then{_Amount_ItemG_Gezahlt = 1}; //Absolut KEINE Ahnung mehr, warum ich das drinne hatte oO
	_Amount_ItemG_Grund = _Array select 4;
	if(_Amount_ItemG_Grund == 0)then{_Amount_ItemG_Grund = 1};
	_Amount_ItemG = (_Amount_ItemG_Grund - _Amount_ItemG_Gezahlt);
	
	//Zwischenspeicher fürs "Items einbuchen"
	D41_BaseItemArray = [(_Array select 0) select 0, (_Array select 1) select 0, (_Array select 2) select 0];
	
	//Diagramm
	#define Btn1 1201
	#define Btn2 1202
	#define Btn3 1203
	#define Btn4 1204
	#define Btn5 1805
	#define Btn6 1806
	#define Btn7 1807
	#define Btn8 1808
	#define AnzahlItemA 1009
	#define AnzahlItemB 1010
	#define AnzahlItemC 1011
	#define AnzahlItemG 1012
	#define NameItemA 1001
	#define NameItemB 1002
	#define NameItemC 1003
	#define NameItemG 1004
	#define AnzeigeTimer 1006
	#define FrameTimer 1803
	
	
	disableSerialization;
	
	_display = findDisplay 666;
	_DiagOL = _display displayCtrl Btn1;
	_DiagOR = _display displayCtrl Btn2;
	_DiagUL = _display displayCtrl Btn3;
	_DiagUR = _display displayCtrl Btn4;
	_FrameItemA = _display displayCtrl Btn5;
	_FrameItemB = _display displayCtrl Btn6;
	_FrameItemC = _display displayCtrl Btn7;
	_FrameItemG = _display displayCtrl Btn8;
	
	_NameItemA = _display displayCtrl NameItemA;
	_AnzahlItemA = _display displayCtrl AnzahlItemA;
	_NameItemB = _display displayCtrl NameItemB;
	_AnzahlItemB = _display displayCtrl AnzahlItemB;
	_NameItemC = _display displayCtrl NameItemC;
	_AnzahlItemC = _display displayCtrl AnzahlItemC;
	_NameItemG = _display displayCtrl NameItemG;
	_AnzahlItemG = _display displayCtrl AnzahlItemG;
	
	_AnzeigeTimer = _display displayCtrl AnzeigeTimer;
	_FrameTimer = _display displayCtrl FrameTimer;
	
	_fnc_PosBerechnen =
	{
		_Prozent = (_this select 0);
		_pos0 = (0.287 - ((0.237 / 100) * _Prozent));
		_pos1 = (0.407 - ((0.307 / 100) * _Prozent));
		_pos = ctrlPosition (_this select 1);
		[_pos0, _pos1, (((_pos select 2)/100)*_Prozent),(((_pos select 3)/100)*_Prozent)]
	};
	
	
	_Prozent = round(((_Amount_ItemA_Grund - _Amount_ItemA ) / _Amount_ItemA_Grund)*100);
	_pos = [_Prozent, _DiagOL] call _fnc_PosBerechnen;
	_DiagOL ctrlSetPosition _pos;
	_time = ((100 - _Prozent)/40);
	_DiagOL ctrlCommit _time;
	_NameItemA ctrlSetText _ItemA;
	_ItemA = format [localize "STR_D41_BaseGUI_ItemNoetig",_ItemA];
	_FrameItemA ctrlSetText _ItemA;
	_AnzahlItemA ctrlSetText ([_Amount_ItemA] call life_fnc_numberText);
	
	_Prozent = round(((_Amount_ItemB_Grund - _Amount_ItemB ) / _Amount_ItemB_Grund)*100);
	_pos = [_Prozent, _DiagOR] call _fnc_PosBerechnen;
	_DiagOR ctrlSetPosition _pos;
	_time = ((100 - _Prozent)/40);
	_DiagOR ctrlCommit _time;
	_NameItemB ctrlSetText _ItemB;
	_ItemB = format [localize "STR_D41_BaseGUI_ItemNoetig",_ItemB];
	_FrameItemB ctrlSetText _ItemB;
	_AnzahlItemB ctrlSetText ([_Amount_ItemB] call life_fnc_numberText);
	
	_Prozent = round(((_Amount_ItemC_Grund - _Amount_ItemC ) / _Amount_ItemC_Grund)*100);
	_pos = [_Prozent, _DiagUL] call _fnc_PosBerechnen;
	_DiagUL ctrlSetPosition _pos;
	_time = ((100 - _Prozent)/40);
	_DiagUL ctrlCommit _time;
	_NameItemC ctrlSetText _ItemC;
	_ItemC = format [localize "STR_D41_BaseGUI_ItemNoetig",_ItemC];
	_FrameItemC ctrlSetText _ItemC;
	_AnzahlItemC ctrlSetText ([_Amount_ItemC] call life_fnc_numberText);
	
	_Prozent = round(((_Amount_ItemG_Grund - _Amount_ItemG ) / _Amount_ItemG_Grund)*100);
	_pos = [_Prozent, _DiagUR] call _fnc_PosBerechnen;
	_DiagUR ctrlSetPosition _pos;
	_time = ((100 - _Prozent)/40);
	_DiagUR ctrlCommit _time;
	_FrameItemG ctrlSetText localize "STR_D41_BaseGUI_GeldNoetig";
	_AnzahlItemG ctrlSetText ([_Amount_ItemG] call life_fnc_numberText);
	
	// Restliche Mietzeit
	_Tage = 0;
	_Stunden = 0;
	while{true}do{if(_Timer >= 24)then{ _Tage = _Tage + 1; _Timer = _Timer -24; }; if(_Timer < 24)exitWith{_Stunden = _Timer;};};
	_FrameTimer ctrlSetText localize "STR_D41_BaseGUI_MietZeitUSchrift";
	_Text = format [localize "STR_D41_BaseGUI_MietZeitAnzeige", _Tage, _Stunden];
	_AnzeigeTimer ctrlSetText _Text;
	
	