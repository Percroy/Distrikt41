

_query = format["LeaveGang:%1",(_this select 0)];
//waitUntil{!DB_Async_Active};
[_query] spawn DB_fnc_asyncCall;