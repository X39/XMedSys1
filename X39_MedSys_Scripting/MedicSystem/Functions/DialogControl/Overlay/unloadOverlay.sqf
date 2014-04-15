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

uiNamespace setVariable["X39_MedSys_var_MedicalOverlay_display", nil];
missionNamespace setVariable["X39_MedSys_var_MedicalOverlay_running", false];
_res = [] spawn {
	sleep 1;
	call X39_MedSys_fnc_MedSysOverlayCreateDisplay;
};