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
_UnitDealtDamage = _unit setVariable["X39_MedSys_var_LastHitter", objNull];
_unit setDamage 1;
if(_applyScoreChange) then
{
	_unit addScore 1; // revert -1 score because setDamage
	if(!isNull _UnitDealtDamage) then
	{	
		if ([_unit call BIS_fnc_objectSide, _UnitDealtDamage call BIS_fnc_objectSide] call BIS_fnc_areFriendly)then {
			_UnitDealtDamage addScore -1; // decrease score for friend kill
		} else {
			_UnitDealtDamage addScore 1; // increase score for enemy kill
		};		
	};
};
if(_unit getVariable ["X39_MedSys_var_UnitInitilized", false]) then
{
	[] call X39_MedSys_fnc_closeBlackOutDisplay;
	[] call X39_MedSys_fnc_resetEffects;
};