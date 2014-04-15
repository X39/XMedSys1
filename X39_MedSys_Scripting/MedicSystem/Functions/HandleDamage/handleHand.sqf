#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	handles detected damage for the hand
 *
 *	@ParamsCount - 2
 *	@Param1 - OBJECT - Object which shall be handled
 *	@Param2 - SCALAR - Damage dealt
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_damage", "_XES_Res"];
_unit = _this select 0;
_damage = _this select 1;
if(X39_MedSys_var_UsingEventSystem) then {
	_XES_Res = ["Hit_Hand", [_unit, _damage], true, "XMedSys", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
	if(typeName _XES_Res == "ARRAY") then
	{
		_damage = _XES_Res;
	};
};