#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	removes ALL dead units from all limitations (garbage collector)
 *
 *	@ParamsCount - 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */
{
	private["_medicalOption", "_classLimitations", "_objectLimitations", "_objectPool", "_objects", "_limitedTo"];
	_medicalOption	= [_this, 0, "", [""]] call BIS_fnc_param;
	_classLimitations = [];
	_objectLimitations = [];
	if!([_medicalOption] call X39_MedSys_fnc_isValidLimitation) exitWith { diag_log format["%1 throwed an error on call: param1 '%2' is not a valid medicalOption! %3", _fnc_scriptName, _medicalOption, _this]; };

	_objectPool = missionNamespace getVariable [format["X39_MedSys_var_Limitations_%1", _medicalOption], -1];
	if(typeName _objectPool != "SCALAR") then
	{
		_objects = [_objectPool] call X39_XLib_fnc_ObjectPool_getObjects;
		call {
			private["_x", "_obj"];
			{
				_obj = _x select 0;
				if(ISOBJECT(_obj)) then
				{
					if(!alive _obj) then
					{
						[_forEachIndex, _objectPool] call X39_XLib_fnc_ObjectPool_removeObject;
					};
				};
			}foreach _objects;
		};
	};

}count X39_MedSys_var_Limitations;