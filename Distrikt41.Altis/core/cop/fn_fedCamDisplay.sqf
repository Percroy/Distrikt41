/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint localize "STR_D41_PipNichtAktiv";};
if(isNil "life_fed_scam") then {
	life_fed_scam = "camera" camCreate [0,0,0];
	life_fed_scam camSetFov 0.5;
	life_fed_scam camCommit 0;
	"rendertarget0" setPiPEffect [0];
	life_fed_scam cameraEffect ["INTERNAL", "BACK", "rendertarget0"];
	_laptop setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget0,1.0)"];
};

switch (_mode) do {
	case "bank": {
		life_fed_scam camSetPos [9763.67,5194.43,30.6923];
		life_fed_scam camSetTarget [9745.93,5245.03,0];
		life_fed_scam camCommit 0;
	};
	
	case "handel1": {
		life_fed_scam camSetPos [4758.68,16277.8,73.248];
		life_fed_scam camSetTarget [4744.26,16174.7,0];
		life_fed_scam camCommit 0;
	};
	
	case "handel2": {
		life_fed_scam camSetPos [6094.56,5553.85,72.3102] ;
		life_fed_scam camSetTarget [6092.38,5691.73,0];
		life_fed_scam camCommit 0;
	};
	
	case "markt": {
		life_fed_scam camSetPos [1259.64,7511.63,54.515];
		life_fed_scam camSetTarget [1294.62,7582.22,0];
		life_fed_scam camCommit 0;
	};
	
	case "prison": {
		life_fed_scam camSetPos [10396,9315.79,48.5322];
		life_fed_scam camSetTarget [10383.1,9262.43,2.34035];
		life_fed_scam camCommit 0;
	};
	
	case "off" :{
		life_fed_scam cameraEffect ["terminate", "back"];
		camDestroy life_fed_scam;
		_laptop setObjectTexture [0,""];
		life_fed_scam = nil;
	};
};
