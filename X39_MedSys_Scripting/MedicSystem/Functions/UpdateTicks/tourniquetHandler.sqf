#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (UNIT)	- Unit to watch
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
 _hasTourniquet = _this getVariable ["X39_MedSys_var_Bleeding_hasTourniquet", false];
if(X39_MedSys_var_allowSpeedLimitations && {_hasTourniquet}) then
{
	[_this, -1 * X39_MedSys_var_Bleeding_Tourniquet_DamagePerTick] call X39_MedSys_fnc_healUnit;
};