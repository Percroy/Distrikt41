/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
D41_isWpnProdShop = false;
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop == "cop" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "copitems" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "med" && playerSide != independent) exitWith {hint localize "STR_NOTF_NotAMedic"};
if(_shop == "market" && life_D41_Karma < -8000) exitWith {hint format [localize "STR_Shop_Nokarma"];};
if(_shop == "fishmarket" && life_D41_Karma < -5000) exitWith {hint format [localize "STR_Shop_Nokarma"];};
if(_shop == "adac" && playerSide != independent) exitWith {hint format [localize "STR_Shop_NotaDMV"];};
if(_shop == "gunstore" && (life_D41_Karma <= -2000)) exitWith {hint format [localize "STR_Shop_criminal", life_D41_Karma];};
if(_shop == "rebel" && !license_civ_rebel) exitWith {hint format [localize "STR_Shop_NotaReb"];};
if(_shop == "rebelnorth" && !license_civ_rebel) exitWith {hint format [localize "STR_Shop_NotaReb"];};
if(_shop == "rebelsouth" && !license_civ_rebel) exitWith {hint format [localize "STR_Shop_NotaReb"];};
if(_shop == "firmaitems" && !license_cop_gangfirma) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "firmawaffen" && !license_cop_gangfirma) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "firmapiloten" && !license_cop_gangfirma) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "gangdmw" && !license_civ_gangdmw) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "gangdmw_waffen" && !license_civ_gangdmw) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "base_01" && !license_civ_base01) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "base_01_waffen" && !license_civ_base01) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "base_02" && !license_civ_base02) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "base_02_waffen" && !license_civ_base02) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "base_03" && !license_civ_base03) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "base_03_waffen" && !license_civ_base03) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "base_04" && !license_civ_base04) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "base_04_waffen" && !license_civ_base04) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "base_05" && !license_civ_base05) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "base_05_waffen" && !license_civ_base05) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "base_06" && !license_civ_base06) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "base_06_waffen" && !license_civ_base06) exitWith {hint format [localize "STR_Shop_NotaGang"];};
if(_shop == "herowaffen" && !license_civ_gun) exitWith {hint format [localize "STR_Shop_Veh_NoLicense"];};
if(_shop == "leichtepistolen" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "mittlerepistolen" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "schwerepistolen" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "pistolenattachments" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "leichtemps" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "mittleremps" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "schweremps" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "mpattachments" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "sturmleicht" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "sturmmittel" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "sturmschwer" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "sniperleicht" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "snipermittel" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "sniperschwer" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "mgleicht" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "mgmittel" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "mgschwer" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "rpg" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "schrot" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "sonstiges" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "schalli" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "llm" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "cqb" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "mid" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};
if(_shop == "long" && ((call life_adminlevel) < 1)) exitWith {hint format [localize "STR_Shop_No_DMW"];};

//WpnProd - Vorbereitung - Einbindung folgt später
if(_shop == "WpnProdRebel" && (playerSide in [civilian]) && !license_civ_rebel)exitWith{};
if(_shop == "WpnProdHero" && (playerSide in [civilian]) && (!(life_D41_Karma > 2000) OR !license_civ_WKompL))exitWith{};
//WpnProd - Wenn alle Bedingungen gegeben, dann "D41_isWpnProdShop = true"
if(_shop == "WpnProdRebel" && (playerSide in [civilian]) && license_civ_rebel)then{D41_isWpnProdShop = true};
if(_shop == "WpnProdHero" && (playerSide in [civilian]) && (life_D41_Karma > 2000) && license_civ_WKompL)then{D41_isWpnProdShop = true};

createDialog "D41_Shop";
[] call life_fnc_virt_update;