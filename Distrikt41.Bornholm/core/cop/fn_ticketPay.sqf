/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(D41_Geld < life_ticket_val) exitWith
{
	if((D41_atmGeld - 15000) < life_ticket_val) exitWith 
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		[[0,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]],"life_fnc_broadcast",west,false] call life_fnc_MP;
		closeDialog 0;
	};
	hint format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call life_fnc_numberText];
	D41_atmGeld = D41_atmGeld - life_ticket_val;
	life_ticket_paid = true;
	[[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] call life_fnc_MP;
	[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"life_fnc_broadcast",life_ticket_cop,false] call life_fnc_MP;
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] call life_fnc_MP;
	closeDialog 0;
};

D41_Geld = D41_Geld - life_ticket_val;
life_ticket_paid = true;

[[getPlayerUID player],"life_fnc_wantedRemove",false,false] call life_fnc_MP;
[[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] call life_fnc_MP;
closeDialog 0;
[[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]],"life_fnc_broadcast",life_ticket_cop,false] call life_fnc_MP;