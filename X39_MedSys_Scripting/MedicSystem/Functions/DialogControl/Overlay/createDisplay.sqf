#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	GUI control function!
 *	DONT use if youre not sure what you are doing!
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(missionNamespace getVariable ["X39_MedSys_var_MedicalOverlay_running", false]) exitWith { DEBUG_LOG("Something tried to create the overlay again when it was already open! Prevented.") };
("X39_MedSys_var_Gui_Overlay_layer" call BIS_fnc_rscLayer) cutRsc["X39_MedSys_Gui_Overlay", "PLAIN"];