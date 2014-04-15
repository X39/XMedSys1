#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
#include "OverlayFunctions\header.hpp"
/**
 *	GUI control function!
 *	DONT use if youre not sure what you are doing!
 *
 *	@ParamsCount - 1
 *	@Param1	- Boolean - Optional - if false, the while loop will not be continued (simmilar to forceUpdate for the overlay)
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_res = ([_this, 0, false, [true]] call BIS_fnc_param) spawn {
	waitUntil{player getVariable["X39_MedSys_var_UnitInitilized", false]};
	private["_update"];
	_update = {
		if(X39_MedSys_var_Display_Overlay_EnableHealthView && X39_MedSys_var_Display_Overlay_AllowHealthView) then
		{
			displayControl IDC_HEALTH_VIEW ctrlShow true;
			IDC_HEALTH_VIEW call X39_MedSys_fnc_MedSysOverlay_controlFunctions_Health;
		}
		else
		{
			displayControl IDC_HEALTH_VIEW ctrlShow false;
		};
		//----------------------------------------------------------------------------------
		if(X39_MedSys_var_Display_Overlay_EnableBoodView && X39_MedSys_var_Display_Overlay_AllowBoodView) then
		{
			displayControl IDC_BLEEDING_VIEW ctrlShow true;
			IDC_BLEEDING_VIEW call X39_MedSys_fnc_MedSysOverlay_controlFunctions_Bleeding;
		}
		else
		{
			displayControl IDC_BLEEDING_VIEW ctrlShow false;
		};
		//----------------------------------------------------------------------------------
		if(X39_MedSys_var_Display_Overlay_EnableLegView && X39_MedSys_var_Display_Overlay_AllowLegView) then
		{
			IDC_LEGS_VIEW call X39_MedSys_fnc_MedSysOverlay_controlFunctions_Leg;
		}
		else
		{
			displayControl IDC_LEGS_VIEW ctrlShow false;
		};
		//----------------------------------------------------------------------------------
		if(X39_MedSys_var_Display_Overlay_EnableTourniquetView && X39_MedSys_var_Display_Overlay_AllowTourniquetView) then
		{
			IDC_TOURNIQUET_VIEW call X39_MedSys_fnc_MedSysOverlay_controlFunctions_Tourniquet;
		}
		else
		{
			displayControl IDC_TOURNIQUET_VIEW ctrlShow false;
		};
		//----------------------------------------------------------------------------------
		if(X39_MedSys_var_Display_Overlay_EnableMorphineView && X39_MedSys_var_Display_Overlay_AllowMorphineView) then
		{
			IDC_MORPHINE_VIEW call X39_MedSys_fnc_MedSysOverlay_controlFunctions_Morphine;
		}
		else
		{
			displayControl IDC_MORPHINE_VIEW ctrlShow false;
		};
	};
	if(_this) then
	{
		call _update;
	}
	else
	{
		while{missionNamespace getVariable "X39_MedSys_var_MedicalOverlay_running"} do
		{
			call _update;
			sleep X39_MedSys_var_Settings_Overlay_RefreshRate;
		};
	};
};