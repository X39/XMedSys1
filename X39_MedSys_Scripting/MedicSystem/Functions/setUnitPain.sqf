#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	sets the pain value of the given unit with the correct parameters (upper limit, lower limit, etc.)
 *
 *	@ParamsCount - 2
 *	@Param1 - Object (Unit) - N/A
 *	@Param2 - float - N/A
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_unit = _this select 0;
_newPain = _this select 1;
if(_newPain > X39_MedSys_var_Pain_minPainToMaxPain) then
{
	_newPain = X39_MedSys_var_Pain_minPainToMaxPain;
};
if(_newPain < (X39_MedSys_var_Pain_minPainToMaxPain * -1)) then
{
	_newPain = (X39_MedSys_var_Pain_minPainToMaxPain * -1);
};
if(!X39_MedSys_var_Pain_AllowHealthOvercharge) then
{
	if(_newPain < 0) then
	{
		_newPain = 0;
	};
};
_unit setVariable ["X39_MedSys_var_Pain", _newPain, true];
DEBUG_CODE(systemChat format["%1, %2" KOMMA _this KOMMA _newPain];)
/*

_unit = [player, (player getVariable ["X39_MedSys_var_Pain", 0]) + X39_MedSys_var_Pain_MorphineHealValue] select 0;
_newPain = [player, (player getVariable ["X39_MedSys_var_Pain", 0]) + X39_MedSys_var_Pain_MorphineHealValue] select 1;
if(_newPain > X39_MedSys_var_Pain_minPainToMaxPain) then
{
	_newPain = X39_MedSys_var_Pain_minPainToMaxPain;
};
_unit setVariable ["X39_MedSys_var_Pain", _newPain, true];
*/