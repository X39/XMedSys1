#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Adds "AnimChanged" eventHandler to unit with the correct code
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (Unit) - N/A
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
 
_this addEventHandler["AnimChanged", 
{
	DEBUG_LOG(format["AnimChanged EH has been triggered with the arguments: %1" KOMMA _this])
	_unit = _this select 0;
	_otherUnitDragCarry = _unit getVariable["X39_MedSys_var_loc_DragCarry_OtherUnit", objNull];
	_otherUnitCpr = _unit getVariable["X39_MedSys_var_loc_doCpr_inProgress", objNull];
	if(_unit call X39_MedSys_fnc_isUnitInProneStance) then
	{
		if !(_unit call X39_MedSys_fnc_isUnitAbleToMove) then
		{
			_unit playActionNow "down";
		};
		if(!isNull _otherUnitDragCarry) then
		{
			detach _otherUnitDragCarry;
			_otherUnitDragCarry playMoveNow "AinjPpneMstpSnonWrflDb_release";
			if(isPlayer _unit) then
			{
				_unit removeAction (_unit getVariable["X39_MedSys_var_loc_DragCarry_Action", -1]);
			};
			_unit setVariable["X39_MedSys_var_loc_DragCarry_OtherUnit", objNull, false];
			_unit setVariable["X39_MedSys_var_loc_DragCarry_Action", -1, false];
		};
	};
	if(!isNull _otherUnitCpr) then
	{
		if (X39_MedSys_var_StartCRP) then {
			X39_MedSys_var_StartCRP = false;
		} else {
			X39_MedSys_var_PreventGuiOpening = false;
			_otherUnitCpr setVariable["X39_MedSys_var_LifeTime_stop", false, true];
			_unit playAction "medicStop";
			if(isPlayer _unit) then
			{
				_unit removeAction (_unit getVariable ["X39_MedSys_var_loc_doCpr_action", -1]);
			};
			_unit setVariable["X39_MedSys_var_loc_doCpr_action", -1, false];
			_unit setVariable["X39_MedSys_var_loc_doCpr_inProgress", objNull, false];
		};
	};
}];