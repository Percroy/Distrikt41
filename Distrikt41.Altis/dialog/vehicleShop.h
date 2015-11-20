class Life_Vehicle_Shop_v2
{
	idd = 2300;
	name="life_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false]; ctrlShow [2305,false];";
	
	class controlsBackground
	{
		class Frame: Life_RscFrame
		{
			idc = -1;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.464062 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		class Life_RscTitleBackground: Life_RscText
		{
			idc = -1;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.464062 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class CloseBtn: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RentCar: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_RentVeh";
			onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class BuyCar: Life_RscButtonMenu
		{
			idc = 2309;
			text = "$STR_Global_Buy";
			onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Title: Life_RscTitle
		{
			idc = 2301;
			text = "";
			x = 0.252499 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.45375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		class VehicleTitleBox: Life_RscText
		{
			idc = -1;
			text = "$STR_GUI_ShopStock";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		class VehicleInfoHeader: Life_RscText
		{
			idc = 2330;
			text = "$STR_GUI_VehInfo";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		class Geld: Life_RscStructuredText
		{
			idc = 2305;
			text = "€";
			x = 0.52125 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.153437 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		
	};
	
	class controls
	{
		class ColorList: Life_RscCombo
		{
			idc = 2304;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class vehicleInfomationList: Life_RscStructuredText
		{
			idc = 2303;
			text = "";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.374 * safezoneH;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0.65};
		};
		class VehicleList: Life_RscListBox
		{
			idc = 2302;
			text = "";
			onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.374 * safezoneH;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0.65};
		};
	};
};



