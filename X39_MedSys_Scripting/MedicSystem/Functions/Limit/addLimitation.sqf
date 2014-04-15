#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Adds a limitation to a class
 *	(requires "PushLimitations" to work if just callen on single client)
 *
 *	@ParamsCount - 3
 *	@Param1 - STRING (MedicalOption) - see wiki for valid values
 *	@Param2 - OBJECT/STRING - vehicle/class to add
 *	@Param3 - SCALAR (behaviour - when 0, vehicle is able to heal other units up to 100%
 *								  when 1, vehicle is able to heal other units up to X39_MedSys_var_Limitations_MaxHeal%
 *										  + the vehicle can only heal broken legs when X39_MedSys_var_Limitations_allowHealingLegsInField is set to true
 *										  + the vehicle can only give blood when X39_MedSys_var_Limitations_allowBloodTransfusionInField is set to true
 *								  when 2, vehicle is a "service provider" where all units can be healed up to 100% + the rest
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_medicalOption", "_veh", "_behaviour", "_objectPool"];
_medicalOption	= [_this, 0, "", [""]]					call BIS_fnc_param;
_veh			= [_this, 1, objNull, [objNull, ""]]	call BIS_fnc_param;
_behaviour		= [_this, 2, -1, [0]]					call BIS_fnc_param;

if!([_medicalOption] call X39_MedSys_fnc_isValidLimitation) exitWith { diag_log format["%1 throwed an error on call: param1 '%2' is not a valid medicalOption! %3", _fnc_scriptName, _medicalOption, _this]; };
if(ISOBJECT(_veh) && {isNull _veh}) exitWith { diag_log format["%1 throwed an error on call: param2 '%2' is Null! %3", _fnc_scriptName, _veh, _this]; };
if(ISSTRING(_veh) && {count (toArray _veh) <= 0}) exitWith { diag_log format["%1 throwed an error on call: param2 '%2' length is too small! %3", _fnc_scriptName, _veh, _this]; };
if(_behaviour < 0 || _behaviour > 3) exitWith { diag_log format["%1 throwed an error on call: param3 '%2' is not a valid behaviour value! %3", _fnc_scriptName, _behaviour, _this]; };
_objectPool = missionNamespace getVariable [format["X39_MedSys_var_Limitations_%1", _medicalOption], -1];
if(typeName _objectPool == "SCALAR") then
{
	_objectPool = [] call X39_XLib_fnc_ObjectPool_createObjectPool;
};
[[_veh, _behaviour], _objectPool] call X39_XLib_fnc_ObjectPool_addObject;
missionNamespace setVariable [format["X39_MedSys_var_Limitations_%1", _medicalOption], _objectPool];