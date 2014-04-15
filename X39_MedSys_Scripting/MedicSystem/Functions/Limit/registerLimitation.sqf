#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	registers the given limitation string so that it can be used for further actions
 *	the function is NOT checking for already existing limitations!
 *	Meaning that reRegistering limitations will result in overriding old settings
 *
 *	@ParamsCount - 1
 *	@Param1 - STRING - LimitationName
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_limitation"];
_limitation = [_this, 0, "", [""]] call BIS_fnc_param;
X39_MedSys_var_Limitations set[count X39_MedSys_var_Limitations, _limitation];
missionNamespace setVariable [format["X39_MedSys_var_Limitations_%1", _limitation], [-1, nil] call X39_XLib_fnc_ObjectPool_createObjectPool];