/*
	File: fn_combat.hpp
	Author: Distrikt41 - Avka
	
	Description:
	Combatrose! woot woot! Slothpower, Bitch!
*/

class CombatRose
{
	idd = 1713999;
	movingEnabled = true;
	enableSimulation = true;

	class controls
	{
		class Background: D41_RscPicture
        {
            idc = 11001;
            text = "D41\D41_T\Texturen\GUI\HintergrundPlayerMenu.paa";
            x = 0.30 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.42 * safezoneW;
            h = 0.341 * safezoneH;
        };
		// class Hintergrund_01: D41_RscPicture
		// {
			// idc = 1200;
			// //text = "D41_T\Texturen\D41_Plakat\button2.jpg";
			// x = 0.453594 * safezoneW + safezoneX;
			// y = 0.368 * safezoneH + safezoneY;
			// w = 0.11 * safezoneW;
			// h = 0.033 * safezoneH;
		// };
		// class Hintergrund_02: D41_RscPicture
		// {
			// idc = 1201;
			// //text = "D41_T\Texturen\D41_Plakat\button2.jpg";
			// x = 0.551562 * safezoneW + safezoneX;
			// y = 0.412 * safezoneH + safezoneY;
			// w = 0.11 * safezoneW;
			// h = 0.033 * safezoneH;
		// };
		// class Hintergrund_03: D41_RscPicture
		// {
			// idc = 1202;
			// //text = "D41_T\Texturen\D41_Plakat\button2.jpg";
			// x = 0.577344 * safezoneW + safezoneX;
			// y = 0.456 * safezoneH + safezoneY;
			// w = 0.11 * safezoneW;
			// h = 0.033 * safezoneH;
		// };
		// class Hintergrund_04: D41_RscPicture
		// {
			// idc = 1203;
			// //text = "D41_T\Texturen\D41_Plakat\button2.jpg";
			// x = 0.577344 * safezoneW + safezoneX;
			// y = 0.5 * safezoneH + safezoneY;
			// w = 0.11 * safezoneW;
			// h = 0.033 * safezoneH;
		// };
		// class Hintergrund_05: D41_RscPicture
		// {
			// idc = 1204;
			// //text = "D41_T\Texturen\D41_Plakat\button2.jpg";
			// x = 0.551562 * safezoneW + safezoneX;
			// y = 0.544 * safezoneH + safezoneY;
			// w = 0.11 * safezoneW;
			// h = 0.033 * safezoneH;
		// };
		// class Hintergrund_06: D41_RscPicture
		// {
			// idc = 1205;
			// //text = "D41_T\Texturen\D41_Plakat\button2.jpg";
			// x = 0.453594 * safezoneW + safezoneX;
			// y = 0.588 * safezoneH + safezoneY;
			// w = 0.11 * safezoneW;
			// h = 0.033 * safezoneH;
		// };
		// class Hintergrund_07: D41_RscPicture
		// {
			// idc = 1206;
			// //text = "D41_T\Texturen\D41_Plakat\button2.jpg";
			// x = 0.355625 * safezoneW + safezoneX;
			// y = 0.544 * safezoneH + safezoneY;
			// w = 0.11 * safezoneW;
			// h = 0.033 * safezoneH;
		// };
		// class Hintergrund_08: D41_RscPicture
		// {
			// idc = 1207;
			// //text = "D41_T\Texturen\D41_Plakat\button2.jpg";
			// x = 0.329844 * safezoneW + safezoneX;
			// y = 0.5 * safezoneH + safezoneY;
			// w = 0.11 * safezoneW;
			// h = 0.033 * safezoneH;
		// };
		// class Hintergrund_09: D41_RscPicture
		// {
			// idc = 1208;
			// //text = "D41_T\Texturen\D41_Plakat\button2.jpg";
			// x = 0.329844 * safezoneW + safezoneX;
			// y = 0.456 * safezoneH + safezoneY;
			// w = 0.11 * safezoneW;
			// h = 0.033 * safezoneH;
		// };
		// class Hintergrund_10: D41_RscPicture
		// {
			// idc = 1209;
			// //text = "D41_T\Texturen\D41_Plakat\button2.jpg";
			// x = 0.355625 * safezoneW + safezoneX;
			// y = 0.412 * safezoneH + safezoneY;
			// w = 0.11 * safezoneW;
			// h = 0.033 * safezoneH;
		// };
		// class Hintergrund_00: D41_RscPicture
		// {
			// idc = 1210;
			// //text = "D41_T\Texturen\D41_Plakat\button2.jpg";
			// x = 0.45875 * safezoneW + safezoneX;
			// y = 0.467 * safezoneH + safezoneY;
			// w = 0.108281 * safezoneW;
			// h = 0.055 * safezoneH;
		// };
		class Button_01: D41_RscButton
		{
			idc = 1600;
			text = ""; 
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.369 * safezoneH + safezoneY;
			w = 0.11 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Button_02: D41_RscButton
		{
			idc = 1601;
			text = ""; 
			x = 0.558 * safezoneW + safezoneX;
			y = 0.413 * safezoneH + safezoneY;
			w = 0.115 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Button_04: D41_RscButton
		{
			idc = 1602;
			text = "";
			x = 0.575 * safezoneW + safezoneX;
			y = 0.498 * safezoneH + safezoneY;
			w = 0.119 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Button_09: D41_RscButton
		{
			idc = 1603;
			text = ""; 
			x = 0.3265 * safezoneW + safezoneX;
			y = 0.4568 * safezoneH + safezoneY;
			w = 0.1145 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Button_10: D41_RscButton
		{
			idc = 1604;
			text = ""; 
			x = 0.3517 * safezoneW + safezoneX;
			y = 0.413 * safezoneH + safezoneY;
			w = 0.1125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Button_08: D41_RscButton
		{
			idc = 1605;
			text = ""; 
			x = 0.3265 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.115 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Button_06: D41_RscButton
		{
			idc = 1606;
			text = ""; 
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.59 * safezoneH + safezoneY;
			w = 0.11 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Button_03: D41_RscButton
		{
			idc = 1607;
			text = ""; 
			x = 0.575 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.119 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Button_00: D41_RscButton
		{
			idc = 1608;
			text = ""; 
			x = 0.4463 * safezoneW + safezoneX;
			y = 0.475 * safezoneH + safezoneY;
			w = 0.12 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Button_07: D41_RscButton
		{
			idc = 1609;
			text = ""; 
			x = 0.35 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.115 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class Button_05: D41_RscButton
		{
			idc = 1610;
			text = ""; 
			x = 0.56 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.1148 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
	
	
};