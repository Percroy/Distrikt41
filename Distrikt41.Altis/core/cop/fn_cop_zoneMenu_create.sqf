/*
 * D41 Cop Zone Menu
 */
disableSerialization;

// script
private ["_markerPosMiddle","_markerBaseName","_markerA","_markerT","_radius"];
params [
    ["_zoneName", "", [""]],
    ["_radius", "0", [""]]
];

D41_Cop_Zones_Clicked = false;
openMap [true, true];
onMapSingleClick "D41_Cop_Zones_MapPos = _pos; D41_Cop_Zones_Clicked = true; openMap [false, false]; onMapSingleClick """"; false";

waitUntil {
    sleep 0.1;
    (D41_Cop_Zones_Clicked)
};
D41_Cop_Zones_Clicked = false;
_markerPosMiddle = D41_Cop_Zones_MapPos;
D41_Cop_Zones_MapPos = nil;

_zoneName = format ["%1 - %2", profileName, _zoneName];
_markerBaseName = format ["D41_Marker_%1_%2", _zoneName, time];
_radius = (parseNumber _radius) max 5;

_markerA = createMarker [format["%1_A", _markerBaseName], _markerPosMiddle];
_markerA setMarkerShape "ELLIPSE";
_markerA setMarkerSize [_radius, _radius];
_markerA setMarkerBrush "SOLID";
_markerA setMarkerColor "ColorWEST";
[_markerA, true] call CBA_fnc_setMarkerPersistent;

_markerT = createMarker [format["%1_T", _markerBaseName], _markerPosMiddle];
_markerT setMarkerColor "ColorBlack";
_markerT setMarkerType "mil_warning";
_markerT setMarkerShape "ICON";
_markerT setMarkerSize [1,1];
_markerT setMarkerText "SPERRZONE!";
[_markerT, true] call CBA_fnc_setMarkerPersistent;


// register
D41_Cop_Zones pushBack [_markerBaseName, _zoneName];
publicVariable "D41_Cop_Zones";


true 