#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	N/A
 *
 *	@ParamsCount - 1
 *	@Param1 - OBJECT - N/A
 *	@Param1 - BOOL - N/A
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_UnitDealtDamage", "_applyScoreChange"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_applyScoreChange = [_this, 0, true, [true]] call BIS_fnc_param;
if(isNull _unit) exitWith { diag_log "X39_MedSys_fnc_killUnit - no valid unit provided";};
_UnitDealtDamage = _unit getVariable["X39_MedSys_var_LastHitter", objNull];
_unit setDamage 1;
if(_applyScoreChange) then
{
	_unit addScore -1;
	if(!isNull _UnitDealtDamage) then
	{
		_UnitDealtDamage addScore 1;
	};
};
if(_unit getVariable ["X39_MedSys_var_UnitInitilized", false]) then
{
	[] call X39_MedSys_fnc_closeBlackOutDisplay;
	[] call X39_MedSys_fnc_resetEffects;
};