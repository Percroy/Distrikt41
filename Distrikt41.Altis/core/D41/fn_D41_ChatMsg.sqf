//::::::::::::  ::::::::::::\\
//	Filename: core/D41/fn_D41_ChatMsg.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Shortcut Nachrichten anzeigen
//::::::::::::  ::::::::::::\\
private["_mode"];
_mode = _this select 0;

//localize noch machen
switch(true)do
{
	case(_mode == 1): {hint localize "STR_D41_ShortCut_Text_1"; systemchat localize "STR_D41_ShortCut_Text_1"; titleText[localize "STR_D41_ShortCut_Text_1","PLAIN"];};
	case(_mode == 2): {hint localize "STR_D41_ShortCut_Text_2"; systemchat localize "STR_D41_ShortCut_Text_2"; titleText[localize "STR_D41_ShortCut_Text_2","PLAIN"];};
	case(_mode == 3): {hint localize "STR_D41_ShortCut_Text_3"; systemchat localize "STR_D41_ShortCut_Text_3"; titleText[localize "STR_D41_ShortCut_Text_3","PLAIN"];};
	case(_mode == 4): {hint localize "STR_D41_ShortCut_Text_4"; systemchat localize "STR_D41_ShortCut_Text_4"; titleText[localize "STR_D41_ShortCut_Text_4","PLAIN"];};
	case(_mode == 5): {hint localize "STR_D41_ShortCut_Text_5"; systemchat localize "STR_D41_ShortCut_Text_5"; titleText[localize "STR_D41_ShortCut_Text_5","PLAIN"];};
	default{};
};