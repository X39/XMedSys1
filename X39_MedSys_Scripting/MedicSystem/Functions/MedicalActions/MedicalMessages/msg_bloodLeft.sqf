#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	MessageGenerator
 *
 *	@ParamsCount - 1
 *	@Param1 - Object(Unit) - N/A
 *	@Return - String - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

private["_output", "_unitBleedingState", "_bloodLeft"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_outputRealValueOnly = [_this, 1, false, [false]] call BIS_fnc_param;

_output = "";
_unitBleedingState = _unit call X39_MedSys_fnc_getPlayerBleeding;
_bloodLeft = _unitBleedingState select 2;
if(_outputRealValueOnly) then
{
	_output = format["%1: %2/%3", localize "STR_X39_MedSys_var__msgReal_BloodLeft", _bloodLeft, X39_MedSys_var_Bleeding_StartingBlood];
}
else
{
	if(_bloodLeft < X39_MedSys_var_Bleeding_StartingBlood) then
	{
		if(_bloodLeft < X39_MedSys_var_Bleeding_StartingBlood * 0.2) then
		{
			_output = (localize "STR_X39_MedSys_var__msg_bloodLeft_msg1");
		}
		else
		{
			if(_bloodLeft < X39_MedSys_var_Bleeding_StartingBlood * 0.4) then
			{
				_output = (localize "STR_X39_MedSys_var__msg_bloodLeft_msg2");
			}
			else
			{
				if(_bloodLeft < X39_MedSys_var_Bleeding_StartingBlood * 0.6) then
				{
					_output = (localize "STR_X39_MedSys_var__msg_bloodLeft_msg3");
				}
					else
					{
						if(_bloodLeft < X39_MedSys_var_Bleeding_StartingBlood * 0.8) then
						{
							_output = (localize "STR_X39_MedSys_var__msg_bloodLeft_msg4");
						};
					};
			};
		};
	};
};
_output