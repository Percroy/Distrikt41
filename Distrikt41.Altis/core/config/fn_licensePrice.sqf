/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {500}; //Drivers License cost
	case "boat": {5000}; //Boating license cost
	case "pilot": {25000}; //Pilot/air license cost
	case "gun": {25000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "oil": {30000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {1000}; //Swat License cost
	case "cg": {1500}; //Coast guard license cost
	case "heroin": {75000}; //Heroin processing license cost
	case "marijuana": {45000}; //Marijuana processing license cost
	case "medmarijuana": {35000}; //Medical Marijuana processing license cost
	case "gang": {10000}; //Gang license cost
	case "rebel": {150000}; //Rebel license cost
	case "truck": {12500}; //Truck license cost
	case "diamond": {50000};
	case "salt": {3500};
	case "cocaine": {60000};
	case "sand": {8500};
	case "iron": {22000};
	case "copper": {20000};
	case "mair": {25000};
	case "home": {25000};
	//DistriktLizenzen
	case "bjerky": {2500};
	case "coal": {15000};
	case "Schnaps": {25000};
	case "BruchsteinL": {15000};
	case "Saft": {10000};
	case "Dosenfisch": {25000};
	case "Zement": {25000};
	case "Stahl": {150000};
	case "meth": {250000};
	case "Krabben": {2000000};
	case "WKompL": {150000};
	case "FahrzeugT": {450000};
	case "KerosinL": {55000};
	case "TonL": {25000};
};