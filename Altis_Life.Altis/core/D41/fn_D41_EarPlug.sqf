//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_EarPlug.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Ohrenstöpsel halt, nä?
//::::::::::::  ::::::::::::\\

1 fadeSound 0.2;
D41_EarPlugInUse = true;
waitUntil{!(vehicle player isKindOf "Air") OR (!D41_EarPlugInUse)};
waitUntil{!(vehicle player isKindOf "Car") OR (!D41_EarPlugInUse)};
waitUntil{!(vehicle player isKindOf "Ship") OR (!D41_EarPlugInUse)};
1 fadeSound 1;
D41_EarPlugInUse = false;