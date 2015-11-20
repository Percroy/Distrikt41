//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_MedicSys.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Basic Medic System
//::::::::::::  ::::::::::::\\

private["_display","_Pic1","_Pic2","_Pic4","_Pic5","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_local","_Mod","_DmgKopf","_DmgKopfMod","_TextKopf","_DmgHand","_DmgHandMod","_TextHand","_DmgTorso","_DmgTorsoMod","_TextTorso","_DmgBein","_TextBein","_DmgBeinMod","_Part","_DmgMod","_Name"];

	if(life_action_inUse)exitWith{hint localize "STR_D41_doing_something"};
	createDialog "D41_Medic_Sys";
	
	#define Btn1 1005 //D41_Button_Kopf
	#define Inf1 1008 //D41_Infotext_Kopf
	#define Pic1 1200 //D41_Med_Kopf
	
	#define Btn2 1003 //D41_Button_ArmL
	#define Btn3 1004 //D41_Button_ArmR
	#define Inf23 1010 //D41_Infotext_Arme
	#define Pic2 1202 //D41_Med_Arme
	
	#define Btn4 1006 //D41_Button_Torso
	#define Inf4 1012 //D41_Infotext_Torso
	#define Pic4 1201 //D41_Med_Torso
	
	#define Btn5 1007 //D41_Button_Beine
	#define Inf5 1014 //D41_Infotext_Beine
	#define Pic5 1203 //D41_Med_Beine
	
	#define Inf6 1015 //Anzeigename
	
	
	_DmgKopf = 0;
	_DmgKopfMod = 0;
	_DmgHand = 0;
	_DmgHandMod = 0;
	_DmgTorso = 0;
	_DmgTorsoMod = 0;
	_DmgBein = 0;
	_DmgBeinMod = 0;
	
	CurTarget = cursorTarget;
	_Mod = 0.25;
	IsMedic = false;
	if(playerSide in [independent])then{IsMedic = true; D41_MedKitUsed = 0;};
	
	_local = true;
	if(!(isNull CurTarget) && (alive CurTarget) && (CurTarget isKindOf "Man") && ((player distance CurTarget) < 3) && (isPlayer CurTarget))then{_local = false;};
	if(_local)then
	{
		_DmgKopf = player getHitPointDamage "HitHead"; _DmgKopfMod = _DmgKopf - _Mod;					if(IsMedic)then{ _DmgKopfMod = 0;}else{if(_DmgKopfMod < 0.25)then{_DmgKopfMod = 0.25;};};
		_DmgHand = player getHitPointDamage "HitHands"; _DmgHandMod = _DmgHand - _Mod;					if(IsMedic)then{ _DmgHandMod = 0;}else{if(_DmgHandMod < 0.25)then{_DmgHandMod = 0.25;};};
		_DmgTorso = player getHitPointDamage "HitBody"; _DmgTorsoMod = _DmgTorso - _Mod;				if(IsMedic)then{ _DmgTorsoMod = 0;}else{if(_DmgTorsoMod < 0.25)then{_DmgTorsoMod = 0.25;};};
		_DmgBein = player getHitPointDamage "HitLegs"; _DmgBeinMod = _DmgBein - _Mod;					if(IsMedic)then{ _DmgBeinMod = 0;}else{if(_DmgBeinMod < 0.25)then{_DmgBeinMod = 0.25;};};
	}
	else
	{
		_DmgKopf = CurTarget getHitPointDamage "HitHead"; _DmgKopfMod = _DmgKopf - _Mod;				if(IsMedic)then{ _DmgKopfMod = 0;}else{if(_DmgKopfMod < 0.25)then{_DmgKopfMod = 0.25;};};
		_DmgHand = CurTarget getHitPointDamage "HitHands"; _DmgHandMod = _DmgHand - _Mod;				if(IsMedic)then{ _DmgHandMod = 0;}else{if(_DmgHandMod < 0.25)then{_DmgHandMod = 0.25;};};
		_DmgTorso = CurTarget getHitPointDamage "HitBody"; _DmgTorsoMod = _DmgTorso - _Mod;				if(IsMedic)then{ _DmgTorsoMod = 0;}else{if(_DmgTorsoMod < 0.25)then{_DmgTorsoMod = 0.25;};};
		_DmgBein = CurTarget getHitPointDamage "HitLegs"; _DmgBeinMod = _DmgBein - _Mod;				if(IsMedic)then{ _DmgBeinMod = 0;}else{if(_DmgBeinMod < 0.25)then{_DmgBeinMod = 0.25;};};
	};
	
	DmgKopfMod = _DmgKopfMod;
	DmgHandMod = _DmgHandMod;
	DmgTorsoMod = _DmgTorsoMod;
	DmgBeinMod = _DmgBeinMod;
	
	disableSerialization;
	waitUntil {!isNull (findDisplay 9999)};
	_display = findDisplay 9999;
	
	//---------------------
	//Kopf
	_Btn1 = _display displayCtrl Btn1;
	_Pic1 = _display displayCtrl Pic1;
	if((_DmgKopf <= 0.25) && !IsMedic)then
		{
			_Btn1 ctrlShow false;
			if(_DmgKopf > 0.2)exitWith{_Pic1 ctrlSetTextColor [0.5,0.5,0,1];};
			if(_DmgKopf > 0  )exitWith{_Pic1 ctrlSetTextColor [0,1,0,1];};
			if(_DmgKopf == 0 )exitWith{_Pic1 ctrlSetTextColor [1,1,1,1];};
		}
		else
		{
			if(_local)then{_Btn1 buttonSetAction "closeDialog 0; if(!('D41_MediKit' in (magazines player)))exitWith{hint localize 'STR_D41_NoFAK'}; ['HitHead',DmgKopfMod] spawn life_fnc_D41_MedicProgressBar;";}
			else
			{_Btn1 buttonSetAction "closeDialog 0; if(!('D41_MediKit' in (magazines player)))exitWith{hint localize 'STR_D41_NoFAK'}; ['HitHead',0.25,CurTarget] spawn life_fnc_D41_MedicProgressBarRemote";};
			
			if(_DmgKopf > 0.8)exitWith{_Pic1 ctrlSetTextColor [1,0,0,1];};
			if(_DmgKopf > 0.6)exitWith{_Pic1 ctrlSetTextColor [0.5,0,0,1];};
			if(_DmgKopf > 0.4)exitWith{_Pic1 ctrlSetTextColor [1,1,0,1];};
			if(_DmgKopf > 0.2)exitWith{_Pic1 ctrlSetTextColor [0.5,0.5,0,1];};
			if(_DmgKopf > 0  )exitWith{_Pic1 ctrlSetTextColor [0,1,0,1];};
		};
	_TextKopf = format["%1%2",(_DmgKopf*100),"%"];
	ctrlSetText [Inf1,_TextKopf];
	//---------------------
	
	//---------------------
	//Arme
	_Btn2 = _display displayCtrl Btn2;
	_Btn3 = _display displayCtrl Btn3;
	_Pic2 = _display displayCtrl Pic2;
	if((_DmgHand <= 0.25) && !isMedic)then
		{
			_Btn2 ctrlShow false;
			_Btn3 ctrlShow false;
			if(_DmgHand > 0.2)exitWith{_Pic2 ctrlSetTextColor [0.5,0.5,0,1];};
			if(_DmgHand > 0  )exitWith{_Pic2 ctrlSetTextColor [0,1,0,1];};
			if(_DmgHand == 0 )exitWith{_Pic2 ctrlSetTextColor [1,1,1,1];};
		}
		else
		{
			if(_local)then
			{
				_Btn2 buttonSetAction "closeDialog 0; if(!('D41_MediKit' in (magazines player)))exitWith{hint localize 'STR_D41_NoFAK'}; ['HitHands',DmgHandMod] spawn life_fnc_D41_MedicProgressBar;";
				_Btn3 buttonSetAction "closeDialog 0; if(!('D41_MediKit' in (magazines player)))exitWith{hint localize 'STR_D41_NoFAK'}; ['HitHands',DmgHandMod] spawn life_fnc_D41_MedicProgressBar;";
			}
			else
			{
				_Btn2 buttonSetAction "closeDialog 0; if(!('D41_MediKit' in (magazines player)))exitWith{hint localize 'STR_D41_NoFAK'}; ['HitHands',0.25,CurTarget] spawn life_fnc_D41_MedicProgressBarRemote";
				_Btn3 buttonSetAction "closeDialog 0; if(!('D41_MediKit' in (magazines player)))exitWith{hint localize 'STR_D41_NoFAK'}; ['HitHands',0.25,CurTarget] spawn life_fnc_D41_MedicProgressBarRemote";
			};
			if(_DmgHand > 0.8)exitWith{_Pic2 ctrlSetTextColor [1,0,0,1];};
			if(_DmgHand > 0.6)exitWith{_Pic2 ctrlSetTextColor [0.5,0,0,1];};
			if(_DmgHand > 0.4)exitWith{_Pic2 ctrlSetTextColor [1,1,0,1];};
			if(_DmgHand > 0.2)exitWith{_Pic2 ctrlSetTextColor [0.5,0.5,0,1];};
			if(_DmgHand > 0  )exitWith{_Pic2 ctrlSetTextColor [0,1,0,1];};
		};
	_TextHand = format["%1%2",(_DmgHand*100),"%"];
	ctrlSetText [Inf23,_TextHand];
	//---------------------
	
	//---------------------
	//Torso
	_Btn4 = _display displayCtrl Btn4;
	_Pic4 = _display displayCtrl Pic4;
	if((_DmgTorso <= 0.25) && !isMedic)then
		{
			_Btn4 ctrlShow false;
			if(_DmgTorso > 0.2)exitWith{_Pic4 ctrlSetTextColor [0.5,0.5,0,1];};
			if(_DmgTorso > 0  )exitWith{_Pic4 ctrlSetTextColor [0,1,0,1];};
			if(_DmgTorso == 0 )exitWith{_Pic4 ctrlSetTextColor [1,1,1,1];};
		}
		else
		{
			if(_local)then{_Btn4 buttonSetAction "closeDialog 0; if(!('D41_MediKit' in (magazines player)))exitWith{hint localize 'STR_D41_NoFAK'}; ['HitBody',DmgTorsoMod] spawn life_fnc_D41_MedicProgressBar;"}
			else
			{_Btn4 buttonSetAction "closeDialog 0; if(!('D41_MediKit' in (magazines player)))exitWith{hint localize 'STR_D41_NoFAK'}; ['HitBody',0.25,CurTarget] spawn life_fnc_D41_MedicProgressBarRemote";};
			if(_DmgTorso > 0.8)exitWith{_Pic4 ctrlSetTextColor [1,0,0,1];};
			if(_DmgTorso > 0.6)exitWith{_Pic4 ctrlSetTextColor [0.5,0,0,1];};
			if(_DmgTorso > 0.4)exitWith{_Pic4 ctrlSetTextColor [1,1,0,1];};
			if(_DmgTorso > 0.2)exitWith{_Pic4 ctrlSetTextColor [0.5,0.5,0,1];};
			if(_DmgTorso > 0  )exitWith{_Pic4 ctrlSetTextColor [0,1,0,1];};
		};
	_TextTorso = format["%1%2",(_DmgTorso*100),"%"];
	ctrlSetText [Inf4,_TextTorso];
	//---------------------
	
	//---------------------
	//Beine
	_Btn5 = _display displayCtrl Btn5;
	_Pic5 = _display displayCtrl Pic5;
	if((_DmgBein <= 0.25) && !isMedic)then
		{
			_Btn5 ctrlShow false;
			if(_DmgBein > 0.2)exitWith{_Pic5 ctrlSetTextColor [0.5,0.5,0,1];};
			if(_DmgBein > 0  )exitWith{_Pic5 ctrlSetTextColor [0,1,0,1];};
			if(_DmgBein == 0 )exitWith{_Pic5 ctrlSetTextColor [1,1,1,1];};
		}
		else
		{
			if(_local)then{_Btn5 buttonSetAction "closeDialog 0; if(!('D41_MediKit' in (magazines player)))exitWith{hint 'No MedKit'}; ['HitLegs',DmgBeinMod] spawn life_fnc_D41_MedicProgressBar;";}
			else
			{_Btn5 buttonSetAction "closeDialog 0; if(!('D41_MediKit' in (magazines player)))exitWith{hint 'No MedKit'}; ['HitLegs',0.25,CurTarget] spawn life_fnc_D41_MedicProgressBarRemote";};
			if(_DmgBein > 0.8)exitWith{_Pic5 ctrlSetTextColor [1,0,0,1];};
			if(_DmgBein > 0.6)exitWith{_Pic5 ctrlSetTextColor [0.5,0,0,1];};
			if(_DmgBein > 0.4)exitWith{_Pic5 ctrlSetTextColor [1,1,0,1];};
			if(_DmgBein > 0.2)exitWith{_Pic5 ctrlSetTextColor [0.5,0.5,0,1];};
			if(_DmgBein > 0  )exitWith{_Pic5 ctrlSetTextColor [0,1,0,1];};
		};
	_TextBein = format["%1%2",(_DmgBein*100),"%"];
	ctrlSetText [Inf5,_TextBein];
	//---------------------
	
	//---------------------
	//Spielername
	_life_maskiert = false;
	if ((goggles CurTarget) in D41_goggles_Array) then {_life_maskiert = true};
	if ((uniform CurTarget) in D41_uniform_Array) then {_life_maskiert = true};
	if ((headgear CurTarget) in D41_headgear_Array) then {_life_maskiert = true};
	if ((hmd CurTarget) in D41_hmd_Array) then {_life_maskiert = true};
	_Name = "Nobody";
	if(_local)then
		{_Name = format ["Name: %1",player getVariable["realname",name player]];}
		else
		{
			if(_life_maskiert)then
				{_Name = format ["Name: %1",localize "STR_D41_MaskiertePerson"];}
				else
				{
					_RemoteName = name CurTarget;
					_Name = format ["Name: %1",_RemoteName];
				};
		};
	ctrlSetText [Inf6,_Name];
	//---------------------