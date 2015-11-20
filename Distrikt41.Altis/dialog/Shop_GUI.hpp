/*
	File: fn_combat.hpp
	Author: Distrikt41 - Avka
	
	Description:
	D41 Shop GUI! woot woot! Slothpower, Bitch!
*/

class D41_Shop
{
	idd = 1813999;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class Background: Life_RscText
		{
			idc = 2207;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.561 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		
		class Shop_Name: Life_RscText
		{
			idc = 2208;
			text = "Shopname";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.65};
		};
		
		class Player_name: Life_RscText
		{
			idc = 2209;
			text = "Playername";
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.65};
		};
	};
	
	class controls
	{
		class Shop_Inv: Life_RscListbox
		{
			idc = 2200;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
			sizeEx = 0.04;
			onLBSelChanged = "_this call life_fnc_D41_ShopSelB";
		};
		
		class Player_Inv: Life_RscListbox
		{
			idc = 2201;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.385 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
			sizeEx = 0.04;
			onLBSelChanged = "_this call life_fnc_D41_ShopSelS";
		};
		
		class Item_Details: Life_RscStructuredText
		{
			idc = 2202;
			text = "Item_Info";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.425 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.273 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		
		class Item_Info: Life_RscStructuredText
		{
			idc = 2203;
			text = "Preis:";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		
	class Item_Pic: Life_RscStructuredText
		{
			idc = 2212;
			text = "";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.108 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		
		class Btn_Buy: D41_RscButton
		{
			idc = 2204;
			text = "$STR_Global_Buy";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
			onButtonClick = "if(!D41_isWpnProdShop)then{[] spawn life_fnc_virt_buy;}else{}; [] call life_fnc_hudUpdate;";
		};
		
		class Btn_Close: D41_RscButton
		{
			idc = 2204;
			text = "X";
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
			onButtonClick = "closeDialog 0;";
		};
		
		class Btn_Sell: D41_RscButton
		{
			idc = 2205;
			text = "$STR_Global_Sell";
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
			onButtonClick = "if(!D41_isWpnProdShop)then{[] spawn life_fnc_virt_sell;}else{hint 'nope'}; [] call life_fnc_hudUpdate;";
		};
		
		class Rand: Life_RscFrame
		{
			idc = 2206;
			x = 0.283437 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.561 * safezoneH;
		};
		
		class Buy_Array: Life_RscEdit
		{
			idc = 2210;
			text = "";
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
		
		class Sell_Array: Life_RscEdit
		{
			idc = 2211;
			text = "";
			x = 0.634062 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.65};
		};
	};
};
