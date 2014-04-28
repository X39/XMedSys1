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

if(!isNull (player getVariable["X39_MedSys_var_DragCarry_OtherUnit", objNull])) exitWith  {[localize "STR_X39_MedSys_var__msg_DragCarry_InProgress"] call X39_MedSys_fnc_OutputMessageToPlayer;};
if!(_unit call X39_MedSys_fnc_isUnitKnockedOut) exitWith {[localize "STR_X39_MedSys_var__msg_ThisMakesNoSense"] call X39_MedSys_fnc_OutputMessageToPlayer;};

// copied from https://community.bistudio.com/wiki/selectWeapon
// Desc: select default weapon & handle multiple muzzles
if ((primaryWeapon player) != "") then {
	private['_type', '_muzzles'];
	 _type = primaryWeapon player;
	// check for multiple muzzles (eg: GL)
	_muzzles = getArray(configFile >> "cfgWeapons" >> _type >> "muzzles");
	if (count _muzzles > 1) then {
		player selectWeapon (_muzzles select 0);
	} else {
		player selectWeapon _type;
	};
};

player playMove "AcinPknlMstpSrasWrflDnon";
_unit attachTo [player];
_unit setDir (direction _unit - 180);
_unit switchMove "AinjPpneMstpSnonWrflDb";
player setVariable["X39_MedSys_var_DragCarry_OtherUnit", _unit, false];
player setVariable["X39_MedSys_var_DragCarry_Action", 
	player addAction[localize "STR_X39_MedSys_var__msg_drop", {
		_unit = _this select 3;
		player playMove "AidlPknlMstpSrasWrflDnon_AI";
		detach _unit;
		_unit playMove "AinjPpneMstpSnonWrflDb_release";
		player removeAction (_this select 2);
		player setVariable["X39_MedSys_var_DragCarry_Action", -1, false];
		player setVariable["X39_MedSys_var_DragCarry_OtherUnit", objNull, false];
	}, _unit, 6, false, true], false];
call X39_ActionUI_fnc_closeDialog;