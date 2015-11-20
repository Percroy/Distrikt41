//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_ExportRopeCheck.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Verhindert, das Fahrzeuge zum Export Handel transportiert werden. (NUR mit Trawler möglich)
//::::::::::::  ::::::::::::\\
private["_Veh"];

while{true}do
	{
		waitUntil{sleep 2; (((vehicle player distance ExporthandelBoje) < 5500) && (count(ropes vehicle player) != 0))};
		
		_Veh = vehicle player;
		if( (driver _Veh == player) OR (_Veh turretUnit [0] == player) )then
		{
			D41_ExpCheckMsg = true;
			[] spawn
			{
				while{D41_ExpCheckMsg}do
				{
					if(vehicle player turretUnit [0] == player && (!IsNull (driver vehicle player)) )exitWith{};
					hint localize "STR_D41_WarnungRopeFehlfunktion";
					systemchat localize "STR_D41_WarnungRopeFehlfunktion";
					sleep 5;
				};
			};
			
			waitUntil{sleep 1; ( ((_Veh distance ExporthandelBoje) < 4000) OR (count(ropes _Veh) == 0) OR ((_Veh distance ExporthandelBoje) > 5500) OR (isNull _Veh) OR (count(ropeAttachedObjects _veh) == 0) )};
			if(isNull _Veh)exitWith{D41_ExpCheckMsg = false;};
			if(count(ropeAttachedObjects _veh) == 0)exitWith{D41_ExpCheckMsg = false;};
			if(count(ropes _Veh) == 0)exitWith{D41_ExpCheckMsg = false;};
			if((_Veh distance ExporthandelBoje) > 5500)exitWith{D41_ExpCheckMsg = false;};
			D41_ExpCheckMsg = false;
			
			if(_Veh turretUnit [0] == player && (!IsNull (driver _Veh)) )exitWith{};
			
			_MultiRopes = false;
			_counter = 1;
			_LostCargo = false;
			if(count(ropes _Veh) > 4)then{_MultiRopes = true};
			
			for "_i" from 1 to 4 do
			{
				_time = time;
				waitUntil{sleep 0.2; (((time-_time) > (10+(round(random 10)))) OR (count(ropeAttachedObjects _veh) == 0) OR ((_Veh distance ExporthandelBoje) > 4000))};
				
				if(count(ropeAttachedObjects _veh) == 0)exitWith{_LostCargo = true;};
				if((_Veh distance ExporthandelBoje) > 4000)exitWith{};
				
				ropeCut [(ropes(_Veh) select (_counter - 1)), (random 5)];
				if(_MultiRopes)then{ropeCut [(ropes(_Veh) select (_counter + 3)), (random 5)];};
				
				hint format [localize "STR_D41_RopeVerloren",_counter];
				systemchat format [localize "STR_D41_RopeVerloren",_counter];
				_counter = _counter + 1;
			};
			if(_LostCargo)then{{ropeDestroy _x}forEach (ropes(_Veh)); _Text = localize "STR_D41_RopeLadungVerloren"; hint _Text; systemchat _Text; systemchat _Text;};
		};
	};