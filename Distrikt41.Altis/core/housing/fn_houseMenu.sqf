/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Building interaction menu
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];
if(!dialog) then
{
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;

//_HouseInfos = [_curTarget, "Alles"] call life_fnc_D41_GetHouseInfos;
_HouseOwned = false;
_Pos = getPosATL _curTarget;
{
	if(str(_x) isEqualTo str(_Pos))exitWith{_HouseOwned = true};
}forEach D41_HausListe;

life_pInact_curTarget = _curTarget;
if(_curTarget isKindOf "House_F" && playerSide == west) exitWith
{
	if(_curTarget == fed_bank_building) then
	{
		_Btn1 ctrlSetText localize "STR_pInAct_Repair";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_repairDoor; closeDialog 0;";
		_Btn1 ctrlShow true;
		
		_Btn2 ctrlSetText localize "STR_pInAct_CloseOpen";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_doorAnimate; closeDialog 0;";
		_Btn2 ctrlShow true;
	}
	else
	{
		if(_HouseOwned)then
		{
			_Btn1 ctrlSetText localize "STR_House_Raid_Owner";
			_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_copHouseOwner;";
			_Btn1 ctrlShow true;
			
			_Btn2 ctrlSetText localize "STR_pInAct_BreakDown";
			_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_copBreakDoor; closeDialog 0;";
			_Btn2 ctrlShow true;
			
			_Btn3 ctrlSetText localize "STR_pInAct_SearchHouse";
			_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_raidHouse; closeDialog 0;";
			_Btn3 ctrlShow true;
			
			if(player distance _curTarget > 10) then {
				_Btn3 ctrlEnable false;
			};
			
			_Btn4 ctrlSetText localize "STR_pInAct_LockHouse";
			_Btn4 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_lockupHouse; closeDialog 0;";
			_Btn4 ctrlShow true;
		}
		else
		{
			closeDialog 0;
		};
	};
};

_houseCfg = [(typeOf _curTarget)] call life_fnc_houseConfig;
if(_houseCfg isEqualTo []) exitWith {closeDialog 0;};

if(!(_curTarget in life_vehicles))then
{
	_Btn1 ctrlSetText localize "STR_pInAct_BuyHouse";
	_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_buyHouse;";
	_Btn1 ctrlShow true;
	_Btn1 ctrlEnable false;
	
	if(!_HouseOwned)then{_Btn1 ctrlEnable true;};
	//if(_curTarget in life_vehicles) then {life_vehicles = life_vehicles - [_curTarget];};
}
else
{
	_HouseOwnerPID = [_curTarget, "house_ownerPID"] call life_fnc_D41_GetHouseInfos;
	if((typeOf _curTarget) in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"])then
	{
		_Btn1 ctrlSetText localize "STR_pInAct_SellGarage";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlShow true;
		
		_Btn2 ctrlSetText localize "STR_pInAct_AccessGarage";
		_Btn2 buttonSetAction "[life_pInact_curTarget,""Car""] spawn life_fnc_vehicleGarage; closeDialog 0;";
		_Btn2 ctrlShow true;
		
		_Btn3 ctrlSetText localize "STR_pInAct_StoreVeh";
		_Btn3 buttonSetAction "[life_pInact_curTarget,player] spawn life_fnc_storeVehicle; closeDialog 0;";
		_Btn3 ctrlShow true;
		
		_Btn4 ctrlSetText localize "STR_D41_Rent";
		_Btn4 buttonSetAction "[getPosATL cursorTarget,0] spawn life_fnc_D41_GetRentDate; closeDialog 0;";
		_Btn4 ctrlShow true;
		
		_Btn5 ctrlSetText localize "STR_D41_Pay_Rent";
		_Btn5 buttonSetAction "[getPosATL cursorTarget,1,life_pInact_curTarget] spawn life_fnc_D41_GetRentDate; closeDialog 0;";
		_Btn5 ctrlShow true;
		
		
		if(_HouseOwnerPID != (getPlayerUID player))then
		{
			_Btn1 ctrlEnable false;
			_Btn4 ctrlEnable false;
			_Btn5 ctrlEnable false;
		};
		
	}
	else
	{
		_Btn1 ctrlSetText localize "STR_pInAct_SellHouse";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlShow true;
		
		_HouseLockedStatus = [_curTarget, "locked"] call life_fnc_D41_GetHouseInfos;
		if(_HouseLockedStatus isEqualTo "KeineDaten")then
			{
				_Btn2 ctrlSetText localize "STR_pInAct_UnlockStorage";
			}
			else
			{
				_Btn2 ctrlSetText localize "STR_pInAct_LockStorage";
			};
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_lockHouse; closeDialog 0;";
		_Btn2 ctrlShow true;
		
		if(isNull (_curTarget getVariable ["lightSource",ObjNull]))then
			{
				_Btn3 ctrlSetText localize "STR_pInAct_LightsOn";
			}
			else
			{
				_Btn3 ctrlSetText localize "STR_pInAct_LightsOff";
			};
		_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;";
		_Btn3 ctrlShow true;
		
		_Btn4 ctrlSetText localize "STR_D41_Rent";
		_Btn4 buttonSetAction "[getPosATL cursorTarget,0] spawn life_fnc_D41_GetRentDate; closeDialog 0;";
		_Btn4 ctrlShow true;
		
		_Btn5 ctrlSetText localize "STR_D41_Pay_Rent";
		_Btn5 buttonSetAction "[getPosATL cursorTarget,1,life_pInact_curTarget] spawn life_fnc_D41_GetRentDate; closeDialog 0;";
		_Btn5 ctrlShow true;
		
		if(_HouseOwnerPID != (getPlayerUID player))then
		{
			_Btn1 ctrlEnable false;
			_Btn4 ctrlEnable false;
			_Btn5 ctrlEnable false;
		};
	};
};