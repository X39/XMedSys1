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

if(ctrlText (displayControl _this) != TOURNIQUET) then
{
	displayControl _this ctrlSetText TOURNIQUET;
	displayControl _this ctrlSetTextColor[1, 1, 1, X39_MedSys_var_Settings_Overlay_Transparency];
};
displayControl _this ctrlShow (player getVariable["X39_MedSys_var_Bleeding_hasTourniquet", false]);