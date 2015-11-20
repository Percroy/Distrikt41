class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_cellphone";
	
	
	class controlsBackground {
		
		class Handy_Frame: Life_RscPicture
		{
			idc = -1;
			text = "\D41\D41_T\Texturen\GUI\handy.paa";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.594 * safezoneH;
		};
		class Handy_Background: Life_RscPicture
		{
			idc = -1;
			text = "\D41\D41_T\Texturen\GUI\Handylogo.paa";
			x = 0.411 * safezoneW + safezoneX;
			y = 0.285 * safezoneH + safezoneY;
			w = 0.162 * safezoneW;
			h = 0.41 * safezoneH;
		};
	};
	
	class controls {

		// class Admin_Request: Life_RscButtonMenu
		// {
			// idc = 3017;
			// style= 0;
			// text = "Admin Request";
			// onButtonClick = "[] call TON_fnc_cell_textadmin";
			// x = 0.412344 * safezoneW + safezoneX;
			// y = 0.665 * safezoneH + safezoneY;
			// w = 0.0773437 * safezoneW;
			// h = 0.022 * safezoneH;
		// };
		class Admin_All: Life_RscButtonMenu
		{
			idc = 3021;
			style= 0;
			text = "$STR_CELL_AdminMSGAll";
			onButtonClick = "[] call TON_fnc_cell_adminmsgall";
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Msg_Btn: Life_RscButtonMenu
		{
			idc = 3015;
			onButtonClick = "[] call TON_fnc_cell_textmsg";
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class Close_Btn: Life_RscButtonMenu
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class LastMsg_Btn: Life_RscButtonMenu
		{
			idc = 3022;
			onButtonClick = "hint D41_LastMsg;";
			x = 0.530937 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class Admin_Msg: Life_RscButtonMenu
		{
			idc = 3020;
			style= 0;
			onButtonClick = "[] call TON_fnc_cell_adminmsg";
			text = "$STR_CELL_AdminMsg";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Polizei_All_Or_To_Police: Life_RscButtonMenu
		{
			idc = 3023;
			style= 0;
			text = "";
			onButtonClick = "";	
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Player_Selection: Life_RscCombo
		{
			idc = 3004;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class Text_Field: Life_RscEdit
		{
			idc = 3003;
			style= 16;
			text = "";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = 0.297 * safezoneH;
		};
	};
	
};