class X39_MedSys_blackOut {
	idd = 30097;
	onUnload = "";//"if(X39_MedSys_Display_BlackOut_Open) then { -1 call X39_MedSys_fnc_X39_MedSys_fnc_createBlackOutDisplay };";
	onLoad = "";
	controls[]=
	{
		RscPicture_1200,
		IGUIBack_2200,
		RscButton_1600,
		RscButton_1601,
		RscText_1000,
		RscText_1001,
		RscText_1002,
		RscText_1003
	};

	class RscPicture_1200: RscPicture
	{
		idc = 1200;
		text = "X39_MedSys_Ressources\X39\Mods\MedSys\Overlays\Blackout.paa";
		x = safezoneX;
		y = safezoneY;
		w = safezoneW;
		h = safezoneH;
	};
	class IGUIBack_2200: IGUIBack
	{
		idc = 2200;
		x = safezoneX;
		y = safezoneY;
		w = safezoneW;
		h = safezoneH;
		colorText[] = {0,0,0,1};
		colorBackground[] = {0,0,0,1};
		colorActive[] = {0,0,0,1};
	};
	class RscButton_1600: RscButton
	{
		text = "RESPAWN"; //--- ToDo: Localize;
		idc = 1600;
		x = safezoneX;
		y = safezoneY + safezoneH * 0.9;
		w = safezoneW * 0.1;
		h = safezoneH * 0.05;
	};
	class RscButton_1601: RscButton
	{
		text = "ABORT"; //--- ToDo: Localize;
		idc = 1601;
		action = "endMission ""end1"";"
		x = safezoneX;
		y = safezoneY;
		w = safezoneW * 0.1;
		h = safezoneH * 0.05;
	};
	class RscText_1000: RscText
	{
		idc = 1000;
		text = ""; //--- ToDo: Localize;
		x = safezoneX + safezoneW * 0.9;
		y = safezoneY + safezoneH * 0.9;
		w = safezoneW * 0.1;
		h = safezoneH * 0.05;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,1};
		colorActive[] = {0,0,0,1};
	};
	class RscText_1001: RscText
	{
		idc = 1001;
		text = ""; //--- ToDo: Localize;
		x = safezoneX + safezoneW * 0.9;
		y = safezoneY + safezoneH * 0.95;
		w = safezoneW * 0.1;
		h = safezoneH * 0.05;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,1};
		colorActive[] = {0,0,0,1};
	};
	class RscText_1002: RscText
	{
		idc = 1002;
		text = ""; //--- ToDo: Localize;
		x = safezoneX + safezoneW * 0.8;
		y = safezoneY + safezoneH * 0.9;
		w = safezoneW * 0.1;
		h = safezoneH * 0.05;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,1};
		colorActive[] = {0,0,0,1};
	};
	class RscText_1003: RscText
	{
		idc = 1003;
		text = ""; //--- ToDo: Localize;
		x = safezoneX + safezoneW * 0.8;
		y = safezoneY + safezoneH * 0.95;
		w = safezoneW * 0.1;
		h = safezoneH * 0.05;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,1};
		colorActive[] = {0,0,0,1};
	};
};