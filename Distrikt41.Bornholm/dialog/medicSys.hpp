class D41_Medic_Sys
{
	idd = 9999;
	name= "D41_MedicSys";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground
	{
		class D41_Msys_BackgroundA: Life_RscText
		{
			idc = -1;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247042 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.505915 * safezoneH;
			colorText[] = {0,0,0,0.75};
			colorBackground[] = {0.1,0.1,0.1,0.75};
			colorActive[] = {0.1,0.1,0.1,0.75};
		};
		class D41_Msys_BackgroundB: Life_RscText
		{
			idc = -1;
			x = 0.309219 * safezoneW + safezoneX;
			y = 0.258041 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.483919 * safezoneH;
			colorText[] = {0,0,0,0.75};
			colorBackground[] = {0.1,0.1,0.1,0.75};
			colorActive[] = {0.1,0.1,0.1,0.75};
		};
		class D41_Med_Kopf: Life_RscPicture
		{
			idc = 1200;
			text = "\D41\D41_T\Texturen\GUI\Medic_Kopf_co.paa";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.280037 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.439926 * safezoneH;
		};
		class D41_Med_Torso: Life_RscPicture
		{
			idc = 1201;
			text = "\D41\D41_T\Texturen\GUI\Medic_Torso_co.paa";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.280037 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.439926 * safezoneH;
		};
		class D41_Med_Arme: Life_RscPicture
		{
			idc = 1202;
			text = "\D41\D41_T\Texturen\GUI\Medic_Arme_co.paa";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.280037 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.439926 * safezoneH;
		};
		class D41_Med_Beine: Life_RscPicture
		{
			idc = 1203;
			text = "\D41\D41_T\Texturen\GUI\Medic_Beine_co.paa";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.44 * safezoneH;
		};
		
		//Info_Kopf
		class D41_Marker_Kopf: Life_RscText
		{
			idc = 1002;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.0055 * safezoneH;
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0.5,0.5,0.5,0.75};
			colorActive[] = {0.5,0.5,0.5,0.75};
		};
		class D41_Infotext_Kopf: Life_RscText
		{
			idc = 1008;
			text = "0%";
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0.5,0.5,0.5,0.75};
			colorActive[] = {0.5,0.5,0.5,0.75};
		};
		
		//Info_Arme
		class D41_Marker_Arme: Life_RscText
		{
			idc = 1009;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.37902 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.00549908 * safezoneH;
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0.5,0.5,0.5,0.75};
			colorActive[] = {0.5,0.5,0.5,0.75};
		};
		class D41_Infotext_Arme: Life_RscText
		{
			idc = 1010;
			text = "0%";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.368022 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.0329945 * safezoneH;
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0.5,0.5,0.5,0.75};
			colorActive[] = {0.5,0.5,0.5,0.75};
		};
		//Info_Torso
		class D41_Marker_Torso: Life_RscText
		{
			idc = 1011;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.445009 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.00549908 * safezoneH;
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0.5,0.5,0.5,0.75};
			colorActive[] = {0.5,0.5,0.5,0.75};
		};
		class D41_Infotext_Torso: Life_RscText
		{
			idc = 1012;
			text = "0%";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0.5,0.5,0.5,0.75};
			colorActive[] = {0.5,0.5,0.5,0.75};
		};
		//Info_Beine
		class D41_Marker_Beine: Life_RscText
		{
			idc = 1013;
			x = 0.427812 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.0055 * safezoneH;
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0.5,0.5,0.5,0.75};
			colorActive[] = {0.5,0.5,0.5,0.75};
		};
		class D41_Infotext_Beine: Life_RscText
		{
			idc = 1014;
			text = "0%";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,0.75};
			colorBackground[] = {0.5,0.5,0.5,0.75};
			colorActive[] = {0.5,0.5,0.5,0.75};
		};
		class D41_Infotext_Name: Life_RscText
		{
			idc = 1015;
			text = "playername";
			x = 0.44 * safezoneW + safezoneX;
			y = 0.65 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.0440197 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.5,0.5,0.5,0.75};
			colorActive[] = {0,0,0,1};
		};
	};
	
	//Knöppe
	class controls
	{
		class D41_Button_ArmL: D41_RscButtonMenu
		{
			idc = 1003;
			text = "";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.357024 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.0549908 * safezoneH;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};
		class D41_Button_ArmR: D41_RscButtonMenu
		{
			idc = 1004;
			text = "";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.357024 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.0549908 * safezoneH;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};
		class D41_Button_Kopf: D41_RscButtonMenu
		{
			idc = 1005;
			text = "";
			x = 0.391719 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.055 * safezoneH;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};
		class D41_Button_Torso: D41_RscButtonMenu
		{
			idc = 1006;
			text = "";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.346026 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.142976 * safezoneH;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};
		class D41_Button_Beine: D41_RscButtonMenu
		{
			idc = 1007;
			text = "";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.489002 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.219963 * safezoneH;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};
	};
};


