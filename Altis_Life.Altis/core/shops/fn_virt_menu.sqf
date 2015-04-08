/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop == "cop" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "copitems" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "med" && playerSide != independent) exitWith {hint localize "STR_NOTF_NotAMedic"};
if(_shop == "market" && life_D41_Karma < -4000) exitWith {hint format ["Du hast nicht genug Karma, um in diesem Markt kaufen zu können. Karma: %1", life_D41_Karma];};
if(_shop == "fishmarket" && life_D41_Karma < -5000) exitWith {hint format ["Du hast nicht genug Karma, um in diesem Markt kaufen zu können. Karma: %1", life_D41_Karma];};
if(_shop == "adac" && !license_med_adac && playerSide != independent) exitWith {hint format ["Du bist kein ADAC-Mitarbeiter"];};
if(_shop == "gunstore" && (life_D41_Karma <= -2000)) exitWith {hint format ["Deine Polizeiakte ist zu dick, hier bekommst Du keine Waffen (Nur Karma > -2000). Karma: %1", life_D41_Karma];};
if(_shop == "rebel" && !license_civ_rebel) exitWith {hint format ["Du bist kein Rebellenmitglied."];};
if(_shop == "rebelnorth" && !license_civ_rebel) exitWith {hint format ["Du bist kein Rebellenmitglied."];};
if(_shop == "rebelsouth" && !license_civ_rebel) exitWith {hint format ["Du bist kein Rebellenmitglied."];};
if(_shop == "firmaitems" && !license_cop_gangfirma) exitWith {hint format ["Du bist kein Firma-Mitglied."];};
if(_shop == "firmawaffen" && !license_cop_gangfirma) exitWith {hint format ["Du bist kein Firma-Mitglied."];};
if(_shop == "firmapiloten" && !license_cop_gangfirma) exitWith {hint format ["Du bist kein Firma-Mitglied."];};
if(_shop == "gangdmw" && !license_civ_gangdmw) exitWith {hint format ["Du bist kein DMW-Mitglied."];};
if(_shop == "gangdmw_waffen" && !license_civ_gangdmw) exitWith {hint format ["Du bist kein DMW-Mitglied."];};
if(_shop == "gangpow" && !license_civ_gangpow) exitWith {hint format ["Du bist kein PowMia-Mitglied."];};
if(_shop == "gangpow_waffen" && !license_civ_gangpow) exitWith {hint format ["Du bist kein PowMia-Mitglied."];};
if(_shop == "herowaffen" && !license_civ_gun) exitWith {hint format ["Du hast keinen Waffenschein."];};
if(_shop == "leichtepistolen" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "mittlerepistolen" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "schwerepistolen" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "pistolenattachments" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "leichtemps" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "mittleremps" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "schweremps" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "mpattachments" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "sturmleicht" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "sturmmittel" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "sturmschwer" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "sniperleicht" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "snipermittel" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "sniperschwer" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "mgleicht" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "mgmittel" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "mgschwer" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "rpg" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "schrot" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "sonstiges" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "schalli" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "llm" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "cqb" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "mid" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
if(_shop == "long" && ((call life_adminlevel) < 2)) exitWith {hint format ["Du bist kein Trusted Waffendealer."];};
createDialog "D41_Shop";

[] call life_fnc_virt_update;