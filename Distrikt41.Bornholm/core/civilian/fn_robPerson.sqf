/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Getting tired of adding descriptions...
*/
private["_robber","_unit2"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(D41_Geld > 0) then
{
	life_maskiert = 0;
	if ((goggles _robber) in D41_goggles_Array) then {life_maskiert = 1};
	if ((uniform _robber) in D41_uniform_Array) then {life_maskiert = 1};
	if ((headgear _robber) in D41_headgear_Array) then {life_maskiert = 1};
	if ((hmd _robber) in D41_hmd_Array) then {life_maskiert = 1};

	if (life_maskiert > 0) then
		{
			[[1,format[localize "STR_D41_Robbed_Msg",localize "STR_D41_Masked_2",profileName,[D41_Geld] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
			if((side _robber) == civilian)then{ [[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"life_fnc_wantedAdd",false,false] call life_fnc_MP; };
			[[D41_Geld],"life_fnc_robReceive",_robber,false] call life_fnc_MP;
			D41_Geld = 0;
			[6] call SOCK_FNC_updatePartial;
			[-10,0] call life_fnc_D41_KSys;
		}
			else
		{
			[[1,format[localize "STR_D41_Robbed_Msg",_robber getVariable["realname",name _robber],profileName,[D41_Geld] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
			if((side _robber) == civilian)then{ [[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"life_fnc_wantedAdd",false,false] call life_fnc_MP; };
			[[D41_Geld],"life_fnc_robReceive",_robber,false] call life_fnc_MP;
			D41_Geld = 0;
			[6] call SOCK_FNC_updatePartial;
			[-10,0] call life_fnc_D41_KSys;
		};
}
	else
{
	[[2,"STR_NOTF_RobFail",true,[profileName]],"life_fnc_broadcast",_robber,false] call life_fnc_MP;
};