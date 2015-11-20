life_fnc_sidechat =
compileFinal "
	if(life_sidechat) then {life_sidechat = false;} else {life_sidechat = true;};
	[[player,life_sidechat,playerSide],""TON_fnc_managesc"",false,false] call life_fnc_MP;
	[] call life_fnc_settingsMenu;
";

publicVariable "life_fnc_sidechat";

TON_fnc_index =
compileFinal "
	private[""_item"",""_stack""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item in _x) exitWith {
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
";

TON_fnc_player_query =
compileFinal "
	private[""_ret""];
	_ret = _this select 0;
	if(isNull _ret) exitWith {};
	if(isNil ""_ret"") exitWith {};
	
	[[D41_atmGeld,D41_Geld,owner player,player],""life_fnc_admininfo"",_ret,false] call life_fnc_MP;
";
publicVariable "TON_fnc_player_query";

publicVariable "TON_fnc_index";

TON_fnc_clientWireTransfer =
compileFinal "
	private[""_unit"",""_val"",""_from""];
	_val = _this select 0;
	_from = _this select 1;
	if(!([str(_val)] call TON_fnc_isnumber)) exitWith {};
	if(_from == """") exitWith {};
	D41_atmGeld = D41_atmGeld + _val;
	hint format[localize ""STR_D41_wire_transerred"",_from,[_val] call life_fnc_numberText];
	
";
publicVariable "TON_fnc_clientWireTransfer";

TON_fnc_isnumber =
compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;
	
	{
		if(_x in _valid) then	
		{}
		else
		{
			_return = false;
		};
	} foreach _array;
	_return;
";

publicVariable "TON_fnc_isnumber";

TON_fnc_clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		life_my_gang = ObjNull;
		sleep 1;
		[player] joinSilent (createGroup civilian);
		hint localize ""STR_D41_Kick_Gang"";
		
	};
";
publicVariable "TON_fnc_clientGangKick";

TON_fnc_clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit"",""_giver""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_giver = _this select 2;
	if(isNil ""_unit"" OR isNil ""_giver"") exitWith {};
	if(player == _unit && !(_vehicle in life_vehicles)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		hint format[""%1 has given you keys for a %2"",_giver,_name];
		life_vehicles pushBack _vehicle;
		[[getPlayerUID player,playerSide,_vehicle,1],""TON_fnc_keyManagement"",false,false] call life_fnc_MP;
	};
";
publicVariable "TON_fnc_clientGetKey";

TON_fnc_clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		player setRank ""COLONEL"";
		_group selectLeader _unit;
		hint localize localize ""STR_D41_Gang_Leader_now"";
	};
";

publicVariable "TON_fnc_clientGangLeader";

//Cell Phone Messaging

//To EMS
TON_fnc_cell_emsrequest = 
compileFinal "
private[""_msg"",""_to""];
	ctrlShow[3022,false];
	_msg = ctrlText 3003;
	_to = ""EMS Units"";
	if(_msg == """") exitWith {hint localize ""STR_D41_Need_Msg"";ctrlShow[3022,true];};
		
	[[_msg,name player,5,player],""TON_fnc_clientMessage"",independent,false] call life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[localize ""STR_D41_MSG_EMS"",_to,_msg];
	ctrlShow[3022,true];
";
//To One Person
TON_fnc_cell_textmsg =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3015,false];
	_msg = ctrlText 3003;
	if(lbCurSel 3004 == -1) exitWith {hint localize ""STR_D41_MSG_Need_Per""; ctrlShow[3015,true];};
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {ctrlShow[3015,true];};
	if(isNil ""_to"") exitWith {ctrlShow[3015,true];};
	if(_msg == """") exitWith {hint localize ""STR_D41_Need_Msg"";ctrlShow[3015,true];};
	
	[[_msg,name player,0,player],""TON_fnc_clientMessage"",_to,false] call life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[localize ""STR_D41_MSG_Sent"",name _to,_msg];
	ctrlShow[3015,true];
";
//To All Cops
TON_fnc_cell_textcop =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3016,false];
	_msg = ctrlText 3003;
	_to = localize ""STR_D41_the_Police"";
	if(_msg == """") exitWith {hint localize ""STR_D41_Need_Msg"";ctrlShow[3016,true];};
		
	[[_msg,name player,1,player],""TON_fnc_clientMessage"",true,false] call life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[localize ""STR_D41_MSG_Sent"",_to,_msg];
	ctrlShow[3016,true];
";
//To All Admins
TON_fnc_cell_textadmin =
compileFinal "
	private[""_msg"",""_to"",""_from""];
	ctrlShow[3017,false];
	_msg = ctrlText 3003;
	_to = localize ""STR_D41_the_Admins"";
	if(_msg == """") exitWith {hint localize ""STR_D41_Need_Msg"";ctrlShow[3017,true];};
		
	[[_msg,name player,2,player],""TON_fnc_clientMessage"",true,false] call life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[localize ""STR_D41_MSG_Sent"",_to,_msg];
	ctrlShow[3017,true];
";
//Admin To One Person
TON_fnc_cell_adminmsg =
compileFinal "
	if(isServer) exitWith {};
	if((call life_adminlevel) < 1) exitWith {hint localize ""STR_ANOTF_ErrorLevel"";};
	private[""_msg"",""_to""];
	_msg = ctrlText 3003;
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {};
	if(_msg == """") exitWith {hint localize ""STR_D41_Need_Msg"";};
	
	[[_msg,name player,3,player],""TON_fnc_clientMessage"",_to,false] call life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[localize ""STR_D41_MSG_Admin"",name _to,_msg];
";
//Admin Nachricht an Alle
TON_fnc_cell_adminmsgall =
compileFinal "
	if(isServer) exitWith {};
	if((call life_adminlevel) < 1) exitWith {hint localize ""STR_ANOTF_ErrorLevel"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint localize ""STR_D41_Need_Msg"";};
	
	[[_msg,name player,4,player],""TON_fnc_clientMessage"",true,false] call life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[localize ""STR_D41_MSG_ALL_ADMIN"",_msg];
";
//Polizei an alle
TON_fnc_cell_copmsgall =
compileFinal "
	if(isServer) exitWith {};
	if((call life_coplevel) < 1) exitWith {hint localize ""STR_NOTF_NotACop"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint localize ""STR_D41_Need_Msg"";};
	
	[[_msg,name player,6,player],""TON_fnc_clientMessage"",true,false] call life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[localize ""STR_D41_MSG_POLICE_ALL"",_msg];
";

publicVariable "TON_fnc_cell_textmsg";
publicVariable "TON_fnc_cell_textcop";
publicVariable "TON_fnc_cell_textadmin";
publicVariable "TON_fnc_cell_adminmsg";
publicVariable "TON_fnc_cell_adminmsgall";
publicVariable "TON_fnc_cell_emsrequest";
publicVariable "TON_fnc_cell_copmsgall";
//Client Message
/*
	0 = private message
	1 = police message
	2 = message to admin
	3 = message from admin
	4 = admin message to all
*/
TON_fnc_clientMessage =
compileFinal "
	if(isServer) exitWith {};
	private[""_msg"",""_from"", ""_from2"", ""_type""];
	_msg = _this select 0;
	_from = _this select 1;
	_type = _this select 2;
	_from2 = _this select 3;
	if(_from == """") exitWith {};
	switch (_type) do
	{
		case 0 :
		{
			private[""_message""];
			if(!(call life_fnc_D41_PlyrHandyCheck)) exitWith {[[0,format[localize ""STR_D41_Target_no_Phone"",profileName]],""life_fnc_broadcast"",_from2,false] call life_fnc_MP; hint ""Du hättest eine Nachricht bekommen. Da Du aber kein Handy besitzt, ging diese ins leere!"";};
			_message = format["">>>NACHRICHT VON %1: %2"",_from,_msg];
			_Text = parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>New SMS<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Dich<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			hint _Text;
			D41_LastMsg = _Text;
			
			[""TextMessage"",[format[localize ""STR_D41_MSG_Received"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 1 :
		{
			if(side player != west) exitWith {};
			private[""_message""];
			if(!(call life_fnc_D41_PlyrHandyCheck)) exitWith {[[0,format[localize ""STR_D41_Target_no_Phone"",profileName]],""life_fnc_broadcast"",_from2,false] call life_fnc_MP; hint ""Du hättest eine Nachricht bekommen. Da Du aber kein Handy besitzt, ging diese ins leere!"";};
			_message = format[""---NOTRUF von %1: %2"",_from,_msg];
			_Text = parseText format [""<t color='#316dff'><t size='2'><t align='center'>New Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Alle Polizisten<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			hint _Text;
			D41_LastMsg = _Text;
			
			
			[""PoliceDispatch"",[format[localize ""STR_D41_Police_inquiry"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 2 :
		{
			if((call life_adminlevel) < 1) exitWith {};
			private[""_message""];
			_message = format[""???ADMIN REQUEST From %1: %2"",_from,_msg];
			_Text = parseText format [""<t color='#ffcefe'><t size='2'><t align='center'>Admin Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Admins<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			hint  _Text;
			D41_LastMsg = _Text;
			
			[""AdminDispatch"",[format[localize ""STR_D41_MSG_Need_Admin"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 3 :
		{
			private[""_message""];
			_message = format[""!!!ADMIN NACHRICHT: %1"",_msg];
			_admin = format[""Sent by admin: %1"", _from];
			_Text = parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Dich<br/><t color='#33CC33'>From: <t color='#ffffff'>To Admin<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1"",_msg];
			hint _Text;
			D41_LastMsg = _Text;
			
			[""AdminMessage"",[localize ""STR_D41_Received_Admin_msg""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};
		
		case 4 :
		{
			private[""_message"",""_admin""];
			_message = format[""!!!ADMIN Message: %1"",_msg];
			_admin = format[""Sent by admin: %1"", _from];
			_Text = parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Players<br/><t color='#33CC33'>From: <t color='#ffffff'>The Admins<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1"",_msg];
			hint _Text;
			D41_LastMsg = _Text;
			
			[""AdminMessage"",[localize ""STR_D41_Received_Admin_msg""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};
		
		case 5: {
			private[""_message""];
			_message = format[""!!!EMS REQUEST: %1"",_msg];
			_Text = parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>EMS Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Dich<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			hint _Text;
			D41_LastMsg = _Text;
			
			[""TextMessage"",[format[""EMS Request from %1"",_from]]] call bis_fnc_showNotification;
		};
		
		case 6: {
			private[""_message""];
			_from = localize ""STR_D41_MSG_Police_Channel"";
			_message = format[localize ""STR_D41_Police_Channel_MSG"",_msg];
			_Text = parseText format [""<img size='10' color='#ffffff' image='D41\D41_T\Texturen\Schilder\PolSymbol.paa'/><br/><t color='#316dff'><t size='2'><t align='center'>INFO CHANNEL<br/>Distrikt41 PD<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Player<br/><t color='#33CC33'>From: <t color='#ffffff'>Public Police Info Channel<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2"",_from,_msg];
			hint _Text;
			D41_LastMsg = _Text;
			
			[""PoliceDispatch"",[format[localize ""STR_D41_MSG_Police_Channel""]]] call bis_fnc_showNotification;
			systemChat _message;
		};
	};
";
publicVariable "TON_fnc_clientMessage";
