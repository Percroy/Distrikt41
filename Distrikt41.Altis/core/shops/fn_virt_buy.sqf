#include <macro.h>
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	Re-written by Distrikt41-Dscha
	Description:
	Buy a virtual item from the store.
*/
if((lbCurSel 2201) == -1) exitWith {hint localize "STR_Shop_Virt_Nothing"};
private["_type","_price","_amount","_diff","_name","_hideout","_StockListe","_ZiviSpielerOnline","_BlockedSeller","_BlockedItems","_CannotAdd","_ItemType","_action"];
if(D41_IsBuying) exitWith {hint localize "STR_spam_button";};
D41_IsBuying = true;
_type = lbData[2201,(lbCurSel 2201)];
_index = [_type,__GETC__(buy_array)] call TON_fnc_index;
if(_index == -1) exitWith {D41_IsBuying = false;};
_price = (__GETC__(buy_array) select _index) select 1;
if((call life_coplevel) > 0) then {_price = _price * 0.8;};

_amount = ctrlText 2210;
if(!([_amount] call TON_fnc_isnumber)) exitWith {D41_IsBuying = false; hint localize "STR_Shop_Virt_NoNum";};
if(_type == "D41_Goldbarren")exitWith{closedialog 0; D41_IsBuying = false; hint localize "STR_store_not_selling"};
if(_type == "D41_Diamantschmuck")exitWith{closedialog 0; D41_IsBuying = false; hint localize "STR_store_not_selling"};

//Export Handel verkauft nix!
_BlockedSeller = ["export_metall","export_oil","export_mineralien","export_baumaterial"];
if(life_shop_type in _BlockedSeller)exitWith{closedialog 0; D41_IsBuying = false; hint localize "STR_store_not_selling"};

//folgende Items erst ab 25 Zivilisten kaufbar machen:
_BlockedItems = ["D41_Heroin", "D41_Oel", "D41_Cannabis", "D41_Kokain", "D41_Diamanten", "D41_Eisen", "D41_Kupfer", "D41_Salz", "D41_Kohle", "D41_Glas", "D41_Apfelsaft", "D41_Ton", "D41_Zement", "D41_Stahl", "D41_Fahrzeugteile", "D41_Kerosin", "D41_Kalkstein", "D41_Krabben"];
_ZiviSpielerOnline = {side _x == civilian} count playableUnits;
if ((_ZiviSpielerOnline < 25) && (_type in _BlockedItems)) exitWith{closedialog 0; D41_IsBuying = false; hint format ["Nicht genug Zivilisten Online. %1/25", _ZiviSpielerOnline];};

_amount = parseNumber(_amount);
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > D41_Geld && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {D41_IsBuying = false; hint localize "STR_NOTF_NotEnoughMoney"};

_CannotAdd = false;
_name = "";

if(isClass (configFile >> "CfgWeapons" >> _type))	then {_name = [_type] call life_fnc_D41_GetWpnName;};
if(isClass (configFile >> "CfgMagazines" >> _type))	then {_name = [_type] call life_fnc_D41_GetMagName;};

player setVariable["D41_BuyAble",true,true];
//:::::::::::::::: D41StockSys
_StockListe = ["D41_Apfel", "D41_Pfirsich", "D41_Apfelschnaps", "D41_Pfirsichschnaps", "D41_Heroin", "D41_Oel", "D41_Cannabis", "D41_BeefJerky", "D41_Kokain", "D41_Diamanten", "D41_Eisen", "D41_Kupfer", "D41_Salz", "D41_Kohle", "D41_Glas", "D41_Apfelsaft", "D41_Pfirsichsaft", "D41_Ton", "D41_Zement", "D41_WaffenKomponenten", "D41_Stahl", "D41_Fahrzeugteile", "D41_Kerosin", "D41_Kalkstein", "D41_Krabben","D41_Dosenfisch"];
if(_type in _StockListe)then
	{
		hint format ["Lagerabfrage für %1 läuft",_name];
		diag_log format ["::::::::::::: fn_virt_buy _type = %1 || _amount = %2 || _amount (NumText) = %3",_type,_amount,str(_amount)];
		[[_type, str(_amount), player],"D41_fnc_queryStockSys",false,false] spawn life_fnc_MP;
		uisleep 1;
		_D41_BuyAble = player getVariable["D41_BuyAble",false];
	};
