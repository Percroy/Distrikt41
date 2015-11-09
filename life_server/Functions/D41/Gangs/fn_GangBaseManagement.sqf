//::::::::::::  ::::::::::::\\
//	Filename: life_server/Functions/D41/Gangs/fn_GangBaseManagement.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Gangbasen - Was soll wo eingetragen/aktualisiert werden? Aktualisieren des DB Eintrages über die benötigten Items zur Erweiterung der GangBasisMiete
//		_Modus = 2; //1 = Reiner Check der Daten || 2 = bezahlen
//		_Item = "D41_Oel";
//		_Amount = 12;
//		_Type = "Hero"; //"Hero", "Bandit", "Neutral"
//		[[_Modus, Player, _Item, _Amount,_Type],"D41_fnc_GangBaseManagement",false,false] call life_fnc_MP;
//		Bsp. DB Eintrag: [true,[["D41_Oel",5000,10000], ["D41_Kerosin",1000,50000], ["D41_Bruchstein",10000,20000], 123, 456]]
//::::::::::::  ::::::::::::\\
private["_mode","_Owner","_BaseCostItem","_BaseCostItemCount","_Type","_OwnerUID","_query","_queryResult","_GangID","_HatBase","_cnt","_UpdatedItemCache","_UpdatedItemsArray","_BasisKostenArray","_DBItems","_BaseTimer","_DBItemA","_DBItemAType","_DBItemACount","_DBItemACountBasis","_DBItemB","_DBItemBType","_DBItemBCount","_DBItemBCountBasis","_DBItemC","_DBItemCType","_DBItemCCount","_DBItemCCountBasis","_DBItemG","_DBItemGBasis"];

_mode = [_this,0,0,[0]] call BIS_fnc_param;
_Owner = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_BaseCostItem = _this select 2;
_BaseCostItemCount = _this select 3;
_Type = _this select 4;
_Init = [_this,5,false,[false]] call BIS_fnc_param;

