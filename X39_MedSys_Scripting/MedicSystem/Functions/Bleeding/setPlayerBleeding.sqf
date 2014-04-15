#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	N/A
 *
 *	@ParamsCount - 2
 *	@Param1 - Object (UNIT)	- N/A
 *	@Param2 - Boolean		- N/A
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

_unit = _this select 0;
if(_this select 1) then {
	_unit setVariable["X39_MedSys_var_Bleeding_isBleeding", true, true];
	/*
	if(_unit == player) then
	{
		cutText["YOU ARE BLEEDING", "PLAIN DOWN", 2, true];
	};
	*/
	_unit setDamage 0.45;
} else {
	_unit setVariable["X39_MedSys_var_Bleeding_isBleeding", false, true];
	_unit setVariable["X39_MedSys_var_Bleeding_BloodLoosePerTick", 0, true];
	/*
	if(_unit == player) then
	{
		cutText["", "PLAIN", 2, false];
	};
	*/
	_unit setDamage 0;
};