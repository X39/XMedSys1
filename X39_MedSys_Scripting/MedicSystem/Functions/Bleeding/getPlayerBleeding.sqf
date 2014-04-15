#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	EasyToUse function for player bleeding state 
 *	(in back its only one line code currently : /
 *	Its content to change!)
 *
 *	@ParamsCount - 2
 *	@Param1 - Object (UNIT)	- N/A
 *	@Param2 - Boolean		- N/A
 *	@Return - Array - Bleeding state variables
 *	@Author - X39|Cpt. HM Murdock
 */
_isBleeding = _this getVariable "X39_MedSys_var_Bleeding_isBleeding";
_bloodLossPerTick = _this getVariable "X39_MedSys_var_Bleeding_BloodLoosePerTick";
_bloodLeft = _this getVariable "X39_MedSys_var_Bleeding_blood";
[_isBleeding, _bloodLossPerTick, _bloodLeft]