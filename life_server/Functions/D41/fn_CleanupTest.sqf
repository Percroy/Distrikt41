	sleep 120;
	_cnt = count allMissionObjects "";
	diag_log format ["CleanupTEST -PRE- ItemCount: %1", _cnt];

	_AllItems = allMissionObjects "All";
	{
		if(!(_x in _AllItems))then{deleteVehicle _x};
		//diag_log format ["%1", _x];
	}foreach allMissionObjects "";

	_cnt = count allMissionObjects "";
	diag_log format ["CleanupTEST -POST- ItemCount: %1", _cnt];