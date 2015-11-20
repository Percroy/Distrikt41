/*
        Author: Bryan "Tonic" Boardwine
       
        Description:
        Inserts the gang into the database.
*/
private["_ownerID","_uid","_gangName","_query","_queryResult","_gangMembers","_group"];
_ownerID = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_gangName = [_this,2,"",[""]] call BIS_fnc_param;
_playername = [_this,3,"",[""]] call BIS_fnc_param;
_group = group _ownerID;
 
if(isNull _ownerID OR _uid == "" OR _gangName == "") exitWith {}; //Fail
 
_ownerID = owner _ownerID;
_gangName = [_gangName] call DB_fnc_mresString;
_query = format["insertGang:%1",_gangName];
//waitUntil{!DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
 
//Check to see if the gang name already exists.
if(count _queryResult != 0) exitWith {
        [[1,"There is already a gang created with that name please pick another name."],"life_fnc_broadcast",_ownerID,false] call life_fnc_MP;
        [["life_action_gangInUse",nil,missionNamespace],"life_fnc_netSetVar",_ownerID,false] call life_fnc_MP;
};
 
_query = format["insertGang+1:%1","%" + _uid +"%"];
//waitUntil{!DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
 
//Check to see if this person already owns or belongs to a gang.
if(count _queryResult != 0) exitWith {
        [[1,"You are currently already active in a gang, please leave the gang first."],"life_fnc_broadcast",_ownerID,false] call life_fnc_MP;
        [["life_action_gangInUse",nil,missionNamespace],"life_fnc_netSetVar",_ownerID,false] call life_fnc_MP;
};
 
//Check to see if a gang with that name already exists but is inactive.
_query = format["insertGang+2:%1'",_gangName];
//waitUntil{!DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

_gangMembers = [];
_gangMembers = _gangMembers + [_uid];
//_gangMembers pushBack [_uid];
_gangMemberNames = [[_uid,_playername]];

if(count _queryResult != 0) then {
        _query = format["insertGang+3:%1:%2:%3",_uid,_gangMembers,(_queryResult select 0)];
} else {
        _query = format["insertGang+4:%1:%2:%3:%4",_uid,_gangName,_gangMembers,_gangMemberNames];
};
//waitUntil{!DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;
 
_group setVariable["gang_name",_gangName,true];
_group setVariable["gang_owner",_uid,true];
_group setVariable["gang_bank",0,true];
_group setVariable["gang_maxMembers",2,true];
_group setVariable["gang_members",[_uid],true];
_group setVariable["gang_Karma",0,true];
_group setVariable["gang_MemberNames",[[_uid,_playername]],true];
[[_group],"life_fnc_gangCreated",_ownerID,false] call life_fnc_MP;

sleep 0.35;
_query = format["insertGang+5:%1",_uid];
//waitUntil{!DB_Async_Active};
_queryResult = [_query,2,false] call DB_fnc_asyncCall;
 
_group setVariable["gang_id",(_queryResult select 0),true];