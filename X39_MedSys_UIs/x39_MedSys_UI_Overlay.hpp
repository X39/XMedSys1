#define GUI_setGuiPos(I,J) \
			x = safezoneX + (safezoneW * 0.8) + ((safezoneW * 0.08) * I); \
			y = safezoneY + (safezoneH * 0.2) + ((safezoneH * 0.08) * J); \
			w = safezoneH * 0.05; \
			h = safezoneH * 0.05;

class RscTitles{
	class X39_MedSys_Gui_Overlay {
		idd = 30096;
		movingEnable = true;
		onLoad = "_this call X39_MedSys_fnc_MedSysOverlayInitOverlay";
		onUnload = "_this call MedSysOverlayUnloadOverlay";
		duration = 32000;
		fadeIn = 0;
		fadeOut = 0;
		enableSimulation = 1;
		controls[]=
		{
			X39_MedSys_GUI_Overlay_Overlay,
			X39_MedSys_GUI_Overlay_INFO0_0,
			X39_MedSys_GUI_Overlay_INFO0_1,
			X39_MedSys_GUI_Overlay_INFO0_2,
			
			X39_MedSys_GUI_Overlay_INFO1_0,
			X39_MedSys_GUI_Overlay_INFO1_1,
			X39_MedSys_GUI_Overlay_INFO1_2,
			
			X39_MedSys_GUI_Overlay_INFO2_0,
			X39_MedSys_GUI_Overlay_INFO2_1,
			X39_MedSys_GUI_Overlay_INFO2_2,
			X39_MedSys_GUI_Overlay_INFO2_3,
			X39_MedSys_GUI_Overlay_INFO2_4
		};

		class X39_MedSys_GUI_Overlay_Overlay: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,0)";
			x = safezoneX;
			y = safezoneY;
			w = safezoneW;
			h = safezoneH;
		};
		class X39_MedSys_GUI_Overlay_INFO0_0: RscPicture
		{
			idc = 500;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			GUI_setGuiPos(0, 0)
		};
		class X39_MedSys_GUI_Overlay_INFO0_1: RscPicture
		{
			idc = 501;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			GUI_setGuiPos(0, 1)
		};
		class X39_MedSys_GUI_Overlay_INFO0_2: RscPicture
		{
			idc = 502;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			GUI_setGuiPos(0, 2)
		};
		
		class X39_MedSys_GUI_Overlay_INFO1_0: RscPicture
		{
			idc = 510;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			GUI_setGuiPos(1, 0)
		};
		class X39_MedSys_GUI_Overlay_INFO1_1: RscPicture
		{
			idc = 511;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			GUI_setGuiPos(1, 1)
		};
		class X39_MedSys_GUI_Overlay_INFO1_2: RscPicture
		{
			idc = 512;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			GUI_setGuiPos(1, 2)
		};
		
		class X39_MedSys_GUI_Overlay_INFO2_0: RscPicture
		{
			idc = 520;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			GUI_setGuiPos(2, 0)
		};
		class X39_MedSys_GUI_Overlay_INFO2_1: RscPicture
		{
			idc = 521;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			GUI_setGuiPos(2, 1)
		};
		class X39_MedSys_GUI_Overlay_INFO2_2: RscPicture
		{
			idc = 522;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			GUI_setGuiPos(2, 2)
		};
		class X39_MedSys_GUI_Overlay_INFO2_3: RscPicture
		{
			idc = 523;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			GUI_setGuiPos(2, 3)
		};
		class X39_MedSys_GUI_Overlay_INFO2_4: RscPicture
		{
			idc = 524;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			GUI_setGuiPos(2, 4)
		};
	};
};