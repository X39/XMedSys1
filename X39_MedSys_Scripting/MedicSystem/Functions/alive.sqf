#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	N/A
 *
 *	@ParamsCount - 2
 *	@Param1 - Object (Unit) - N/A
 *	@Return - Boolean - true if alive, false if not
 *	@Author - X39|Cpt. HM Murdock
 */

_res = false;
if(_this getVariable "X39_MedSys_var_Alive") then
{
	_res = true;
};
_res