#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	evaluate if stance is a prone one or not
 *
 *	@ParamsCount - 1
 *	@Param1 - OBJECT(unit) - Animation which shall be tested
 *	@Return - true if stance  is prone
 *	@Author - X39|Cpt. HM Murdock
 */
private["_res"];
_res = true;
if(stance player != "PRONE") then
{
	_res = false;
};
return _res;