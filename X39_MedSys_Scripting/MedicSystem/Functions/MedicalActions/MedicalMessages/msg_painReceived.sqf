#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	MessageGenerator
 *
 *	@ParamsCount - 1
 *	@Param1 - Object(Unit) - N/A
 *	@Return - String - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

private["_output", "_unitPain", "_painInP"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_outputRealValueOnly = [_this, 1, false, [false]] call BIS_fnc_param;

_output = "";
_unitPain = _unit getVariable ["X39_MedSys_var_Pain", 0];
if(_outputRealValueOnly) then
{
	if(_unitPain != 0) then
	{
		_painInP = (_unitPain / X39_MedSys_var_Pain_minPainToMaxPain);
		_painInP = (_unitPain / X39_MedSys_var_Pain_minPainToMaxPain);
		if(_painInP > 1) then
		{
			_painInP = 1;
		};
		if(_painInP < -1) then
		{
			_painInP = -1;
		};
		_output = format ["%1: %2%3", localize "STR_X39_MedSys_var__msgReal_Pain", floor (_painInP * 100), "%"];
	};
}
else
{
	if(_unitPain > 0) then
	{
		if(_unitPain > X39_MedSys_var_Pain_minPainToMaxPain * 0.8) then
		{
			_output = (localize "STR_X39_MedSys_var__msg_painReceived_msg1");
		}
		else
		{
			if(_unitPain > X39_MedSys_var_Pain_minPainToMaxPain * 0.5) then
			{
				_output = (localize "STR_X39_MedSys_var__msg_painReceived_msg2");
			}
			else
			{
				if(_unitPain > (X39_MedSys_var_Pain_minPainToMaxPain * 0.25)) then
				{
					_output = (localize "STR_X39_MedSys_var__msg_painReceived_msg3");
				}
				else
				{
					_output = (localize "STR_X39_MedSys_var__msg_painReceived_msg4");
				};
			};
		};
	}
	else
	{
		_unitPain = _unitPain * -1;
		if(_unitPain > 0) then
		{
			if(_unitPain < X39_MedSys_var_Pain_minPainToMaxPain * 0.8) then
			{
				_output = (localize "STR_X39_MedSys_var__msg_painReceivedNeg_msg1");
			}
			else
			{
				if(_unitPain < X39_MedSys_var_Pain_minPainToMaxPain * 0.5) then
				{
					_output = (localize "STR_X39_MedSys_var__msg_painReceivedNeg_msg2");
				}
				else
				{
					if(_unitPain < (X39_MedSys_var_Pain_minPainToMaxPain * 0.25)) then
					{
						_output = (localize "STR_X39_MedSys_var__msg_painReceivedNeg_msg3");
					}
					else
					{
						_output = (localize "STR_X39_MedSys_var__msg_painReceivedNeg_msg4");
					};
				};
			};
		};
	};
};
_output