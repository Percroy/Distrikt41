/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			case "driver": {_var = "license_civ_driver"}; //Drivers License cost
			case "boat": {_var = "license_civ_boat"}; //Boating license cost
			case "pilot": {_var = "license_civ_air"}; //Pilot/air license cost
			case "gun": {_var = "license_civ_gun"}; //Firearm/gun license cost
			case "dive": {_var = "license_civ_dive"}; //Diving license cost
			case "oil": {_var = "license_civ_oil"}; //Oil processing license cost
			case "cair": {_var = "license_cop_air"}; //Cop Pilot License cost
			case "swat": {_var = "license_cop_swat"}; //Swat License cost
			case "cg": {_var = "license_cop_cg"}; //Coast guard license cost
			case "heroin": {_var = "license_civ_heroin"}; //Heroin processing license cost
			case "marijuana": {_var = "license_civ_marijuana"}; //Marijuana processing license cost
			case "medmarijuana": {_var = "license_civ_medmarijuana"}; //Medical Marijuana processing license cost
			case "gang": {_var = "license_civ_gang"}; //Gang license cost
			case "rebel": {_var = "license_civ_rebel"}; //Rebel License
			case "truck":{_var = "license_civ_truck"}; //Truck License
			case "diamond": {_var = "license_civ_diamond"};
			case "salt": {_var = "license_civ_salt"};
			case "cocaine": {_var = "license_civ_coke"};
			case "sand": {_var = "license_civ_sand"};
			case "iron": {_var = "license_civ_iron"};
			case "copper": {_var = "license_civ_copper"};
			case "mair": {_var = "license_med_air"};
			case "adac": {_var = "license_med_adac"};
			case "home": {_var = "license_civ_home"};
			//DistriktLizenzen
			case "bjerky": {_var = "license_civ_bjerky"};
			case "Dosenfisch": {_var = "license_civ_Dosenfisch"};
			case "coal": {_var = "license_civ_coal"};
			case "meth": {_var = "license_civ_meth"};
			case "BruchsteinL": {_var = "license_civ_Bruchstein"};
			case "gangdmw": {_var = "license_civ_gangdmw"};
			case "base01": {_var = "license_civ_base01"};
			case "base02": {_var = "license_civ_base02"};
			case "base03": {_var = "license_civ_base03"};
			case "base04": {_var = "license_civ_base04"};
			case "base05": {_var = "license_civ_base05"};
			case "base06": {_var = "license_civ_base06"};
			case "gangfirma": {_var = "license_cop_gangfirma"};
			case "Schnaps": {_var = "license_civ_Schnaps"};
			case "Saft": {_var = "license_civ_Saft"};
			case "Zement": {_var = "license_civ_Zement"};
			case "Stahl": {_var = "license_civ_Stahl"};
			case "Krabben": {_var = "license_civ_Krabben"};
			case "WKompL": {_var = "license_civ_WKompL"};
			case "FahrzeugT": {_var = "license_civ_FahrzeugT"};
			case "KerosinL": {_var = "license_civ_Kerosin"};
			case "TonL": {_var = "license_civ_Ton"};
			default {_var = ""};
		};
	};
	
	case 1:
	{
		switch (_type) do
		{
			case "license_civ_driver": {_var = "driver"}; //Drivers License cost
			case "license_civ_boat": {_var = "boat"}; //Boating license cost
			case "license_civ_air": {_var = "pilot"}; //Pilot/air license cost
			case "license_civ_gun": {_var = "gun"}; //Firearm/gun license cost
			case "license_civ_dive": {_var = "dive"}; //Diving license cost
			case "license_civ_oil": {_var = "oil"}; //Oil processing license cost
			case "license_cop_air": {_var = "cair"}; //Cop Pilot License cost
			case "license_cop_swat": {_var = "swat"}; //Swat License cost
			case "license_cop_cg": {_var = "cg"}; //Coast guard license cost
			case "license_civ_heroin": {_var = "heroin"}; //Heroin processing license cost
			case "license_civ_marijuana": {_var = "marijuana"}; //Marijuana processing license cost
			case "license_civ_medmarijuana": {_var = "medmarijuana"}; //Medical Marijuana processing license cost
			case "license_civ_gang": {_var = "gang"}; //Gang license cost
			case "license_civ_rebel": {_var = "rebel"}; //Rebel License
			case "license_civ_truck":{_var = "truck"}; //Truck License
			case "license_civ_diamond": {_var = "diamond"}; //Diamanten verarbeiten
			case "license_civ_salt": {_var = "salt"}; //Salz verarbeiten
			case "license_civ_coke": {_var = "cocaine"}; //Kokain verarbeiten
			case "license_civ_sand": {_var = "sand"}; //Sand verarbeiten
			case "license_civ_iron": {_var = "iron"}; //Eisen schmieden
			case "license_civ_copper": {_var = "copper"}; //Kupfer verarbeiten
			case "license_med_air": {_var = "mair"}; //Medic Fluglizenz
			case "license_med_adac": {_var = "adac"}; //ADAC Lizenz
			case "license_civ_home": {_var = "home"}; //Eigentumsurkunde
			//DistriktLizenzen
			case "license_civ_bjerky": {_var = "bjerky"}; //Rohes Fleisch herstellen
			case "license_civ_Dosenfisch": {_var = "Dosenfisch"}; //Eingelegten Fisch herstellen
			case "license_civ_coal": {_var = "coal"}; //Kohle verarbeiten
			case "license_civ_meth": {_var = "meth"}; //Meth herstellen
			case "license_civ_Schnaps": {_var = "Schnaps"}; //Schnaps brennen
			case "license_civ_Saft": {_var = "Saft"}; //Saft pressen
			case "license_civ_Bruchstein": {_var = "BruchsteinL"}; //Bruchstein verarbeiten
			case "license_civ_Zement": {_var = "Zement"}; //Zement mischen
			case "license_civ_Stahl": {_var = "Stahl"}; //Stahl schmieden
			case "license_civ_Krabben": {_var = "Krabben"}; //Krabbenfischen
			case "license_civ_WKompL": {_var = "WKompL"}; //Waffenkomponenten herstellen
			case "license_civ_FahrzeugT": {_var = "FahrzeugT"}; //Fahrzeugteile herstellen
			case "license_civ_Kerosin": {_var = "KerosinL"}; //Kerosin raffinieren
			case "license_civ_Ton": {_var = "TonL"}; //Ton brennen
			//D41 Gruppen
			case "license_civ_gangdmw": {_var = "gangdmw"}; //DMW Lizenz
			case "license_cop_gangfirma": {_var = "gangfirma"}; //Die Firma Lizenz
			case "license_civ_base01": {_var = "base01"}; //Gangbase 01 Banditen BL
			case "license_civ_base02": {_var = "base02"}; //Gangbase 02 Banditen AP
			case "license_civ_base03": {_var = "base03"}; //Gangbase 03 Neutral 
			case "license_civ_base04": {_var = "base04"}; //Gangbase 04 Neutral HdA
			case "license_civ_base05": {_var = "base05"}; //Gangbase 05 Hero
			case "license_civ_base06": {_var = "base06"}; //Gangbase 06 Hero IHV
			
			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;