#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Adds "Respawn" eventHandler to unit with the correct code
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (Unit) - N/A
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_this addEventHandler["Explosion", 
{
	private["_unit", "_damage", "_ammoClass", "_valHit", "_valCal", "_unit", "_distance"];
	_unit = _this select 0;
	_damage = _this select 1;
	
	if((_unit getVariable ["X39_MedSys_var_hasEarplugs", false])) then
	{
		[_unit, _damage * 10] call X39_MedSys_fnc_addUnitHearing;
	};
}];