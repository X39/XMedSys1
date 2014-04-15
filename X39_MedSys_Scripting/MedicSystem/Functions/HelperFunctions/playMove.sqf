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
_move = _this select 1;
forceLocal(_unit)

_unit playMove _move;