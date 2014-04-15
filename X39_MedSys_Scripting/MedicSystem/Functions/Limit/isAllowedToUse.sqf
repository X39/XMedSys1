#define USERETURN
#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	validates that a object/class is allowed to use an action
 *
 *	@ParamsCount - 2
 *	@Param1 - STRING (MedicalOption) - see wiki for valid values
 *	@Param2 - OBJECT/STRING - object/class to check
 *	@Return - SCALAR - -1 if not allowed, 0 if allowed without limitations, 1 if allowed with overridden limitations, 2 if allowed with limitations
 *	@Author - X39|Cpt. HM Murdock
 */
private["_medicalOption", "_limitationObjects", "_obj", "_nearObjects", "_object", "_class", "_behaviour", "_x", "_res"];
_medicalOption = [_this, 0, "", [""]] call BIS_fnc_param;
_object = [_this, 1, objNull, ["", objNull]] call BIS_fnc_param;

if!([_medicalOption] call X39_MedSys_fnc_isValidLimitation) exitWith { diag_log format["%1 throwed an error on call: param1 '%2' is not a valid medicalOption! %3", _fnc_scriptName, _medicalOption, _this]; -1 };
if(ISOBJECT(_object) && {isNull _object}) exitWith { diag_log format["%1 throwed an error on call: param2 '%2' is Null! %3", _fnc_scriptName, _object, _this];  -1};
if(ISSTRING(_object) && {count (toArray _object) <= 0}) exitWith { diag_log format["%1 throwed an error on call: param2 '%2' length is too small! %3", _fnc_scriptName, _object, _this];  -1 };
_limitationObjects = [_medicalOption] call X39_MedSys_fnc_getLimitations;
if(count _limitationObjects == 0) exitWith {-1};
DEBUG_LOG_WFn(format ["handling '%1'" COMMA _limitationObjects])
if(ISSTRING(_object)) then
{
	DEBUG_LOG_WFn(format ["%1 is a string" COMMA _object])
	_objects = _limitationObjects select 1;
	DEBUG_LOG_WFn(format ["got '%1' objects to check" COMMA count _objects])
	{
		_class = _x select 0;
		if(_class == _object) then
		{
			_behaviour = _x select 1;
			//when 0, vehicle is able to heal other units up to 100%
			_res = -1;
			if(_behaviour == 0) then
			{
				_res = 0;
			}
			else
			{
				/*
				 *	when 1, vehicle is able to heal other units up to X39_MedSys_var_Limitations_MaxHeal%
				 *	+ the vehicle can only heal broken legs when X39_MedSys_var_Limitations_allowHealingLegsInField is set to true
				 *	+ the vehicle can only give blood when X39_MedSys_var_Limitations_allowBloodTransfusionInField is set to true
				 */
				if(_behaviour == 1) then
				{
					_res = 2;
				}
				else
				{
					//when 2, vehicle is a "service provider" where all units can be healed up to 100% + the rest
					if(_behaviour == 2) then
					{
						_res = 0;
					}
					else
					{
						 diag_log format["%1 wrong behaviour ID on '%2': %3! %4", _fnc_scriptName, _class, _behaviour, _this];
					};
				};
			};
			returnToEnd
		}DEBUG_CODE_NS(else{diag_log format["%3 %4: class '%1' != class '%2'" COMMA _class COMMA _object COMMA time COMMA _fnc_scriptName];});
		false
	}count _objects;
	if(true) then { _res = -1; returnToEnd};
}
else
{
	DEBUG_LOG_WFn(format ["%1 is not a string" COMMA _object])
	if(ISOBJECT(_object)) then
	{
		DEBUG_LOG_WFn(format ["%1 is an object" COMMA _object])
		_objects = _limitationObjects select 0;
		{
			_obj = _x select 0;
			if(_obj == _object) then
			{
				_behaviour = _x select 1;
				//when 0, vehicle is able to heal other units up to 100%
				if(_behaviour == 0) then
				{
					_res = 0;
				}
				else
				{
					/*
					 *	when 1, vehicle is able to heal other units up to X39_MedSys_var_Limitations_MaxHeal%
					 *	+ the vehicle can only heal broken legs when X39_MedSys_var_Limitations_allowHealingLegsInField is set to true
					 *	+ the vehicle can only give blood when X39_MedSys_var_Limitations_allowBloodTransfusionInField is set to true
					 */
					if(_behaviour == 1) then
					{
						_res = 2;
						_nearObjects = nearestObjects[position _object, ["all"], X39_MedSys_var_Limitations_serviceProviderRange];
						if(call {
							private["_x", "_flag"];
							{
								scopeName "out";
								_flag = _x call {
									private["_x", "_flag"];
									_flag = {
										if(_x select 1 >= 2) exitWith{true};
										false
									}count _nearObjects;
									if(typeName _flag == "BOOL") exitWith { _flag };
									_flag = {
										if(_x select 1 == 1) exitWith
										{
											if(_x call{
												private["_x"];
												{
													if(_this == typeOf _x) exitWith {true};
													false
												}count _nearObjects;
											})exitWith{true};
										};
										false
									}count (_limitationObjects select 1);
									if(typeName _flag == "BOOL") exitWith { _flag };
									false
								};
								if(typeName _flag == "BOOL") exitWith { _flag };
								false
							}count _nearObjects;
							false
						}) then
						{
							_res = 1;
						};
					}
					else
					{
						//when 2, vehicle is a "service provider" where all units can be healed up to 100% + the rest
						if(_behaviour == 2) then
						{
							_res = 0;
						};
					};
				};
				returnToEnd
			}DEBUG_CODE_NS(else{diag_log format["%3 %4: object '%1' != object '%2'" COMMA _obj COMMA _object COMMA time COMMA _fnc_scriptName];});
			false
		}count _objects;
		if(true) then { _res = (([_medicalOption, typeOf _object] call (missionNamespace getVariable _fnc_scriptName))); returnToEnd};
	};
};
DEBUG_LOG_WFn(format ["Returning: '%1'" COMMA _res])
_res