#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Adds "Respawn" eventHandler to unit with the correct code
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (Unit) - N/A
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_this addEventHandler["FiredNear", 
{
	private["_fireMode", "_ammo", "_ammoClass", "_valHit", "_valCal", "_unit", "_distance"];
	_unit = _this select 0;
	_fireMode = _this select 5;
	
	if(!(_unit getVariable ["X39_MedSys_var_hasEarplugs", false]) && _fireMode != "Throw") then
	{
		_distance = 1 - ((_this select 2) / 69);
		_ammo = _this select 6;
		_ammoClass = (configFile >> "CfgAmmo" >> _ammo);
		_valHit = getNumber (_ammoClass >> "hit");
		_valCal = getNumber (_ammoClass >> "caliber");
		_fixVal = (_valHit * _valCal * _distance);
		
		[_unit, if(_fixVal == 0) then { 0 } else { 0.1 / _fixVal} ] call X39_MedSys_fnc_addUnitHearing;
	};
}];