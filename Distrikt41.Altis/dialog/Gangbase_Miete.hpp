class Gangbase_Miete
{
	idd = 666;
	name="Gangbase_Miete";
	movingEnabled = 0;
	enableSimulation = 1;
	//onLoad = "";
	
	class controlsBackground
	{
		class RscText_1000: life_RscText
		{
			idc = 1000;
			x = 0.29371 * safezoneW + safezoneX;
			y = 0.246138 * safezoneH + safezoneY;
			w = 0.428052 * safezoneW;
			h = 0.460748 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		
	};
	class controls
	{
		class RscFrame_1800: life_RscFrame
		{
			idc = 1800;
			text = "$STR_D41_BaseGUI_BaseMenu";
			x = 0.29371 * safezoneW + safezoneX;
			y = 0.236144 * safezoneH + safezoneY;
			w = 0.428052 * safezoneW;
			h = 0.472742 * safezoneH;
			colorText[] = {1,1,0,0.65};
			sizeEx = 0.05;
		};
		class RscFrame_1801: life_RscFrame
		{
			idc = 1801;
			text = "$STR_D41_BaseGUI_ResDia";
			x = 0.298867 * safezoneW + safezoneX;
			y = 0.258132 * safezoneH + safezoneY;
			w = 0.232076 * safezoneW;
			h = 0.373796 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscPicture_1200: life_RscPicture
		{
			idc = 1200;
			text = "\D41\D41_T\Texturen\GUI\Gangbase\Gangkreis.paa";
			x = 0.314339 * safezoneW + safezoneX;
			y = 0.28012 * safezoneH + safezoneY;
			w = 0.195976 * safezoneW;
			h = 0.340814 * safezoneH;
		};
		class RscPicture_1201: life_RscPicture
		{
			idc = 1201;
			text = "\D41\D41_T\Texturen\GUI\Gangbase\Gangkreis_lo.paa";
			x = 0.314339 * safezoneW + safezoneX;
			y = 0.28012 * safezoneH + safezoneY;
			w = 0.195976 * safezoneW;
			h = 0.340814 * safezoneH;
		};
		class RscPicture_1202: life_RscPicture
		{
			idc = 1202;
			text = "\D41\D41_T\Texturen\GUI\Gangbase\Gangkreis_Ro.paa";
			x = 0.314339 * safezoneW + safezoneX;
			y = 0.28012 * safezoneH + safezoneY;
			w = 0.195976 * safezoneW;
			h = 0.340814 * safezoneH;
		};
		class RscPicture_1203: life_RscPicture
		{
			idc = 1203;
			text = "\D41\D41_T\Texturen\GUI\Gangbase\Gangkreis_ru.paa";
			x = 0.314339 * safezoneW + safezoneX;
			y = 0.28012 * safezoneH + safezoneY;
			w = 0.195976 * safezoneW;
			h = 0.340814 * safezoneH;
		};
		class RscPicture_1204: life_RscPicture
		{
			idc = 1204;
			text = "\D41\D41_T\Texturen\GUI\Gangbase\Gangkreis_lu.paa";
			x = 0.314339 * safezoneW + safezoneX;
			y = 0.28012 * safezoneH + safezoneY;
			w = 0.195976 * safezoneW;
			h = 0.340814 * safezoneH;
		};
		class RscText_1001: life_RscText
		{
			idc = 1001;
			text = "ItemA";
			x = 0.298867 * safezoneW + safezoneX;
			y = 0.269126 * safezoneH + safezoneY;
			w = 0.0361008 * safezoneW;
			h = 0.043976 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscText_1002: life_RscText
		{
			idc = 1002;
			text = "ItemB";
			x = 0.494843 * safezoneW + safezoneX;
			y = 0.269126 * safezoneH + safezoneY;
			w = 0.0361008 * safezoneW;
			h = 0.043976 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscText_1003: life_RscText
		{
			idc = 1003;
			text = "ItemC";
			x = 0.494843 * safezoneW + safezoneX;
			y = 0.587952 * safezoneH + safezoneY;
			w = 0.0361008 * safezoneW;
			h = 0.043976 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscText_1004: life_RscText
		{
			idc = 1004;
			text = "Geld";
			x = 0.298867 * safezoneW + safezoneX;
			y = 0.587952 * safezoneH + safezoneY;
			w = 0.0361008 * safezoneW;
			h = 0.043976 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscText_1005: life_RscText
		{
			idc = 1005;
			x = 0.541258 * safezoneW + safezoneX;
			y = 0.269126 * safezoneH + safezoneY;
			w = 0.175347 * safezoneW;
			h = 0.043976 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		class RscText_1006: life_RscText
		{
			idc = 1006;
			text = "Tage: 0 | Stunden: 0";
			x = 0.546415 * safezoneW + safezoneX;
			y = 0.28012 * safezoneH + safezoneY;
			w = 0.165032 * safezoneW;
			h = 0.021988 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscText_1007: life_RscText
		{
			idc = 1007;
			x = 0.298867 * safezoneW + safezoneX;
			y = 0.642922 * safezoneH + safezoneY;
			w = 0.232076 * safezoneW;
			h = 0.05497 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		class RscFrame_1803: life_RscFrame
		{
			idc = 1803;
			text = "$STR_D41_BaseGUI_MietZeitUSchrift";
			x = 0.541258 * safezoneW + safezoneX;
			y = 0.258132 * safezoneH + safezoneY;
			w = 0.175347 * safezoneW;
			h = 0.05497 * safezoneH;
			colorText[] = {1,1,0,0.65};
			sizeEx = 0.04;
		};
		class RscText_1008: life_RscText
		{
			idc = 1008;
			x = 0.541258 * safezoneW + safezoneX;
			y = 0.324096 * safezoneH + safezoneY;
			w = 0.175347 * safezoneW;
			h = 0.307832 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		class RscFrame_1804: life_RscFrame
		{
			idc = 1804;
			text = "$STR_D41_BaseGUI_NoetigeItems";
			x = 0.541258 * safezoneW + safezoneX;
			y = 0.313102 * safezoneH + safezoneY;
			w = 0.175347 * safezoneW;
			h = 0.318826 * safezoneH;
			colorText[] = {1,1,0,0.65};
			sizeEx = 0.04;
		};
		class RscFrame_1805: life_RscFrame
		{
			idc = 1805;
			text = "FrameItemA";
			x = 0.546415 * safezoneW + safezoneX;
			y = 0.33509 * safezoneH + safezoneY;
			w = 0.165032 * safezoneW;
			h = 0.065964 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscFrame_1806: life_RscFrame
		{
			idc = 1806;
			text = "FrameItemB";
			x = 0.546415 * safezoneW + safezoneX;
			y = 0.401054 * safezoneH + safezoneY;
			w = 0.165032 * safezoneW;
			h = 0.065964 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscFrame_1807: life_RscFrame
		{
			idc = 1807;
			text = "FrameItemC";
			x = 0.546415 * safezoneW + safezoneX;
			y = 0.478012 * safezoneH + safezoneY;
			w = 0.165032 * safezoneW;
			h = 0.065964 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscFrame_1808: life_RscFrame
		{
			idc = 1808;
			text = "FrameItemGeld";
			x = 0.546415 * safezoneW + safezoneX;
			y = 0.55497 * safezoneH + safezoneY;
			w = 0.165032 * safezoneW;
			h = 0.065964 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscText_1009: life_RscText
		{
			idc = 1009;
			text = "AnzahlFrameItemA";
			x = 0.546415 * safezoneW + safezoneX;
			y = 0.368072 * safezoneH + safezoneY;
			w = 0.165032 * safezoneW;
			h = 0.021988 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscText_1010: life_RscText
		{
			idc = 1010;
			text = "AnzahlFrameItemB";
			x = 0.546415 * safezoneW + safezoneX;
			y = 0.434036 * safezoneH + safezoneY;
			w = 0.165032 * safezoneW;
			h = 0.021988 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscText_1011: life_RscText
		{
			idc = 1011;
			text = "AnzahlFrameItemC";
			x = 0.546415 * safezoneW + safezoneX;
			y = 0.510994 * safezoneH + safezoneY;
			w = 0.165032 * safezoneW;
			h = 0.021988 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscText_1012: life_RscText
		{
			idc = 1012;
			text = "AnzahlFrameItemGeld";
			x = 0.551573 * safezoneW + safezoneX;
			y = 0.587952 * safezoneH + safezoneY;
			w = 0.165032 * safezoneW;
			h = 0.021988 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscFrame_1810: life_RscFrame
		{
			idc = 1810;
			x = 0.298867 * safezoneW + safezoneX;
			y = 0.642922 * safezoneH + safezoneY;
			w = 0.232076 * safezoneW;
			h = 0.05497 * safezoneH;
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscButtonMenu_2400: life_RscButtonMenu
		{
			idc = 2400;
			text = "X";
			x = 0.711447 * safezoneW + safezoneX;
			y = 0.236144 * safezoneH + safezoneY;
			w = 0.0154718 * safezoneW;
			h = 0.021988 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
			colorBackgroundFocused[] = {0,0,0,0.65};
			colorFocused[] = {0,0,0,0.65};
			colorText[] = {0,0,0,0.65};
			onButtonClick = "closeDialog 0;";
			default = 1;
			sizeEx = 0.04;
		};
		class RscButtonMenu_2401: life_RscButtonMenu
		{
			idc = 2401;
			text = "$STR_D41_BaseGUI_BtnItemEinbuchen";
			x = 0.541258 * safezoneW + safezoneX;
			y = 0.642922 * safezoneH + safezoneY;
			w = 0.175347 * safezoneW;
			h = 0.05497 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
			colorBackgroundFocused[] = {0,0,0,0.65};
			colorFocused[] = {0,0,0,0.65};
			colorText[] = {0,0,0,0.65};
			onButtonClick = "[D41_BaseItemArray] spawn life_fnc_D41_GangBaseItemsEinzahlen";
			sizeEx = 0.04;
		};
		class RscEdit_1400: life_RscEdit
		{
			idc = 1400;
			text = "0";
			x = 0.304024 * safezoneW + safezoneX;
			y = 0.653916 * safezoneH + safezoneY;
			w = 0.108302 * safezoneW;
			h = 0.032982 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
			colorBackgroundFocused[] = {0,0,0,0.65};
			colorFocused[] = {0,0,0,0.65};
			colorText[] = {1,1,1,0.65};
			sizeEx = 0.04;
		};
		class RscButtonMenu_2402: life_RscButtonMenu
		{
			idc = 2402;
			text = "$STR_D41_BaseGUI_BtnGeldEinbuchen";
			x = 0.417484 * safezoneW + safezoneX;
			y = 0.653916 * safezoneH + safezoneY;
			w = 0.108302 * safezoneW;
			h = 0.032982 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
			colorBackgroundFocused[] = {0,0,0,0.65};
			colorFocused[] = {0,0,0,0.65};
			colorText[] = {0,0,0,0.65};
			onButtonClick = "[] spawn life_fnc_D41_GangBaseGeldEinzahlen";
			sizeEx = 0.04;
		};
	};	
};