//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_FischVerarbeiter.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Verarbeitet Fische aus der "Lagerkiste" heraus.
// Mission.sqm Eintrag:
// this addAction['Fisch verarbeiten',{[this] spawn life_fnc_D41_FischVerarbeiter},'',0,false, false,'','(license_civ_Dosenfisch) && speed player < 1 && speed player > -1 && !D41_WandeltUm'];
//::::::::::::  ::::::::::::\\

private["_Crate","_Input","_DFCount","_ExitCheck","_ProdAmnt","_AmntNeeded","_SaltNeeded","_D41_Tunfisch_Cnt","_D41_Katzenhai_Cnt","_D41_Mullet_Cnt","_D41_Mackrele_Cnt","_D41_Salema_Cnt","_D41_Ornate_Cnt","_D41_Salz_Cnt","_fnc_ProcMsg","_Type","_DFProd","_Added","_Restart"];

	_Crate = _this select 0;
	D41_WandeltUm = true;
	
	sleep (1+random(2));
	_Input = magazineCargo _Crate;
	clearMagazineCargoGlobal _Crate;
	
	if(count(_Input) == 0)exitWith{D41_WandeltUm = false;};
	_DFCount = {_x == "D41_Dosenfisch"} count _Input;
	if(_DFCount != 0)exitWith{D41_WandeltUm = false;};
	
	_ExitCheck = 0;
	_ProdAmnt = 0;
	_AmntNeeded = 0;
	_SaltNeeded = 0;
	_D41_Tunfisch_Cnt = {_x == "D41_Tunfisch"} count _Input;
	_D41_Katzenhai_Cnt = {_x == "D41_Katzenhai"} count _Input;
	_D41_Mullet_Cnt = {_x == "D41_Mullet"} count _Input;
	_D41_Mackrele_Cnt = {_x == "D41_Mackrele"} count _Input;
	_D41_Salema_Cnt = {_x == "D41_Salema"} count _Input;
	_D41_Ornate_Cnt = {_x == "D41_Ornate"} count _Input;
	_D41_Salz_Cnt = {_x == "D41_Salz"} count _Input;
	
	_fnc_ProcMsg =
	{
		_Type = _this select 0;
		while{true}do
		{
			sleep 1;
			_DFProd = _DFProd - 1;
			_Crate addMagazineCargoGlobal ["D41_Dosenfisch", 1];
			_ProdAmnt = _ProdAmnt + 1;
			hintsilent format [localize "STR_D41_FischVerarbeiten",([_Type] call life_fnc_D41_GetMagName), _ProdAmnt, (["D41_Dosenfisch"] call life_fnc_D41_GetMagName)];
			if(_DFProd <= 0)exitWith{_D41_Salz_Cnt = _D41_Salz_Cnt - _SaltNeeded; _Added = true;};
		};
	};
	
	while{true}do
	{
		_ExitCheck = true;
		_Restart = true;
		if(_Restart && _D41_Tunfisch_Cnt >= 2 && _D41_Salz_Cnt >= 5)	then{_Type = "D41_Tunfisch";	_AmntNeeded = 2; _SaltNeeded = 5; _DFProd = 4; _D41_Tunfisch_Cnt = _D41_Tunfisch_Cnt - _AmntNeeded;		_Added = false; [_Type] call _fnc_ProcMsg; _ExitCheck = false; _Restart = false; waitUntil{_Added};};
		if(_Restart && _D41_Katzenhai_Cnt >= 3 && _D41_Salz_Cnt >= 5)	then{_Type = "D41_Katzenhai";	_AmntNeeded = 3; _SaltNeeded = 5; _DFProd = 4; _D41_Katzenhai_Cnt = _D41_Katzenhai_Cnt - _AmntNeeded;	_Added = false; [_Type] call _fnc_ProcMsg; _ExitCheck = false; _Restart = false; waitUntil{_Added};};
		if(_Restart && _D41_Mullet_Cnt >= 2 && _D41_Salz_Cnt >= 3)		then{_Type = "D41_Mullet";		_AmntNeeded = 2; _SaltNeeded = 3; _DFProd = 2; _D41_Mullet_Cnt = _D41_Mullet_Cnt - _AmntNeeded;			_Added = false; [_Type] call _fnc_ProcMsg; _ExitCheck = false; _Restart = false; waitUntil{_Added};};
		if(_Restart && _D41_Mackrele_Cnt >= 1 && _D41_Salz_Cnt >= 2)	then{_Type = "D41_Mackrele";	_AmntNeeded = 1; _SaltNeeded = 2; _DFProd = 1; _D41_Mackrele_Cnt = _D41_Mackrele_Cnt - _AmntNeeded; 	_Added = false; [_Type] call _fnc_ProcMsg; _ExitCheck = false; _Restart = false; waitUntil{_Added};};
		if(_Restart && _D41_Salema_Cnt >= 3 && _D41_Salz_Cnt >= 2)		then{_Type = "D41_Salema";		_AmntNeeded = 3; _SaltNeeded = 2; _DFProd = 1; _D41_Salema_Cnt = _D41_Salema_Cnt - _AmntNeeded;			_Added = false; [_Type] call _fnc_ProcMsg; _ExitCheck = false; _Restart = false; waitUntil{_Added};};
		if(_Restart && _D41_Ornate_Cnt >= 4 && _D41_Salz_Cnt >= 2)		then{_Type = "D41_Ornate";		_AmntNeeded = 4; _SaltNeeded = 2; _DFProd = 1; _D41_Ornate_Cnt = _D41_Ornate_Cnt - _AmntNeeded;			_Added = false; [_Type] call _fnc_ProcMsg; _ExitCheck = false; _Restart = false; waitUntil{_Added};};
		
		if(_ExitCheck)exitWith{hintsilent format [localize "STR_D41_FischFertigVerarbeitet", _ProdAmnt, (["D41_Dosenfisch"] call life_fnc_D41_GetMagName)];};
	};
	
	if(_D41_Ornate_Cnt > 0)then		{_Crate addMagazineCargoGlobal ["D41_Ornate", _D41_Ornate_Cnt];};
	if(_D41_Salema_Cnt > 0)then		{_Crate addMagazineCargoGlobal ["D41_Salema", _D41_Salema_Cnt];};
	if(_D41_Mackrele_Cnt > 0)then	{_Crate addMagazineCargoGlobal ["D41_Mackrele", _D41_Mackrele_Cnt];};
	if(_D41_Mullet_Cnt > 0)then		{_Crate addMagazineCargoGlobal ["D41_Mullet", _D41_Mullet_Cnt];};
	if(_D41_Katzenhai_Cnt > 0)then	{_Crate addMagazineCargoGlobal ["D41_Katzenhai", _D41_Katzenhai_Cnt];};
	if(_D41_Tunfisch_Cnt > 0)then	{_Crate addMagazineCargoGlobal ["D41_Tunfisch", _D41_Tunfisch_Cnt];};
	if(_D41_Salz_Cnt > 0)then		{_Crate addMagazineCargoGlobal ["D41_Salz", _D41_Salz_Cnt];};
	
	D41_WandeltUm = false;