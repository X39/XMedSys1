#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	removes the limitation from a class
 *	(requires "PushLimitations" to work if callen on single client)
 *
 *	@ParamsCount - 2
 *	@Param1 - STRING (MedicalOption) - see devReadMe for valid values
 *	@Param2 - OBJECT/STRING - vehicle/class to remove
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_medicalOption", "_veh", "_objectPool"];
_medicalOption	= [_this, 0, "", [""]]					call BIS_fnc_param;
_veh			= [_this, 1, objNull, [objNull, ""]]	call BIS_fnc_param;

if!([_medicalOption] call X39_MedSys_fnc_isValidLimitation) exitWith { diag_log format["%1 throwed an error on call: param1 '%2' is not a valid medicalOption! %3", _fnc_scriptName, _medicalOption, _this]; };
if(ISOBJECT(_veh) && {isNull _veh}) exitWith { diag_log format["%1 throwed an error on call: param2 '%2' is Null! %3", _fnc_scriptName, _veh, _this]; };
if(ISSTRING(_veh) && {count (toArray _veh) <= 0}) exitWith { diag_log format["%1 throwed an error on call: param2 '%2' length is too small! %3", _fnc_scriptName, _veh, _this]; };
_objectPool = missionNamespace getVariable [format["X39_MedSys_var_Limitations_%1", _medicalOption], -1];
if(typeName _objectPool == "SCALAR") exitWith { };

_objects = [_objectPool] call X39_XLib_fnc_ObjectPool_getObjects;
if(count _objects <= 0) exitWith { return [] };
_res = [[], []];
{
	if(_x == _veh) exitWith
	{
		if!([_forEachIndex, _objectPool] call X39_XLib_fnc_ObjectPool_removeObject) then { DEBUG_LOG_WFn("ERROR WHEN REMOVING LIMITATION!") };
		missionNamespace setVariable [format["X39_MedSys_var_Limitations_%1", _medicalOption], _objectPool];
	};
}forEach _objects;