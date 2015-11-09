//::::::::::::  ::::::::::::\\
//	Filename: D41/fn_D41_AnimLoop.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Loop der Animationen halt, nä?
//::::::::::::  ::::::::::::\\

private["_AnimFinished"];

_AnimFinished = true;
while{true} do
{
	if(!life_action_inUse)exitWith{};
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then
	{
		if(_AnimFinished)then
		{
			_AnimFinished = false;
			player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
			sleep 0.75;
			_AnimFinished = true;
		};
	};
};