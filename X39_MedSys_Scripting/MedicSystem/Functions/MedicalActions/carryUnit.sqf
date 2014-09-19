#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

private["_unit"];
//_animationIndex = [_this, 0, 0, [0]] call BIS_fnc_param;
_unit = [_this, 1, cursorTarget, [objNull]] call BIS_fnc_param;

if(!isNull (player getVariable["X39_MedSys_var_loc_DragCarry_OtherUnit", objNull])) exitWith  {[localize "STR_X39_MedSys_var__msg_DragCarry_InProgress"] call X39_MedSys_fnc_OutputMessageToPlayer;};
if(!(_unit call X39_MedSys_fnc_isUnitKnockedOut) && (_unit call X39_MedSys_fnc_isUnitAbleToMove)) exitWith {[localize "STR_X39_MedSys_var__msg_ThisMakesNoSense"] call X39_MedSys_fnc_OutputMessageToPlayer;};
player playMove "AcinPknlMstpSrasWrflDnon_AcinPercMrunSrasWrflDnon";
_unit attachTo [player, [-0.5,-0.3,0]];
X39_XLib_var_ActionDialog_preventMenuOpening = true;
[[_unit, "AinjPfalMstpSnonWrflDnon_carried_Up"], "X39_MedSys_fnc_helper_playMove", _unit, false] call BIS_fnc_MP;
//_unit playMove "AinjPfalMstpSnonWrflDnon_carried_Up";
player setVariable["X39_MedSys_var_loc_DragCarry_OtherUnit", _unit, false];
player setVariable["X39_MedSys_var_loc_DragCarry_Action", 
	player addAction[localize "STR_X39_MedSys_var__msg_drop", {
		X39_XLib_var_ActionDialog_preventMenuOpening = false;
		_unit = _this select 3;
		player playMove "AcinPercMrunSrasWrflDf_AmovPercMstpSlowWrflDnon";
		detach _unit;
		[[_unit, "AinjPfalMstpSnonWrflDnon_carried_Down"], "X39_MedSys_fnc_helper_playMove", _unit, false] call BIS_fnc_MP;
		//_unit playMove "AinjPfalMstpSnonWrflDnon_carried_Down";
		player removeAction (_this select 2);
		player setVariable["X39_MedSys_var_loc_DragCarry_Action", -1, false];
		player setVariable["X39_MedSys_var_loc_DragCarry_OtherUnit", objNull, false];
	}, _unit, 6, false, true], false];
[] call X39_XLib_fnc_ActionDialog_closeDialog