class money {

	idd = 4814;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {

		class Background: Life_RscText
		{
			idc = -1;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.154 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class Frame: Life_RscFrame
		{
			idc = -1;
			x = 0.41 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.154 * safezoneH;
		};
		class moneyinfo: Life_RscText
		{
			idc = 2015;
			text = "";
			style= 0;
			x = 0.464 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.10 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class target_name: Life_RscText
		{
			idc = 4815;
			text = "";
			style= 0;
			x = 0.464 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.10 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class Guthaben: Life_RscText
		{
			idc = 4816;
			text = "$STR_D41_Guthaben";
			style= 0;
			x = 0.415 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class Target: Life_RscText
		{
			idc = -1;
			text = "$STR_D41_Player";
			style= 0;
			x = 0.415 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class amount: Life_RscText
		{
			idc = -1;
			text = "$STR_D41_Betrag";
			style= 0;
			x = 0.415 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

	};
	
	class controls {

		class Btn_Give_Money: Life_RscButtonMenu
		{
			idc = 4817;
			text = "$STR_Give_Money";
			style= 0;
			onButtonClick = "[cursorTarget] call life_fnc_giveMoney; [] call life_fnc_hudUpdate; closeDialog 0;";
			x = 0.42 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 0.023;
			colorBackground[] = {0,0,0,0.5};
		};
		class Btn_Cancel: Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			style= 0;
			onButtonClick = "closeDialog 0;";
			x = 0.498 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.062 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 0.023;
			colorBackground[] = {0,0,0,0.5};
		};
		class money_edit: Life_RscEdit
		{
			idc = 2018;
			text = "";
			style= 0;
			x = 0.464 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.10 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};

		
	};
};