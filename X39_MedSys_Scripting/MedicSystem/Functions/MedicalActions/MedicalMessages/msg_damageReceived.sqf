#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	MessageGenerator
 *
 *	@ParamsCount - 1
 *	@Param1 - Object(Unit) - N/A
 *	@Return - String - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

private["_output", "_unitDamage", "_dmgInP"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_outputRealValueOnly = [_this, 1, false, [false]] call BIS_fnc_param;

_output = "";
_unitDamage = [_unit, true] call X39_MedSys_fnc_getUnitDamage;
if(_outputRealValueOnly) then
{
	if(_unitDamage > 0) then
	{
		_dmgInP = 100 - ((_unitDamage / X39_MedSys_var_Generic_DamageBeforeDead) * 100);
		if(_dmgInP < 0) then
		{
			_dmgInP = 0;
		};
		_output = format ["%1: %2%3", localize "STR_X39_MedSys_var__msgReal_HP", floor _dmgInP, "%"];
	};
}
else
{

	if(_unitDamage > X39_MedSys_var_Generic_DamageBeforePermaKnockOut) then
	{
		_output = (localize "STR_X39_MedSys_var__msg_hurtReceived_msg1");
	}
	else
	{
		if(_unitDamage > X39_MedSys_var_Generic_DamageBeforeKnockOut) then
		{
			_output = (localize "STR_X39_MedSys_var__msg_hurtReceived_msg2");
		}
		else
		{
			if(_unitDamage > (X39_MedSys_var_Generic_DamageBeforeKnockOut * 0.5)) then
			{
				_output = (localize "STR_X39_MedSys_var__msg_hurtReceived_msg3");
			}
			else
			{
				if(_unitDamage > 0) then
				{
					_output = (localize "STR_X39_MedSys_var__msg_hurtReceived_msg4");
				};
			};
		};
	};
};
_output