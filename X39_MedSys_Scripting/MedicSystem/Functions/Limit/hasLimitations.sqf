#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	check if class has limitations
 *
 *	@ParamsCount - 1
 *	@Param1 - OBJECT/STRING - vehicle/class to check
 *	@Return - Array (MedicalOptions) - returns the limitations
 *	@Author - X39|Cpt. HM Murdock
 */
private["_veh", "_selectionIndex", "_arr", "_res", "_helperFunction"];
_veh = [_this, 0, objNull, [objNull, ""]]	call BIS_fnc_param;
_res = [];
if(ISOBJECT(_veh) && {isNull _veh}) exitWith { diag_log format["%1 throwed an error on call: param2 '%2' is Null! %3", _fnc_scriptName, _veh, _this]; };
if(ISSTRING(_veh) && {count (toArray _veh) <= 0}) exitWith { diag_log format["%1 throwed an error on call: param2 '%2' length is too small! %3", _fnc_scriptName, _veh, _this]; };
if(ISSTRING(_veh)) then
{
	_selectionIndex = 1;
}
else
{
	_selectionIndex = 0;
};
_helperFunction = {
	private["_x"];
	{
		scopeName "out";
		if(_x select 0 == _veh) then
		{
			_res set [count _res, _x];
			breakOut "out";
		};
		false
	}count _this select _selectionIndex;
};
{
	_arr = [_x] call X39_MedSys_fnc_getLimitations;
	if(count _arr <= 0) then
	{
		false
	}
	else
	{
		_arr call _helperFunction;
	};
}count X39_MedSys_var_Limitations;
return _res