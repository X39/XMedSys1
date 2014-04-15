#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Initializes the given unit
 *	This function is only for AI use!
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (UNIT) - The unit which shall be initilized for the medical system
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_res = _this spawn{
	sleep 0.00001;
	private["_unit", "_addEventHandlers", "_forceInit"];
	_unit = [_this, 0, 0, [objNull]] call BIS_fnc_param;
	_addEventHandlers = [_this, 1, true, [true]] call BIS_fnc_param;
	_forceInit = [_this, 2, true, [true]] call BIS_fnc_param;
	waitUntil{(alive _unit)};
#include "init.sqf"
};