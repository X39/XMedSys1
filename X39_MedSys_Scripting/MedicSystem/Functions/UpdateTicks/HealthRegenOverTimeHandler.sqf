#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (UNIT)	- Unit to watch
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(!X39_MedSys_var_HpRegenOverTime_Allow) exitWith { };
if(X39_MedSys_var_HpRegenOverTime_OnlyRegenWhenNotBleeding && _this getVariable "X39_MedSys_var_Bleeding_isBleeding") exitWith { };
private["_damage"];

_damage = [_this, true] call X39_MedSys_fnc_getUnitDamage;
if(_damage > (X39_MedSys_var_HpRegenOverTime_MaxRegen * X39_MedSys_var_Generic_DamageBeforeDead)) then
{
	_damage = _damage - (X39_MedSys_var_HpRegenOverTime_RegenPerTick * X39_MedSys_var_Generic_DamageBeforeDead);
	if(_damage < (X39_MedSys_var_HpRegenOverTime_MaxRegen * X39_MedSys_var_Generic_DamageBeforeDead)) then
	{
		_damage = X39_MedSys_var_HpRegenOverTime_MaxRegen * X39_MedSys_var_Generic_DamageBeforeDead;
	};
	[_this, _damage, true] call X39_MedSys_fnc_setUnitDamage;
};
if(X39_MedSys_var_allowSpeedLimitations && {X39_MedSys_var_allowSpeedLimitations_forceWalkAtXDamage != -1 && !(_this getVariable ["X39_MedSys_var_Bleeding_hasTourniquet", false])}) then
{
	_this forceWalk (_damage > X39_MedSys_var_allowSpeedLimitations_forceWalkAtXDamage);
};