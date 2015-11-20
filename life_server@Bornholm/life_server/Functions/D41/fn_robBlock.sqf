


private["_time"];
_Wert = param[0,true,[true]];
if(D41_AllChemBlocked && _Wert)exitWith{};

D41_AllChemBlocked = _Wert;
publicVariable "D41_AllChemBlocked";
if(!D41_AllChemBlocked)exitWith{};

_time = time;
waitUntil{sleep 2; (((time - _time) > (30 * 60)) OR !D41_AllChemBlocked)};

if(!D41_AllChemBlocked)exitWith{};
D41_AllChemBlocked = false;
publicVariable "D41_AllChemBlocked";