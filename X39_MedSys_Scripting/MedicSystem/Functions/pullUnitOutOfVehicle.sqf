#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	calls moveOut and plays required animations after
 *	
 *	@ParamsCount - 1
 *	@Param1 - OBJECT (Unit) - N/A
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
//_vehicle = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;

moveOut _unit;

if(_unit call X39_MedSys_fnc_isUnitKnockedOut) then
{
	sleep 0.25;
	_unit playAction "die";
};