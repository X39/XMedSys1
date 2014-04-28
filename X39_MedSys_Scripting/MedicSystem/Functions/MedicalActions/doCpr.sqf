#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_animationIndex", "_unit"];

_animationIndex = [_this, 0, 0, [0]] call BIS_fnc_param;
_unit = [_this, 1, cursorTarget, [objNull]] call BIS_fnc_param;
if(_unit call X39_MedSys_fnc_alive) exitWith {[localize "STR_X39_MedSys_var__msg_ThisMakesNoSense"] call X39_MedSys_fnc_OutputMessageToPlayer;};
player playActionNow (_animationIndex call X39_MedSys_fnc_getMedicAnimation);
_unit setVariable["X39_MedSys_var_LifeTime_stop", true, true];
player setVariable["X39_MedSys_var_loc_doCpr_inProgress", _unit, false];
X39_MedSys_var_PreventGuiOpening = true;
player setVariable["X39_MedSys_var_loc_doCpr_action", 
	player addAction[localize "STR_X39_MedSys_var__msg_stop_crp", {
		X39_MedSys_var_PreventGuiOpening = false;
		_unit = _this select 3;
		_unit setVariable["X39_MedSys_var_LifeTime_stop", false, true];
		player playAction "medicStop";
		player removeAction (_this select 2);
		player setVariable["X39_MedSys_var_loc_doCpr_action", -1, false];
		player setVariable["X39_MedSys_var_loc_doCpr_inProgress", objNull, false];
	}, _unit, 6, false, true], false];
call X39_ActionUI_fnc_closeDialog;
/*
player playMove "AcinPknlMstpSrasWrflDnon_AcinPercMrunSrasWrflDnon";
_unit attachTo [player, [-0.5,-0.3,0]];
_unit playMove "AinjPfalMstpSnonWrflDnon_carried_Up";
player setVariable["X39_MedSys_var_DragCarry_OtherUnit", _unit, false];
player setVariable["X39_MedSys_var_DragCarry_Action", 
	player addAction["<t color='#FF0000'>Drop</t>", {
		_unit = _this select 3;
		player playMove "AcinPercMrunSrasWrflDf_AmovPercMstpSlowWrflDnon";
		detach _unit;
		_unit playMove "AinjPfalMstpSnonWrflDnon_carried_Down";
		player removeAction (_this select 2);
		player setVariable["X39_MedSys_var_DragCarry_Action", -1, false];
		player setVariable["X39_MedSys_var_DragCarry_OtherUnit", objNull, false];
	}, _unit, 6, false, true], false];
closeDialog 30099;
*/
//TODO
//Action "stop CPR" hinzufügen
//ActionID spawn { prüfe ob spieler ausgeknockt };
//X39_MedSys_fnc_isUnitKnockedOut
//player playAction "medicStop";