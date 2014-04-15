#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	MessageGenerator
 *
 *	@ParamsCount - 1
 *	@Param1 - Object(Unit) - N/A
 *	@Return - String - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_output", "_timestamp", "_time"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_outputRealValueOnly = [_this, 1, false, [false]] call BIS_fnc_param;

_output = "";
if(alive _unit && !(_unit call X39_MedSys_fnc_alive)) then
{
	_timestamp = _unit getVariable["X39_MedSys_var_LifeTime_TimeStamp", -1];
	if(_unit getVariable["X39_MedSys_var_LifeTime_stop", false]) then
	{
		_output = (localize "STR_X39_MedSys_var__msg_cprInProgress");
	}
	else
	{
		_time = floor (time - _timestamp);
		if(_time > 0) then
		{
			if(_outputRealValueOnly) then
			{
				_output = format["%1: %2/%3", localize "STR_X39_MedSys_var__msgReal_LifeTime", _time, X39_MedSys_var_LifeTime];
			}
			else
			{
				if(_time > 500) then
				{
					_output = (localize "STR_X39_MedSys_var__msg_lifeTime_msg1");
				}
				else
				{
					if(_time > 300) then
					{
						_output = (localize "STR_X39_MedSys_var__msg_lifeTime_msg2");
					}
					else
					{
						if(_time > 100) then
						{
							_output = (localize "STR_X39_MedSys_var__msg_lifeTime_msg3");
						}
						else
						{
							_output = (localize "STR_X39_MedSys_var__msg_lifeTime_msg4");
						};
					};
				};
			};
		}
		else
		{
			_output = (localize "STR_X39_MedSys_var__msg_lifeTime_msg5");
		};
	};
};
_output
/* OLD IMPLEMENTATION
private["_output", "_timeLeft"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_outputRealValueOnly = [_this, 1, false, [false]] call BIS_fnc_param;

_output = "";
if(alive _unit && !(_unit call X39_MedSys_fnc_alive)) then
{
	_timeLeft = _unit getVariable["X39_MedSys_var_LifeTime_TimeStamp", -1];
	if(_timeLeft > 0) then
	{
		if(_outputRealValueOnly) then
		{
			_output = format["%1: %2/%3", localize "STR_X39_MedSys_var__msgReal_LifeTime", _timeLeft, X39_MedSys_var_LifeTime];
		}
		else
		{
			if(_timeLeft > 500) then
			{
				_output = (localize "STR_X39_MedSys_var__msg_lifeTime_msg1");
			}
			else
			{
				if(_timeLeft > 300) then
				{
					_output = (localize "STR_X39_MedSys_var__msg_lifeTime_msg2");
				}
				else
				{
					if(_timeLeft > 100) then
					{
						_output = (localize "STR_X39_MedSys_var__msg_lifeTime_msg3");
					}
					else
					{
						_output = (localize "STR_X39_MedSys_var__msg_lifeTime_msg4");
					};
				};
			};
		};
	}
	else
	{
		_output = (localize "STR_X39_MedSys_var__msg_lifeTime_msg5");
	};
};
_output
*/