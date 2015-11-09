class D41_car_Status {
	idd = 3333;
	name= "d41_car_status";
	movingEnable = false;
	enableSimulation = true;
	
	
	class controlsBackground
	{
		class BackGround : Life_RscText
		{
			colorBackground[] = {0,0,0,0.5};
			idc = -1;
			x = 0.32; y = -0.01;
			w = 0.32; h = 0.82;
		};
		class BackGround2 : Life_RscText
		{
			colorBackground[] = {0,0,0,0.5};
			idc = -1;
			x = 0.33; y = 0;
			w = 0.3; h = 0.8;
		};
		class GesamtSchaden_Ueberschrift: Life_RscText
		{
			idc = 3350;
			text = "Gesamtschaden:";
			x = 0.43 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class GesamtSchaden_Text: Life_RscText
		{
			idc = 3351;
			text = "100%";
			x = 0.52 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class Hull_Car_Pic: Life_RscPicture
		{
			idc = 3334;
			text = "\A3\soft_f\Offroad_01\Data\UI\map_offroad_01_CA.paa";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.33 * safezoneH;
		};
		class WLF_Pic: Life_RscPicture
		{
			idc = 3335;
			text = "textures\tire_top.paa";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class WBL_Pic: Life_RscPicture
		{
			idc = 3336;
			text = "textures\tire_top.paa";
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class WRF_Pic: Life_RscPicture
		{
			idc = 3337;
			text = "textures\tire_top.paa";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class WBR_Pic: Life_RscPicture
		{
			idc = 3338;
			text = "textures\tire_top.paa";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class Engine_Pic: Life_RscPicture
		{
			idc = 3339;
			text = "textures\car-engine.paa";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class Fuel_Pic: Life_RscPicture
		{
			idc = 3340;
			text = "textures\fuel_tank_.paa";
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class Glass_Pic: Life_RscPicture
		{
			idc = 3348;
			text = "textures\car-engine.paa";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.400 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
	};
	
	class controls {
		

		class Hull: D41_RscButtonMenu
		{
			idc = 3341;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.308 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
		class WLF: D41_RscButtonMenu
		{
			idc = 3342;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
		class Engine: D41_RscButtonMenu
		{
			idc = 3343;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
			default = 1;
		};
		class Fuel: D41_RscButtonMenu
		{
			idc = 3344;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
		class Glass: D41_RscButtonMenu
		{
			idc = 3349;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.400 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
		class WBL: D41_RscButtonMenu
		{
			idc = 3345;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
		class WRF: D41_RscButtonMenu
		{
			idc = 3346;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
		class WBR: D41_RscButtonMenu
		{
			idc = 3347;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorBackgroundFocused[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0};
		};
	};
};