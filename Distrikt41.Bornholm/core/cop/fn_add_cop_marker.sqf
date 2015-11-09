disableSerialization;
    _dialog     = findDisplay 8010;
    _disp       = _dialog displayCtrl 8011;
    _markername = ctrlText _disp;
closeDialog 0;

clicked = false;
openMap[true, false];
sleep 0.01;
onMapSingleClick "map_pos = _pos;clicked = true;openMap[false,false]; onMapSingleClick """"; false;";
showCommandingMenu "";

waitUntil {clicked};
clicked      = false;
_markername1 = _markername + "_1";
_markername2 = _markername + "_2";
_marker      = createMarker [_markername1, [(map_pos select 0), (map_pos select 1), 0]];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [1000, 1000];
_marker setMarkerBrush "SOLID";
_marker setMarkerColor "ColorWEST";
_marker2 = createMarker [_markername2, [(map_pos select 0), (map_pos select 1), 0]];
_marker2 setMarkerColor "ColorBlack";
_marker2 setMarkerType "mil_warning";
_marker2 setMarkerShape "ICON";
_marker2 setMarkerSize [1,1];
_marker2 setMarkerText " SPERRZONE!";
Cop_Marker pushBack _markername;