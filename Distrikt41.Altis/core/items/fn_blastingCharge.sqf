/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if(D41_AllChemBlocked)exitWith{hint "Alles ist dicht! Solange woanders die Fabriken ausgeraubt werden oder die Lage sich noch nicht beruhigt hat.";};
if(typeOf _vault != "D41_SafeCrate_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if(_vault getVariable["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if(_vault getVariable["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if((player distance fed_bank) > 2) exitWith {hint localize "STR_D41_Jedi"};
if({side _x == west} count playableUnits < 8) exitWith {hint localize"STR_D41_Not_Enoguh_Cops"};
if(!("D41_Sprengladung" in (magazines player))) exitWith {hint "Lass die Bombe im Inventar! Samma! Gehts noch?"};
player removeMagazine "D41_Sprengladung";
[[true],"D41_fnc_RobBlock",false,false] call life_fnc_mp;

_vault setVariable["chargeplaced",true,true];
[[0,localize "STR_ISTR_Blast_Placed"],"life_fnc_broadcast",west,false] call life_fnc_MP;
hint localize "STR_ISTR_Blast_KeepOff";
_handle = [] spawn life_fnc_demoChargeTimer;
[[],"life_fnc_demoChargeTimer",west,false] call life_fnc_MP;

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"; [[false],"D41_fnc_RobBlock",false,false] call life_fnc_mp;};

fed_bank_safe_pos = [getPosATL fed_bank select 0, getPosATL fed_bank select 1, getPosATL fed_bank select 2];
_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable["chargeplaced",false,true];
fed_bank setVariable["safe_open",true,true];

hint localize "STR_ISTR_Blast_Opened";
player getVariable ["D41_Safe_Loot",0];
sleep 2;
fed_bank addMagazineCargoGlobal ["D41_Goldbarren",120];
fed_bank addMagazineCargoGlobal ["D41_Faultierhoden",2];
fed_bank setPos [fed_bank_safe_pos select 0, fed_bank_safe_pos select 1, fed_bank_safe_pos select 2];
D41_Safe_Loot = 0;
[[false],"D41_fnc_RobBlock",false,false] call life_fnc_mp;
hint localize "STR_D41_Vault_Open";