class playerHUD
{
	idd=-1;
	movingEnable=0;
	fadein=0;
	duration = 999999999999999999;
	fadeout=0;
	name="playerHUD";
	onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
	objects[]={};
	
	class controlsBackground 
	{
		class foodHIcon: life_RscPicture 
		{
			idc = -1;
			text = "icons\food.paa";
			x = safeZoneX+safeZoneW-0.19; y = safeZoneY+safeZoneH-0.54;
			w = 0.045; h = 0.06;
		};
		class waterHIcon: life_RscPicture 
		{
			idc = -1;
			text = "icons\water.paa";
			x = safeZoneX+safeZoneW-0.195; y = safeZoneY+safeZoneH-0.48;
			w = 0.06; h = 0.06;
		};
		class healthHIcon: life_RscPicture
		{
			idc = -1;
			text = "icons\health.paa";
			x = safeZoneX+safeZoneW-0.18; y = safeZoneY+safeZoneH-0.415;
			w = 0.03; h = 0.045;
		};
		class moneyHIcon: life_RscPicture
		{
			idc = -1;
			text = "icons\money.paa";
			x = safeZoneX+safeZoneW-0.18; y = safeZoneY+safeZoneH-0.37;
			w = 0.03; h = 0.045;
		};
		class KarmaHIcon: life_RscPicture
		{
			idc = -1;
			text = "icons\karma.paa";
			x = safeZoneX+safeZoneW-0.18; y = safeZoneY+safeZoneH-0.325;
			w = 0.03; h = 0.045;
		};
	};
	
	class controls
	{
		class foodtext
		{
			type=0;
			idc=23500;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.035;
			size=1;
			font="PuristaSemibold";
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
		class watertext
		{
			type=0;
			idc=23510;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.035;
			size=1;
			font="PuristaSemibold";
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
		class healthtext
		{
			type=0;
			idc=23515;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.035;
			size=1;
			font="PuristaSemibold";
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
		class aschetext
		{
			type=0;
			idc=23550;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.035;
			size=1;
			font="PuristaSemibold";
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
		class karmatext
		{
			type=0;
			idc=23551;
			style=0;
			x=-1;
			y=-1;
			w=0.3;
			h=0.05;
			sizeEx=0.035;
			size=1;
			font="PuristaSemibold";
			colorBackground[]={0,0,0,0};
			colorText[] = { 1 , 1 , 1 , 1 };
			shadow=true;
			text="";
		};
	};   
};