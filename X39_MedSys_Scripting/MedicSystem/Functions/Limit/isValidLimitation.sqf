#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	checks if limitation is valid or not
 *
 *	@ParamsCount - 1
 *	@Param1 - STRING (MedicalOption) - see wiki for valid values
 *	@Return - BOOL - true if is valid, false if not
 *	@Author - X39|Cpt. HM Murdock
 */
private["_limitation", "_res"];
_limitation = [_this, 0, "", [""]] call BIS_fnc_param;
_res = false;
if(X39_MedSys_var_Limitations find _limitation != -1) then { _res = true; };
return _res