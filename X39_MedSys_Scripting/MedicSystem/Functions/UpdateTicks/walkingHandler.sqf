#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
private ["_hasTourniquet", "_damage"];
if (X39_MedSys_var_allowSpeedLimitations) then {

	_hasTourniquet = _this getVariable ["X39_MedSys_var_Bleeding_hasTourniquet", false];
	_damage = _this call X39_MedSys_fnc_getUnitDamage;

	if ((_hasTourniquet) || {X39_MedSys_var_allowSpeedLimitations_forceWalkAtXDamage != -1 && (_damage > X39_MedSys_var_allowSpeedLimitations_forceWalkAtXDamage)}) then {
		_this forceWalk true;
	} else {
		_this forceWalk false;
	};
};