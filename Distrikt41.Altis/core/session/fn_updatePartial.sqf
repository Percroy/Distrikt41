#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through life_fnc_MP
*/
private["_mode","_packet","_array","_flag","_Health"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_packet = [steamid,playerSide,nil,_mode];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

if(playerside in [west,independent] && (_mode == 9)) exitWith {};
if(playerside in [west,independent] && (_mode == 10)) exitWith {};

D41_SpawnInfos = [];
D41_SpawnInfos pushback (getPosATL player);
_Health = [];
_Health pushback (player getHitPointDamage "HitHead");
_Health pushback (player getHitPointDamage "HitHands");
_Health pushback (player getHitPointDamage "HitBody");
_Health pushback (player getHitPointDamage "HitLegs");
D41_SpawnInfos pushback _Health;

if(_mode == 10)exitWith
	{
		_D41_Skills = [getPlayerUID player, life_skillApple, life_skillPeach, life_skillSalt, life_skillSand, life_skillIronore, life_skillCopperore, life_skillDiamond, life_skillCannabis, life_skillCocaine, life_skillHeroinu, life_skillOilu, life_skillRawmeat, life_skillcoalu, life_skillBruchstein, life_skillTon, life_skillKrabben, life_skillFischen, life_skillReperatur, life_skillMeth];
		[_D41_Skills,"D41_fnc_insertSkillSys",false,false] spawn life_fnc_MP;
	};

switch(_mode) do
{
	/*case 0:
	{
		_packet set[2,D41_Geld];
	};
	
	case 1:
	{
		_packet set[2,D41_atmGeld];
	};*/
	
	case 2:
	{
		{
			if(_x select 1 == _flag) then
			{
				_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
			};
		} foreach life_licenses;
		
		_packet set[2,_array];
		_packet set[4,D41_SpawnInfos];
	};
	
	case 3:
	{
		[] call life_fnc_saveGear;
		_packet set[2,life_gear];
		_packet set[4,D41_SpawnInfos];
	};
	
	case 4:
	{
		//Not yet implemented
	};
	
	case 5:
	{
		_packet set[2,life_is_arrested];
		_packet set[4,D41_SpawnInfos];
	};
	
	case 6:
	{
		_packet set[2,D41_Geld];
		_packet set[4,D41_atmGeld];
		_packet set[6,D41_SpawnInfos];
	};
	
	case 8:
	{
		_packet set[2,D41_DiedTimer];
		_packet set[4,D41_SpawnInfos];
	};
	
	case 9:
	{
		_packet set[2,life_D41_Karma];
		_packet set[4,D41_SpawnInfos];
	};
};

[_packet,"DB_fnc_updatePartial",false,false] call life_fnc_MP;