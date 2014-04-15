#define GUI_GRID_H (safeZoneH / 40)
#define GUI_BUTTONPOSITIONPLACER(V) 		x = (safezoneX + safezoneW) / 2 - (safezoneW / 2 * 0.2); \
		y = safezoneY + V * (safeZoneH / 40 ) + (safeZoneH / 10 ); \
		w = safezoneW * 0.2; \
		h = (safeZoneH / 40 );

class X39_MedSys_Gui {
	idd = 30099;
	controls[]=
	{
		X39_MedSys_RscButton_1,
		X39_MedSys_RscButton_2,
		X39_MedSys_RscButton_3,
		X39_MedSys_RscButton_4,
		X39_MedSys_RscButton_5,
		X39_MedSys_RscButton_6,
		X39_MedSys_RscButton_7,
		X39_MedSys_RscButton_8,
		X39_MedSys_RscButton_9,
		X39_MedSys_RscButton_10,
		X39_MedSys_RscButton_11,
		X39_MedSys_RscButton_12,
		X39_MedSys_RscButton_13,
		X39_MedSys_RscButton_14,
		X39_MedSys_RscButton_15,
		X39_MedSys_RscButton_16,
		X39_MedSys_RscButton_17,
		X39_MedSys_RscButton_18,
		X39_MedSys_RscButton_19,
		X39_MedSys_RscButton_20
	};
	class X39_MedSys_RscButton_1: RscButton {
		idc = 1600;
		text = "X39_MedSys_RscButton_1"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(0)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_2: RscButton {
		idc = 1601;
		text = "X39_MedSys_RscButton_2"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(1)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_3: RscButton {
		idc = 1602;
		text = "X39_MedSys_RscButton_3"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(2)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_4: RscButton {
		idc = 1603;
		text = "X39_MedSys_RscButton_4"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(3)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_5: RscButton {
		idc = 1604;
		text = "X39_MedSys_RscButton_5"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(4)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_6: RscButton {
		idc = 1605;
		text = "X39_MedSys_RscButton_6"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(5)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_7: RscButton {
		idc = 1606;
		text = "X39_MedSys_RscButton_7"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(6)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_8: RscButton {
		idc = 1607;
		text = "X39_MedSys_RscButton_8"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(7)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_9: RscButton {
		idc = 1608;
		text = "X39_MedSys_RscButton_9"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(8)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_10: RscButton {
		idc = 1609;
		text = "X39_MedSys_RscButton_10"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(9)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_11: RscButton {
		idc = 1610;
		text = "X39_MedSys_RscButton_11"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(10)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_12: RscButton {
		idc = 1611;
		text = "X39_MedSys_RscButton_12"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(11)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_13: RscButton {
		idc = 1612;
		text = "X39_MedSys_RscButton_13"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(12)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_14: RscButton {
		idc = 1613;
		text = "X39_MedSys_RscButton_14"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(13)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_15: RscButton {
		idc = 1614;
		text = "X39_MedSys_RscButton_15"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(14)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_16: RscButton {
		idc = 1615;
		text = "X39_MedSys_RscButton_16"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(15)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_17: RscButton {
		idc = 1616;
		text = "X39_MedSys_RscButton_17"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(16)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_18: RscButton {
		idc = 1617;
		text = "X39_MedSys_RscButton_18"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(17)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_19: RscButton {
		idc = 1618;
		text = "X39_MedSys_RscButton_19"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(18)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
	class X39_MedSys_RscButton_20: RscButton {
		idc = 1619;
		text = "X39_MedSys_RscButton_20"; //--- ToDo: Localize;
		GUI_BUTTONPOSITIONPLACER(19)
		colorText[] = {1,1,1,1};
		colorBackground[] = {0.5,0.64,0.39,1};
		colorActive[] = {0.6,0.78,0.49,1};
		sizeEx = 1 * GUI_GRID_H;
	};
};