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

if(ctrlText (displayControl _this) != BROKENBONE) then
{
	displayControl _this ctrlSetText BROKENBONE;
	displayControl _this ctrlSetTextColor[1, 1, 1, profileNamespace getVariable ["X39_MedSys_var_Settings_Overlay_Transparency", X39_MedSys_var_Settings_Overlay_Transparency]];
};
displayControl _this ctrlShow !(player call X39_MedSys_fnc_isUnitAbleToMove);