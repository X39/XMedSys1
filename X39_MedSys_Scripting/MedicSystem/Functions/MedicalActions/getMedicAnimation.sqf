#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

_ret = "";
switch _this do
{
	case 0: {_ret = "MedicStart";};
	case 1: {_ret = "Medic";};
};
_ret