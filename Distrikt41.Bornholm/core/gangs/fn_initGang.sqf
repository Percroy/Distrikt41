/*
	Author: Bryan "Tonic" Boardwine
	Edit by D41-Dscha
	Description:
	Main initialization for gangs?
*/
private["_exitLoop","_group","_wait","_gangList","_PlayerUID"];

	if(playerSide != civilian) exitWith {}; //What in the hell?
	[player] join (createGroup civilian);
	if(count life_gangData == 0) exitWith {}; //Dafuq?
	_playerID = getPlayerUID player;
	
	_wait = round(random(8));
	sleep _wait;
	
	//Loop through to make sure there is not a group already created with the gang.
	_exitLoop = false;
	{
		_groupName = _x getVariable "gang_name";
		if(!isNil "_groupName") then {
			_groupOwner = _x getVariable["gang_owner",""];
			_groupID = _x getVariable "gang_id";
			if(_groupOwner == "" OR isNil "_groupID") exitWith {}; //Seriously?
			if((life_gangData select 0) == _groupID && {(life_gangData select 1) == _groupOwner}) exitWith {_group = _x; _exitLoop = true;};
		};
	} foreach allGroups;
	
	if(!isNil "_group") then
	{
		[player] join _group;
		if((life_gangData select 1) == _playerID) then {
			_group selectLeader player;
			[[player,_group],"TON_fnc_clientGangLeader",(units _group),false] call life_fnc_MP;
		};
	}
	else
	{
		_group = group player;
		_group setVariable["gang_id",(life_gangData select 0),true];
		_group setVariable["gang_owner",(life_gangData select 1),true];
		_group setVariable["gang_name",(life_gangData select 2),true];
		_group setVariable["gang_maxMembers",(life_gangData select 3),true];
		_group setVariable["gang_bank",(life_gangData select 4),true];
		_group setVariable["gang_members",(life_gangData select 5),true];
		_group setVariable["gang_Karma",(life_gangData select 6),true];
		_group setVariable["gang_MemberNames",(life_gangData select 7),true];
		_group setVariable["gang_BaseName",(life_gangData select 8),true];
	};
	
	_gangList = _group getVariable "gang_MemberNames";
	_PlayerUID = format["%1",_playerID];
    {
        if(_playerID isEqualto (_x select 0))exitWith
		{
            if((_x select 1) != profilename) then
			{
                _x set [1,profilename];
                _group setVariable["gang_MemberNames",_gangList,true];
                [[4,group player],"TON_fnc_updateGang",false,false] call life_fnc_MP;
            };
        };
    } foreach _gangList;
	
	
	if((life_gangData select 8) == "")exitWith //Hat keine Base? -> ExitWith
	{
		license_civ_base01 = false; 
		license_civ_base02 = false;
		license_civ_base03 = false;
		license_civ_base04 = false;
		license_civ_base05 = false;
		license_civ_base06 = false;
		D41_GangInitDone = true;
	};

	license_civ_base01 = false; //Alles auf 0, dann erst Go (Sec-Check)
	license_civ_base02 = false;
	license_civ_base03 = false;
	license_civ_base04 = false;
	license_civ_base05 = false;
	license_civ_base06 = false;
	missionNamespace setVariable[(life_gangData select 8),true];
	D41_GangInitDone = true;

