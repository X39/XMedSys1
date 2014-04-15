#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
#include "header.hpp"
/**
 *	GUI control function!
 *	DONT use if youre not sure what you are doing!
 *
 *	@ParamsCount - 1
 *	@Param1 - int (controlToUse) - N/A
 *	@Return - modified input
 *	@Author - X39|Cpt. HM Murdock
 */
//#define displayControl uiNamespace getVariable "X39_MedSys_var_MedicalOverlay_display" displayCtrl

//2 / (X39_MedSys_var_Generic_DamageBeforeDead / _currentHealth)
_painOrig = player getVariable ["X39_MedSys_var_Pain", 0];
_painWork = _painOrig / X39_MedSys_var_Pain_minPainToMaxPain;
if(_painWork > 1) then
{
	_painWork = 1;
};

if(ctrlText (displayControl _this) != MORPHINEINJECTOR) then
{
	displayControl _this ctrlSetText MORPHINEINJECTOR;
};
if(_painWork == 0) then
{
	displayControl IDC_MORPHINE_VIEW ctrlShow false;
}
else
{
	displayControl IDC_MORPHINE_VIEW ctrlShow true;
	if(_painWork > 0) then
	{
		displayControl _this ctrlSetTextColor[1, 0, 0, X39_MedSys_var_Settings_Overlay_Transparency * _painWork];
	}
	else
	{
		displayControl _this ctrlSetTextColor[0, 0, 1, X39_MedSys_var_Settings_Overlay_Transparency * (_painWork * -1)];
	};
};