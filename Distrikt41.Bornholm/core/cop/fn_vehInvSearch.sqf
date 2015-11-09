#include <macro.h>
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the vehicle for illegal items.
*/
private["_Veh","_inv","_counter","_IllItem","_IllItemList","_bounty","_owners","_Item","_ItemCount"];

	_Veh = cursorTarget;
	if(isNull _Veh) exitWith {};
	if(!((_Veh isKindOf "Air") OR (_Veh isKindOf "Ship") OR (_Veh isKindOf "LandVehicle"))) exitWith {};
	
	_inv = magazineCargo _Veh;
	_ret = [];
	_IllItem = [];
	_IllItemList = "";
	_amount = 0;
	_bounty = 0;
	_owners = _Veh getVariable "vehicle_info_owners";
	_owners = [_owners] call life_fnc_vehicleOwners;
	if(_owners == "any<br/>") then { _owners = "No Owner<br/>"; };
	{
		_Item = _x;
		if(!(_Item in _ret))then
		{
			_ret pushback _Item;
			_ItemCount = ({_x == _Item} count _inv);
			_ret pushback _ItemCount;
		};
	}forEach _inv;
	
	//clearMagazineCargoGlobal _Veh;
	
	_counter = 1;
	{
		_Item = format["%1",_x];
		if(!([_Item] call TON_fnc_isnumber)) then
		{
			_IstLegal = true;
			_amount = _ret select _counter;
			{
				if(_Item in _x)then
				{
					_IllItem pushback _Item;
					_IllItem pushback _amount;
					_bounty = _bounty + ((_x select 1)*_amount);
					_IllItemList = _IllItemList + format["%1x %2<br/>",_amount,[_x select 0] call life_fnc_D41_GetMagName];
					_amount = 0;
					_IstLegal = false;
				};
			}forEach life_illegal_items;
			//if(_IstLegal)then{_Veh addMagazineCargoGlobal [_Item, _amount];};
			_counter = _counter + 2;
		};
	}forEach _ret;
	
	if(_bounty > 0)then
	{
		hint parseText format[
		"<t color='#FF0000'><t size='1.5'><br/>Illegale Items</t></t>
		<br/>
		<t size='1.25'>%1</t>
		<br/><br/>
		<t color='#FFFF00'><t size='1.5'>Gesamtwert:</t></t>
		<br/>
		<t size='1.25'>%2</t>
		<br/><br/>
		<t color='#FF0000'><t size='1.5'>Besitzer:</t></t>
		<br/>
		<t size='1.25'>%3</t>"
		,_IllItemList, _bounty, _owners];
		systemchat format[
		"Illegale Items %1 ||| Gesamtwert: %2 ||| Besitzer: %3"
		,_IllItemList, _bounty, _owners];
		//[[getPlayerUID _owners,_owners getVariable["realname",name _owners],"482"],"life_fnc_wantedAdd",false,false] call life_fnc_MP; Muss noch angepasst werden
	}
	else
	{
		hint parseText format["
		<t size='1.5'><br/>KEINE</t>
		<br/>
		<t size='1.5'><br/>Illegalen Items</t>
		<br/>
		<t size='1.5'><br/>gefunden</t>
		"
		,_IllItemList, _bounty, _owners];
		systemchat "Keine Illegalen Items gefunden.";
	};