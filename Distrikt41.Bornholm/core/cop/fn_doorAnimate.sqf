private["_b","_doors","_door"];
_b = _this select 0;
_doors = 1;
_doors = getNumber(configFile >> 'CfgVehicles' >> (typeOf _b) >> 'NumberOfDoors');
_DoorList = [];
for '_i' from 1 to _doors do
	{
		_selPos = _b selectionPosition format['Door_%1_Trigger',_i];
		_worldSpace = _b modelToWorld _selPos;
		if(player distance _worldSpace < 5) then {_DoorList pushback _i;};
	};
	if(count(_DoorList) == 0)exitWith{};
		
	if(_b animationPhase format['door_%1_rot',_DoorList select 0] < 1) then	{{_b animate[format['door_%1_rot',_x],1];}forEach _DoorList;}
	else																		{{_b animate[format['door_%1_rot',_x],0];}forEach _DoorList;};

closeDialog 0;