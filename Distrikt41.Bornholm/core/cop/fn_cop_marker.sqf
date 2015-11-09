RNX_fnc_openSperrzonenMenu =
compileFinal "
    closeDialog 0;

    disableSerialization;
    _handle = createDialog ""life_cop_sperrzone"";
    waitUntil {!isNull (findDisplay 8000)};
    _display  = findDisplay 8000;
    _vehicles = _display displayCtrl 8001;
    lbClear _vehicles;

    if((count Cop_Marker) > 0) then {
        for ""_i"" from 0 to ((count Cop_Marker) -1) do
        {
            _markers = Cop_Marker select _i;
            _array   = _vehicles lbAdd format[""%1 - Sperrzone: %2"",(_i + 1), _markers];
            _vehicles lbSetData [(_i + 1), str(_i)];
        };
    } else {
        _del_button = _display displayCtrl 8002;
        _Del_button ctrlShow false;
        _vehicles lbAdd format[""%1 -= Keine Sperrzonen vorhanden! =-"", ""           ""];
    };
";
publicVariable "RNX_fnc_openSperrzonenMenu";

RNX_fnc_createSperrzoneName =
compileFinal "
    closeDialog 0;
    disableSerialization;
    _handle = createDialog ""life_cop_sperrzone_name"";
    waitUntil {!isNull (findDisplay 8010)};
    ctrlSetText[8011, ""Name""];
";
publicVariable "RNX_fnc_createSperrzoneName";

RNX_fnc_deleteSperrzone = 
compileFinal "
    disableSerialization;
    _dialog = findDisplay 8000;
    _list   = _dialog displayCtrl 8001;
    _sel    = lbCurSel _list;
    
    _markername = (Cop_Marker select _sel);
    
    _markername1 = format [""%1_1"", _markername];
    _markername2 = format [""%1_2"", _markername];
    deleteMarker _markername1;
    deleteMarker _markername2;

    Cop_Marker = Cop_Marker - [_markername];
";
publicVariable "RNX_fnc_deleteSperrzone";