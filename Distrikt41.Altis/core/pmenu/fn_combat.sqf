#include <macro.h>
/*
    File: fn_combat.sqf
    Author: Distrikt41 - Avka
    
    Description:
    Combatrose! woot woot! Slothpower, Bitch!
*/
#define Btn0 1600
#define Btn1 1601
#define Btn2 1602
#define Btn3 1603
#define Btn4 1604
#define Btn5 1605
#define Btn6 1606
#define Btn7 1607
#define Btn8 1608
#define Btn9 1609
#define Btn10 1610

private ["_display","_Type","_Btn0","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
params [
    ["_curTarget", ObjNull, [ObjNull]]
];

if (!dialog) then { createDialog "CombatRose"; };
disableSerialization;
_display = findDisplay 1713999;
_Btn0 = _display displayCtrl Btn0;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
_Type = TypeOf _curTarget;

if ((!isNull _curTarget) && (_Type isKindOf "Man") && (isPlayer _curTarget) && (alive _curTarget) && (_curTarget distance player < 5) && (speed _curTarget < 1)) then {
    life_pInact_curTarget = _curTarget;

    //Set Unrestrain Button
    if (_curTarget getVariable "restrained") then {
        _Btn0 ctrlSetText localize "STR_pInAct_Unrestrain";
        _Btn0 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_unrestrain; closeDialog 0;";
    } else {
        _Btn0 ctrlEnable false;
    };

    //Set Escort Button
    if ((_curTarget getVariable["Escorting",false])) then {
        _Btn2 ctrlSetText localize "STR_pInAct_StopEscort";
        _Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting;";
    } else {
        _Btn2 ctrlSetText localize "STR_pInAct_Escort";
        if(life_pInact_curTarget getVariable "restrained") then {
            _Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
        } else { _Btn2 ctrlEnable false };
    };
        
    //Set Close Button
    _Btn8 ctrlSetText localize "STR_Global_Close";
    _Btn8 buttonSetAction "closeDialog 0;";

    //Set PutInCar Button
    if (_curTarget getVariable "restrained" OR _curTarget getVariable "Escorting") then {
        _Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
        _Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";
    } else {
        _Btn3 ctrlEnable false;
    };

    //Set Cop Button
    if (playerside == west) then {
        _Btn4 ctrlSetText localize "STR_PM_Cop";
        _Btn4 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_cop;";
    } else {
        _Btn4 ctrlEnable false;
    };
        
    //Set Give Money Button
    _Btn1 ctrlSetText localize "STR_Give_Money";
    _Btn1 buttonSetAction "closeDialog 0; [] spawn life_fnc_D41_GiveMoney;";

    //Set Chop Off Finger
    if (_curTarget getVariable "restrained" && ("D41_Gartenschere" in items player OR "D41_Gartenschere" in assignedItems player)) then {
        _Btn5 ctrlSetText localize "STR_Item_secateurs_Use";
        _Btn5 buttonSetAction "closeDialog 0; _list = player nearEntities [""Man"", 50]; [[life_pInact_curTarget],""life_fnc_D41_wilhelm"",_list,false,false] call life_fnc_MP;";
        [-5,0] call life_fnc_D41_KSys;
    } else {
        _Btn5 ctrlEnable false;
    };
    
    //Set Drug Someone
    if(_curTarget getVariable "restrained" && (("D41_Heroin" in magazines player) OR ("D41_Kokain" in magazines player) OR ("D41_Cannabis" in magazines player) )) then {
        _Btn6 ctrlSetText localize "STR_D41_Drug_him";
        if("D41_Heroin" in magazines player)then{player removeMagazine "D41_Heroin"; _Btn6 buttonSetAction "closeDialog 0; [['D41_Heroin'],""life_fnc_D41_Drugged"",life_pInact_curTarget,false,false] call life_fnc_MP;";};
        if("D41_Kokain" in magazines player)then{player removeMagazine "D41_Kokain";_Btn6 buttonSetAction "closeDialog 0; [['D41_Kokain'],""life_fnc_D41_Drugged"",life_pInact_curTarget,false,false] call life_fnc_MP;";};
        if("D41_Cannabis" in magazines player)then{player removeMagazine "D41_Cannabis";_Btn6 buttonSetAction "closeDialog 0; [['D41_Cannabis'],""life_fnc_D41_Drugged"",life_pInact_curTarget,false,false] call life_fnc_MP;";};  
        [-5,0] call life_fnc_D41_KSys;            
    } else {
        _Btn6 ctrlEnable false;
    };    
    
    _Btn7 ctrlEnable false;
    _Btn9 ctrlEnable false;
    _Btn10 ctrlEnable false;

} else {
    if ((!isNull _curTarget) && ((_Type isKindOf "LandVehicle") OR (_Type == "D41_CargoContainer_Orange")) && (alive _curTarget) && (_curTarget distance player < 5) && (speed _curTarget < 1)) then {
        life_pInact_curTarget = _curTarget;

        //Set Repair Button
        if (_Type != "D41_CargoContainer_Orange") then {
            _Btn0 ctrlSetText localize "STR_vInAct_Repair";
            _Btn0 buttonSetAction "closeDialog 0; [] spawn life_fnc_D41_RepCar;";
        };
        
        //Set Owner  Button
        if (playerside == west) then {
            _Btn1 ctrlSetText localize "STR_vInAct_Registration";
            _Btn1 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_searchVehAction;";
        } else {
            _Btn1 ctrlEnable false;
        };

        //Set Search Button
        if (playerside == west) then {
            _Btn2 ctrlSetText localize "STR_vInAct_SearchVehicle";
            _Btn2 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_vehInvSearch;";
        } else {
            _Btn2 ctrlEnable false;
        };

        //Set PullOut Button
        if (playerside == west) then {
            _Btn3 ctrlSetText localize "STR_vInAct_PullOut";
            _Btn3 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_pulloutAction;";
        } else {
            _Btn3 ctrlEnable false;
        };

        //Set Close Button
        _Btn8 ctrlSetText localize "STR_Global_Close";
        _Btn8 buttonSetAction "closeDialog 0;";

        //Set Impound Button
        if (playerside == west) then {
            _Btn4 ctrlSetText localize "STR_vInAct_Impound";
            _Btn4 buttonSetAction "closeDialog 0; [] spawn life_fnc_ImpoundAction";
        } else {
            _Btn4 ctrlEnable false;
        };
        
        //Set Flip Button
        if (((_Type isKindOf "LandVehicle") OR (_Type == "D41_CargoContainer_Orange")) && count crew _curTarget == 0) then {
            _Btn6 ctrlSetText localize "STR_vInAct_Unflip";
            _Btn6 buttonSetAction "life_pInact_curTarget setPos [getPos life_pInact_curTarget select 0, getPos life_pInact_curTarget select 1, (getPos life_pInact_curTarget select 2)+0.5]; closeDialog 0;";
        } else {
            _Btn6 ctrlEnable false;
        };

        if ("D41_Dietrich" in magazines player) then {
            _Btn7 ctrlSetText localize "STR_Item_Lockpick_Use";
            _Btn7 buttonSetAction "closeDialog 0; [] spawn life_fnc_lockpick;";
        } else {
            _Btn7 ctrlEnable false;
        };
        
        _Btn9 ctrlEnable false;
        _Btn10 ctrlEnable false;

    } else {
        if ((!isNull _curTarget) && (_Type isKindOf "Air") && (alive _curTarget) && (_curTarget distance player < 5) && (speed _curTarget < 1)) then {
            life_pInact_curTarget = _curTarget;

            //Set Repair Button
            _Btn0 ctrlSetText localize "STR_vInAct_Repair";
            _Btn0 buttonSetAction "closeDialog 0; ['HitBody'] spawn life_fnc_repairTruck;";

            //Set Owner  Button
            if (playerside == west) then {
                _Btn1 ctrlSetText localize "STR_vInAct_Registration";
                _Btn1 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_searchVehAction;";
            } else {
                _Btn1 ctrlEnable false;
            };

            //Set Search Button
            if (playerside == west) then {
                _Btn2 ctrlSetText localize "STR_vInAct_SearchVehicle";
                _Btn2 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_vehInvSearch;";
            } else {
                _Btn2 ctrlEnable false;
            };
            
            //Set PullOut Button
            if (playerside == west) then {
                _Btn3 ctrlSetText localize "STR_vInAct_PullOut";
                _Btn3 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_pulloutAction;";
            } else {
                _Btn3 ctrlEnable false;
            };

            //Set Close Button
            _Btn8 ctrlSetText localize "STR_Global_Close";
            _Btn8 buttonSetAction "closeDialog 0;";

            //Set Impound Button
            if (playerside == west) then {
                _Btn4 ctrlSetText localize "STR_vInAct_Impound";
                _Btn4 buttonSetAction "closeDialog 0; [] spawn life_fnc_ImpoundAction";
            } else {
                _Btn4 ctrlEnable false;
            };
            
            if ("D41_Dietrich" in magazines player) then {
                _Btn5 ctrlSetText localize "STR_Item_Lockpick_Use";
                _Btn5 buttonSetAction "closeDialog 0; [] spawn life_fnc_lockpick;";
            } else {
                _Btn5 ctrlEnable false;
            };

            _Btn6 ctrlEnable false;
            _Btn7 ctrlEnable false;
            _Btn9 ctrlEnable false;
            _Btn10 ctrlEnable false;

        } else {
            if((!isNull _curTarget) && (_Type isKindOf "Ship") && (alive _curTarget) && (_curTarget distance player < 5) && (speed _curTarget < 1)) then {
                life_pInact_curTarget = _curTarget;

                //Set Repair Button
                _Btn0 ctrlSetText localize "STR_vInAct_Repair";
                _Btn0 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_repairTruck;";

                //Set Owner  Button
                if (playerside == west) then {
                    _Btn1 ctrlSetText localize "STR_vInAct_Registration";
                    _Btn1 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_searchVehAction;";
                } else {
                    _Btn1 ctrlEnable false;
                };

                //Set Search Button
                if (playerside == west) then {
                    _Btn2 ctrlSetText localize "STR_vInAct_SearchVehicle";
                    _Btn2 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_vehInvSearch;";
                } else {
                    _Btn2 ctrlEnable false;
                };

                //Set PullOut Button
                if (playerside == west) then {
                    _Btn3 ctrlSetText localize "STR_vInAct_PullOut";
                    _Btn3 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_pulloutAction;";
                } else {
                    _Btn3 ctrlEnable false;
                };

                //Set Close Button
                _Btn8 ctrlSetText localize "STR_Global_Close";
                _Btn8 buttonSetAction "closeDialog 0;";

                //Set Impound Button
                if (playerside == west) then {
                    _Btn4 ctrlSetText localize "STR_vInAct_Impound";
                    _Btn4 buttonSetAction "closeDialog 0; [] spawn life_fnc_ImpoundAction";
                } else {
                    _Btn4 ctrlEnable false;
                };

                //Set Push Button
                if (_curTarget isKindOf "Ship") then {
                    _Btn6 ctrlSetText localize "STR_vInAct_PushBoat";
                    _Btn6 buttonSetAction "closeDialog 0; [life_pInact_curTarget] spawn life_fnc_pushObject;";
                } else {
                    _Btn6 ctrlEnable false;
                };
                
                if ("D41_Dietrich" in magazines player) then {
                    _Btn5 ctrlSetText localize "STR_Item_Lockpick_Use";
                    _Btn5 buttonSetAction "closeDialog 0; [] spawn life_fnc_lockpick;";
                } else {
                    _Btn5 ctrlEnable false;
                };
                
                _Btn7 ctrlEnable false;
                _Btn9 ctrlEnable false;
                _Btn10 ctrlEnable false;

            } else {
                //Default Menue

                //Set Handy Button
                _Btn0 ctrlSetText localize "STR_PM_CellPhone";
                _Btn0 buttonSetAction "closeDialog 0; createDialog 'Life_cell_phone';";

                //Set KeyChain  Button
                _Btn1 ctrlSetText localize "STR_PM_KeyChain";
                _Btn1 buttonSetAction "closeDialog 0; createDialog 'Life_key_management';";

                //Set Skill Button
                if (playerSide == west) then {
                    _Btn2 ctrlSetText localize "STR_Cop_ZoneMenu";
                    _Btn2 buttonSetAction "closeDialog 0; [] call life_fnc_cop_zoneMenu;";
                } else {
                    _Btn2 ctrlSetText localize "STR_PM_Skill";
                    _Btn2 buttonSetAction "closeDialog 0; [] call life_fnc_D41SkillPunkte;";
                };

                //Set Gang Button
                if (playerside == civilian) then {
                    _Btn3 ctrlSetText localize "STR_Gang_Title";
                    _Btn3 buttonSetAction "closeDialog 0; if(isNil ""life_action_gangInUse"") then {if(isNil {(group player) getVariable ""gang_owner""}) then {createDialog ""Life_Create_Gang_Diag"";} else {[] spawn life_fnc_gangMenu;};};";
                } else {
                    _Btn3 ctrlEnable false;
                };

                //Set Close Button
                _Btn8 ctrlSetText localize "STR_Global_Close";
                _Btn8 buttonSetAction "closeDialog 0;";

                //Set Settings Button
                _Btn4 ctrlSetText localize "STR_Global_Settings";
                _Btn4 buttonSetAction "closeDialog 0; [] call life_fnc_settingsMenu;";

                //Set Wanted Button
                if (playerside == west) then {
                    _Btn5 ctrlSetText localize "STR_Wanted_Title";
                    _Btn5 buttonSetAction "closeDialog 0; [] call life_fnc_wantedMenu;";
                } else {
                    _Btn5 ctrlEnable false;
                };

                //Set Admin Button
                if ((__GETC__(life_adminlevel)) == 0) then {
                    _Btn6 ctrlEnable false;
                } else {
                    _Btn6 ctrlSetText localize "STR_PM_AdminMenu";
                    _Btn6 buttonSetAction "closeDialog 0; createDialog 'life_admin_menu';";
                };

                //Set Save Button
                _Btn7 ctrlSetText localize "STR_PM_SyncData";
                _Btn7 buttonSetAction "closeDialog 0; [] call SOCK_fnc_syncData;";

                //Set Gesten  Button
                if (vehicle player != player) then {
                    _Btn9 ctrlEnable false;
                } else {
                    _Btn9 ctrlSetText localize "STR_PM_Gesture";
                    _Btn9 buttonSetAction "closeDialog 0; [] spawn life_fnc_gesten;";
                };


                //Set Animation Button
                if ( vehicle player != player ) then {
                    _Btn10 ctrlEnable false;
                } else {
                    _Btn10 ctrlSetText localize "STR_PM_Anim";
                    _Btn10 buttonSetAction "closeDialog 0; [] spawn life_fnc_animation;";
                };
            };
        };
    };
};


true 