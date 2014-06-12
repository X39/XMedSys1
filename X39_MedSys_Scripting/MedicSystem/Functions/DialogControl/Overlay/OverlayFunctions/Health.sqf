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
_damage = [player, true] call X39_MedSys_fnc_getUnitDamage;
_damageColorValue = 0;
if(_damage != 0) then
{
	_damageColorValue = 2 / (X39_MedSys_var_Generic_DamageBeforeDead / _damage);
};
if(ctrlText (displayControl _this) != REDCROSS_PAA) then
{
	displayControl _this ctrlSetText REDCROSS_PAA;
};
displayControl _this ctrlSetTextColor[_damageColorValue, 2 -_damageColorValue, 0, profileNamespace getVariable ["X39_MedSys_var_Settings_Overlay_Transparency", X39_MedSys_var_Settings_Overlay_Transparency]];