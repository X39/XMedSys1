#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	GUI control function!
 *	DONT use if youre not sure what you are doing!
 *
 *	@ParamsCount - unknown
 *	@Param1 - Display - N/A
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
 
//("X39_MedSys_var_Overlay_layer" call BIS_fnc_rscLayer) for seperate layer
uiNamespace setVariable["X39_MedSys_var_MedicalOverlay_display", _this select 0];
missionNamespace setVariable["X39_MedSys_var_MedicalOverlay_running", true];
[] call X39_MedSys_fnc_MedSysOverlayHideAll;
[] call X39_MedSys_fnc_MedSysOverlayOverlayThread;