//::::::::::::::::
if(!(player getVariable["D41_BuyAble",false])) exitWith {D41_IsBuying = false; hint format [localize "STR_D41_NichtGenugImStock",_name];};
disableUserInput true;
sleep 1;

	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then
	{
		_action = [
			format[(localize "STR_Shop_Virt_Gang_FundsMSG")+ "<br/><br/>" +(localize "STR_Shop_Virt_Gang_Funds")+ " <t color='#8cff9b'>€%1</t><br/>" +(localize "STR_Shop_Virt_YourFunds")+ " <t color='#8cff9b'>€%2</t>",
				str(grpPlayer getVariable "gang_bank"),
				str(D41_Geld)
			],
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint format[localize "STR_Shop_Virt_BoughtGang",_amount,_name,str(_price * _amount)];
			if(_type in _StockListe)then{[[_type, str(_amount),"rem",getPlayerUID player],"D41_fnc_insertStockSys",false,false] call life_fnc_MP;};
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer setVariable["gang_bank",_funds,true];
			[[1,grpPlayer],"TON_fnc_updateGang",false,false] call life_fnc_MP;
		} else {
			_Counter = 0;
			for "_i" from 1 to _amount do
			{
				if(isClass (configFile >> "CfgWeapons" >> _type))then{_ItemType = getNumber (configFile >> "CfgWeapons" >> _type >> "type"); if(_ItemType == 1)exitWith {if(primaryWeapon player == "")then {player addWeapon _type;} else {if(!(player canAdd _type)) exitWith {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";}; player addItem _type;};}; if(_ItemType == 2) exitWith {if(handgunWeapon player == "")then {player addWeapon _type;} else {if(!(player canAdd _type)) exitWith {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";}; player addItem _type;};}; if(_ItemType == 4) exitWith {if(secondaryWeapon player == "")then {player addWeapon _type;} else {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";};}; if(!(player canAdd _type)) exitWith {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";}; player addItem _type;} else {if(!(player canAdd _type)) exitWith {_CannotAdd = true;hint "Nicht genug Platz im Inventar!";};player addMagazine _type;};
				if(_CannotAdd)exitWith{};
				D41_Geld = D41_Geld - _price;
				_Counter = _Counter + 1;
			};
			hint format[localize "STR_Shop_Virt_BoughtItem",_Counter,_name,str(_price * _counter)];
			if(_type in _StockListe)then{[[_type, str(_amount),"rem",getPlayerUID player],"D41_fnc_insertStockSys",false,false] call life_fnc_MP;};
		};
	}
	else
	{
		if((_price * _amount) > D41_Geld) exitWith {D41_IsBuying = false; hint localize "STR_NOTF_NotEnoughMoney";};
		_Counter = 0;
		for "_i" from 1 to _amount do
		{
			if(isClass (configFile >> "CfgWeapons" >> _type))then{_ItemType = getNumber (configFile >> "CfgWeapons" >> _type >> "type"); if(_ItemType == 1)exitWith {if(primaryWeapon player == "")then {player addWeapon _type;} else {if(!(player canAdd _type)) exitWith {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";}; player addItem _type;};}; if(_ItemType == 2) exitWith {if(handgunWeapon player == "")then {player addWeapon _type;} else {if(!(player canAdd _type)) exitWith {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";}; player addItem _type;};}; if(_ItemType == 4) exitWith {if(secondaryWeapon player == "")then {player addWeapon _type;} else {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";};}; if(!(player canAdd _type)) exitWith {_CannotAdd = true; hint "Nicht genug Platz im Inventar!";}; player addItem _type;} else {if(!(player canAdd _type)) exitWith {_CannotAdd = true;hint "Nicht genug Platz im Inventar!";};player addMagazine _type;};
			if(_CannotAdd)exitWith{};
			D41_Geld = D41_Geld - _price;
			_Counter = _Counter + 1;
		};
		hint format[localize "STR_Shop_Virt_BoughtItem",_Counter,_name,str(_price * _counter)];
		if(_type in _StockListe)then{[[_type, str(_amount),"rem",getPlayerUID player],"D41_fnc_insertStockSys",false,false] call life_fnc_MP;};
		D41_IsBuying = false;
	};

[] call life_fnc_virt_update;
disableUserInput false;
D41_IsBuying = false;
[6] call SOCK_FNC_updatePartial;
[3] call SOCK_fnc_updatePartial;
[] call life_fnc_hudUpdate;