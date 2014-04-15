#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	get current objects/classes having the given limitation assigned
 *
 *	@ParamsCount - 1
 *	@Param1 - STRING (MedicalOption) - see wiki for valid values
 *	@Return - Array - Allowed objects/classes (array will be empty if no limitations found)
 *					  Array structure: [[objects], [classes]]
 *							- where a single OBJECT will have the structure: [OBJECT, SCALAR (behaviour)]
 *							- where a single CLASS will have the structure: [STRING (containing the class name), SCALAR (behaviour)]
 *	@Author - X39|Cpt. HM Murdock
 */
private["_medicalOption", "_classLimitations", "_objectLimitations", "_objectPool", "_objects", "_limitedTo"];
_medicalOption	= [_this, 0, "", [""]] call BIS_fnc_param;
_classLimitations = [];
_objectLimitations = [];
if!([_medicalOption] call X39_MedSys_fnc_isValidLimitation) exitWith { diag_log format["%1 throwed an error on call: param1 '%2' is not a valid medicalOption! %3", _fnc_scriptName, _medicalOption, _this];  return [] };

_objectPool = missionNamespace getVariable [format["X39_MedSys_var_Limitations_%1", _medicalOption], -1];
if(typeName _objectPool == "SCALAR") exitWith { DEBUG_LOG_WFn("ObjectPool is not existing!") return [] };

_objects = [_objectPool] call X39_XLib_fnc_ObjectPool_getObjects;
if(count _objects <= 0) exitWith { DEBUG_LOG_WFn("ObjectPool has no objects inside!") return [] };
_res = [[], []];
{
	if(typeName _x == "ARRAY") then
	{
		_limitedTo = _x select 0;
		if(ISSTRING(_limitedTo)) then
		{
			_classLimitations set[count _classLimitations, _x];
		}
		else
		{
			if(ISOBJECT(_limitedTo)) then
			{
				_objectLimitations set[count _objectLimitations, _x];
			};
		};
	};
	false
}count _objects;
return [_objectLimitations, _classLimitations];