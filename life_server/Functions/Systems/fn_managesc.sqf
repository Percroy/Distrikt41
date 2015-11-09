/*
	File: fn_managesc.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	User management of whether or not they want to be on a sidechat for their side.
*/
private["_unit","_bool","_side","_D41_HatHandy","_D41_isDead"];
_unit = param [0,ObjNull,[ObjNull]];
_bool = param [1,false,[false]];
_side = param [2,civilian,[west]];
_Revived = param [3,false,[false]];
if(isNull _unit) exitWith {};

_D41_HatHandy = false;
{
	if(_x isKindOf ["ItemRadio", configFile >> "CfgWeapons"])then{_D41_HatHandy = true;};
}forEach assignedItems _unit;

_D41_isDead = _unit getVariable "Revive";
if(isNil "_D41_isDead" OR _Revived)then	{ if(!(_side in [independent]))then{ life_radio_Dead radioChannelRemove [_unit]; diag_log format [":::: LifeDead Channel entfernt: _unit: %1", name _unit]; }; } //lebt + kein Medic
else									{ life_radio_Dead radioChannelAdd [_unit]; diag_log format [":::: LifeDead Channel hinzugefügt: _unit: %1", name _unit]; }; //tot


switch (_side) do
{
	case west:
	{
		if(_bool && _D41_HatHandy) then
		{
			life_radio_west radioChannelAdd [_unit];
		}
			else
		{
			life_radio_west radioChannelRemove [_unit];
		};
	};
	
	case civilian:
	{
		if(_bool && _D41_HatHandy) then
		{
			life_radio_civ radioChannelAdd [_unit];
		}
			else
		{
			life_radio_civ radioChannelRemove [_unit];
		};
	};
	
	case independent:
	{
		if(_bool) then
		{
			life_radio_west radioChannelAdd [_unit];
			life_radio_civ radioChannelAdd [_unit];
			life_radio_Dead radioChannelAdd [_unit];
		}
			else
		{
			life_radio_west radioChannelRemove [_unit];
			life_radio_civ radioChannelRemove [_unit];
		};
	};
};

// Ablage
/*
life_radio_indep radioChannelAdd [_unit];
life_radio_indep radioChannelRemove [_unit];
*/