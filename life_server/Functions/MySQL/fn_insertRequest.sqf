/*
	File: fn_insertRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with inserting... Don't have time for
	descriptions... Need to write it...
*/
private["_uid","_name","_side","_money","_bank","_licenses","_handler","_thread","_queryResult","_query","_alias","_querySkill"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_money = [_this,2,0,[""]] call BIS_fnc_param;
_bank = [_this,3,2500,[""]] call BIS_fnc_param;
_return = [_this,4,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if((_uid == "") OR (_name == "")) exitWith {systemChat "Bad UID or name";}; //Let the client be 'lost' in 'transaction'
if(isNull _return) exitWith {systemChat "ReturnToSender is Null!";}; //No one to send this to!

//Clense and prepare some information.
_name = [_name] call DB_fnc_mresString;
_alias = [[_name]] call DB_fnc_mresArray;
_money = [_money] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Prepare the query statement..
_query = format["InsertRequest:%1:%2:%3:%4:%5",_uid,_name,_money,_bank,_alias];

//waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;
[[],"SOCK_fnc_dataQuery",(owner _return),false] call life_fnc_MP;