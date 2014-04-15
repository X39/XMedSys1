#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Returns the correctly calculated unit hearing ability
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (Unit) - unit the hearing ability should be get from
 *	@Return - SCALAR
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_hearingAbility"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_hasEarplugs = _unit getVariable ["X39_MedSys_var_hasEarplugs", false];
_hearingAbility = _unit getVariable ["X39_MedSys_var_Hearing", 0];
if(_hasEarplugs) then
{
	_hearingAbility - X39_MedSys_var_Hearing_earPlugManipulationValue;
};
if(_hearingAbility < 0) then
{
	_hearingAbility = 0;
};
_hearingAbility