if(_mode == 0)exitWith{diag_log "Fehler bei übertragung der Daten an GangBaseManagement - _mode = 0"};
if(isNull _Owner)exitWith{diag_log "Fehler bei übertragung der Daten an GangBaseManagement - _Owner = Nicht vorhanden"};


	//Gang ID abfragen
	_OwnerUID = getPlayerUID _Owner;
	_query = format["insertGang+1:%1","%" + _OwnerUID +"%"];
	//waitUntil{!DB_Async_Active};
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	_GangID = (_queryResult select 0) select 0;
	
	
	//DB Basiskosten abfragen
	_query = format["queryGangBaseCosts:%1",_GangID];
	//waitUntil{!DB_Async_Active};
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	
	_queryResult = _queryResult select 0;
	
	_HatBase = (_queryResult select 0) select 0;
	diag_log format ["Request? 1 = Request || 2 einbuchen = %1", _mode];
	diag_log format ["_BaseCostItemCount: %1", _BaseCostItemCount];
	diag_log format ["_BaseCostItem: %1", _BaseCostItem];
	diag_log format ["_HatBase: %1", _HatBase];
	if(!_HatBase && !_Init)exitWith{}; //SecCheck
	
	
	//Vorbereitung: Leere LokaleVariablen erzeugen:
	_cnt = 0;
	_UpdatedItemCache = [];
	_UpdatedItemsArray = [];
	_BasisKostenArray = [];
	//Vorbereitung: Ende
	
	
	if(_mode == 1)exitWith { [[_queryResult],"life_fnc_D41_GangBaseMenu",_Owner,false] call life_fnc_MP; }; //Dialog mit Base Infos wird auf Client ausgeführt (_Owner)
	
	diag_log format [":::::::::::: Mietkosten Basis: _queryResult select 1 = %1", (_queryResult select 1)];
	diag_log format [":::::::::::: Mietkosten Basis update: GangNr.: %1 -|- SpielerID: %2 -|- Item/Anzahl: [ %3 | %4 ]", _GangID, _OwnerUID, _BaseCostItem, _BaseCostItemCount];
	
	_DBItems = (_queryResult select 0) select 1;
	
	//
		_DBItemA = _DBItems select 0;
		_DBItemAType = _DBItemA select 0;
		_DBItemACount = _DBItemA select 1;
		_DBItemACountBasis = _DBItemA select 2;
		
		_DBItemB = _DBItems select 1;
		_DBItemBType = _DBItemB select 0;
		_DBItemBCount = _DBItemB select 1;
		_DBItemBCountBasis = _DBItemB select 2;
		
		_DBItemC = _DBItems select 2;
		_DBItemCType = _DBItemC select 0;
		_DBItemCCount = _DBItemC select 1;
		_DBItemCCountBasis = _DBItemC select 2;
		
		_DBItemG = _DBItems select 3;
		_DBItemGBasis = _DBItems select 4;
		
	//
	
		if(_BaseCostItem isEqualTo _DBItemAType)then	{_DBItemACount = _DBItemACount + _BaseCostItemCount;	if(_DBItemACount >= _DBItemACountBasis)	then{_DBItemACount = _DBItemACountBasis;};};
		if(_BaseCostItem isEqualTo _DBItemBType)then	{_DBItemBCount = _DBItemBCount + _BaseCostItemCount;	if(_DBItemBCount >= _DBItemBCountBasis)	then{_DBItemBCount = _DBItemBCountBasis;};};
		if(_BaseCostItem isEqualTo _DBItemCType)then	{_DBItemCCount = _DBItemCCount + _BaseCostItemCount;	if(_DBItemCCount >= _DBItemCCountBasis)	then{_DBItemCCount = _DBItemCCountBasis;};};
		if(_BaseCostItem isEqualTo "Geld")then			{_DBItemG = _DBItemG + _BaseCostItemCount; 				if(_DBItemG >= _DBItemGBasis)			then{_DBItemG = _DBItemGBasis;};};
		
		_BasisKostenArray pushback _HatBase;
		{
			_cnt = _cnt + 1;
			_UpdatedItemCache pushback _x;
			if(_cnt == 3)then{_UpdatedItemsArray pushback _UpdatedItemCache; _UpdatedItemCache = []; _cnt = 0;};
		}forEach [_DBItemAType, _DBItemACount, _DBItemACountBasis, _DBItemBType, _DBItemBCount, _DBItemBCountBasis, _DBItemCType, _DBItemCCount, _DBItemCCountBasis];
		_UpdatedItemsArray pushback _DBItemG;
		_UpdatedItemsArray pushback _DBItemGBasis;
		_BasisKostenArray pushback _UpdatedItemsArray;
		
		diag_log format [":::::::::::: Mietkosten Basis update PRE:  GangNr.: %1 -|- SpielerID: %2 -|- Array: %3", _GangID, _OwnerUID, _queryResult];
		diag_log format [":::::::::::: Mietkosten Basis update POST: GangNr.: %1 -|- SpielerID: %2 -|- Array: %3", _GangID, _OwnerUID, _BasisKostenArray];
		
		
		//Check ob Neu gesetzt werden muß
		if((_DBItemACount >= _DBItemACountBasis) && (_DBItemBCount >= _DBItemBCountBasis) && (_DBItemCCount >= _DBItemCCountBasis) && (_DBItemG >= _DBItemGBasis))then
		{
			//////////////////////////////////////////////////////////////
			_UpdatedItemCache = [];
			_UpdatedItemsArray = [];
			_BasisKostenArray = [];
			_ItemKostenDif = 0;
			
			_selectIt =
			{
				_Tmp = [];
				_ItemType = (_this select 0) select 0;
				_Tmp pushback _ItemType;
				_BasisWert = 0;
				_Tmp pushback _BasisWert;
				_ItemBasisPreis = (_this select 0) select 1;			
				_MaxAmountCache = (_this select 0) select 2;
				_MaxValue = _this select 1;
				_VarAmountCache = round random((_MaxAmountCache/6));
				_ItemCount = _MaxAmountCache-_VarAmountCache;
				_ItemKosten = (_ItemCount * _ItemBasisPreis);
				_ItemKostenDif = _ItemKostenDif + (_MaxValue - _ItemKosten);
				_Tmp pushback _ItemCount;
				_UpdatedItemCache pushback _Tmp;
			};
			/////////////////////////////////////////////////////////////
			//HeroBase - Start
			
			if(_Type == "Hero")then
			{
				_BaseMoneyCost = 0;
				
				//HeroBase LowItem
				_MaxValue = 300000;
				_ItemArray = [["D41_BeefJerky",25,12000], ["D41_Apfelsaft",110,2727], ["D41_Pfirsichsaft",150,2000], ["D41_Apfelschnaps",165,1818], ["D41_Pfirsichschnaps",210,1428]];
				_RndmChosenItem = _ItemArray call BIS_fnc_selectRandom;
				[_RndmChosenItem, _MaxValue] call _selectIt;
				//HeroBase MidItem
				_MaxValue = 2000000;
				_ItemArray = [["D41_Kalkstein",250,8000], ["D41_Kohle",300,6666], ["D41_Eisen",700,6666], ["D41_Kupfer",300,6666]];
				_RndmChosenItem = _ItemArray call BIS_fnc_selectRandom;
				[_RndmChosenItem, _MaxValue] call _selectIt;
				//HeroBase HighItem
				_MaxValue = 3700000;
				_ItemArray = [["D41_Diamanten",1600,2312], ["D41_Krabben",1850,2000], ["D41_Zement",2500,1480], ["D41_Kerosin",6000,616], ["D41_Stahl",14000,264]];
				_RndmChosenItem = _ItemArray call BIS_fnc_selectRandom;
				[_RndmChosenItem, _MaxValue] call _selectIt;
				
				
				_BasisKostenArray pushback true;
				_ItemGBasis = 0;
				_UpdatedItemCache pushback _ItemGBasis;
				_UpdatedItemCache pushback (_BaseMoneyCost + _ItemKostenDif);
				_UpdatedItemsArray = _UpdatedItemsArray + _UpdatedItemCache;
				_BasisKostenArray pushback _UpdatedItemsArray;
				
				//Update Mietzeit + 168 (Stunden)
				_query = format["UpdateGangBaseTimer:%1",_GangID];
				//waitUntil{!DB_Async_Active};
				_queryResult = [_query,2,true] call DB_fnc_asyncCall;
			};
			//HeroBase - Ende
			/////////////////////////////////////////////////////////////
			
			/////////////////////////////////////////////////////////////
			//Neutral - Start
			if(_Type == "Neutral")then
			{
				_BaseMoneyCost = 3000000;
				
				//NeutralBase LowItem
				_MaxValue = 175000;
				_ItemArray = [["D41_BeefJerky",25,7000], ["D41_Apfelsaft",110,1590], ["D41_Pfirsichsaft",150,1166], ["D41_Apfelschnaps",165,1060], ["D41_Pfirsichschnaps",210,833]];
				_RndmChosenItem = _ItemArray call BIS_fnc_selectRandom;
				[_RndmChosenItem, _MaxValue] call _selectIt;
				//NeutralBase MidItem
				_MaxValue = 900000;
				_ItemArray = [["D41_Kohle",300,3000], ["D41_Kupfer",300,3000], ["D41_Kalkstein",250,3600], ["D41_Ton",225,4000], ["D41_Glas",225,4000]];
				_RndmChosenItem = _ItemArray call BIS_fnc_selectRandom;
				[_RndmChosenItem, _MaxValue] call _selectIt;
				//NeutralBase HighItem
				_MaxValue = 1925000;
				_ItemArray = [["D41_Zement",2500,770], ["D41_Oel",1300,1480], ["D41_Cannabis",350,2500]];
				_RndmChosenItem = _ItemArray call BIS_fnc_selectRandom;
				[_RndmChosenItem, _MaxValue] call _selectIt;
				
				_BasisKostenArray pushback true;
				_ItemGBasis = 0;
				_UpdatedItemCache pushback _ItemGBasis;
				_UpdatedItemCache pushback (_BaseMoneyCost + _ItemKostenDif);
				_UpdatedItemsArray = _UpdatedItemsArray + _UpdatedItemCache;
				_BasisKostenArray pushback _UpdatedItemsArray;
				
				//Update Mietzeit + 168 (Stunden)
				_query = format["UpdateGangBaseTimer:%1",_GangID];
				//waitUntil{!DB_Async_Active};
				_queryResult = [_query,2,true] call DB_fnc_asyncCall;
			};
			//Neutral - Ende
			/////////////////////////////////////////////////////////////
			
			/////////////////////////////////////////////////////////////
			//BanditBase - Start
			if(_Type == "Bandit")then
			{
				_BaseMoneyCost = 6000000;
				
				_BasisKostenArray pushback true;
				_BasisKostenArray pushback [["",0,0],["",0,0],["",0,0],0,_BaseMoneyCost];
				
				//Update Mietzeit + 168 (Stunden)
				_query = format["UpdateGangBaseTimer:%1",_GangID];
				//waitUntil{!DB_Async_Active};
				_queryResult = [_query,2,true] call DB_fnc_asyncCall;
			};
			//BanditBase - Ende
			/////////////////////////////////////////////////////////////
			
			_query = format["UpdateGangBaseCosts:%1:%2",_BasisKostenArray,_GangID];
			//waitUntil{!DB_Async_Active};
			_queryResult = [_query,2,true] call DB_fnc_asyncCall;
			
			
			if(_Init)then
			{
				_query = format["queryGangBaseCosts:%1",_GangID];
				//waitUntil{!DB_Async_Active};
				_queryResult = [_query,2,true] call DB_fnc_asyncCall;
				
				_queryResult = _queryResult select 0;
				[[_queryResult],"life_fnc_D41_GangBaseMenu",_Owner,false] call life_fnc_MP;
			};
		}
		else
		{
			_query = format["UpdateGangBaseCosts:%1:%2",_BasisKostenArray,_GangID];
			//waitUntil{!DB_Async_Active};
			_queryResult = [_query,2,true] call DB_fnc_asyncCall;
		};