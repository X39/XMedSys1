#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
#define GETALLOWID(X) call{\
	if(!X39_MedSys_var_Limitations_enable) exitWith { return 0 };\
	return [X, player] call X39_MedSys_fnc_isAllowedToUse;\
}
#define ISALLOWEDTOUSE(X) call {\
	_allowID = GETALLOWID(X);\
	if(_allowID < 0) exitWith {return false};\
	return true\
}
/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(dialog) exitWith{ call X39_ActionUI_fnc_closeDialog; };
if !(alive player) exitWith {};
if((player == vehicle player) && !(player call X39_MedSys_fnc_isUnitKnockedOut) && !X39_MedSys_var_PreventGuiOpening) then {
private["_actions", "_tourniquetString", "_allowID"];
_tourniquetString = player call {private["_res"];_res = "";if(_this getVariable ["X39_MedSys_var_Bleeding_hasTourniquet", false])then{_res = "STR_X39_MedSys_var__Option_RemoveTourniquet";}else{	_res = "STR_X39_MedSys_var__Option_PutTourniquet";}; _res};
_earplugString = player call {private["_res"];_res = "";if(_this getVariable ["X39_MedSys_var_hasEarplugs", false])then{_res = "STR_X39_MedSys_var__Option_RemoveEarplugs";}else{	_res = "STR_X39_MedSys_var__Option_PutEarplugs";}; _res};

/*
	createDialog "X39_MedSys_var_Gui";
	call X39_MedSys_fnc_medicalMenuHideAll;
	_index = 1600;
	{
		if(_x select 0) then
		{
			if!(_x select 2) then
			{
				ctrlShow[_index, true];
				ctrlEnable[_index, _x select 1];
				ctrlSetText[_index, _x select 3];
				buttonSetAction[_index, _x select 4];
			};
			_index = _index + 1;
		};
	}forEach [
		[true, false, false, (localize "STR_X39_MedSys_var__Header_MS_Menu"), ""],
		[true, false, true, "", ""],
		[true, true, false, (localize "STR_X39_MedSys_var__Option_CheckSelf"), "_res = [1, player] spawn X39_MedSys_fnc_checkUnitStatus"],
		[true, false, true, "", ""],
		[([BANDAGE, typeOf player] call X39_MedSys_fnc_isAllowedToUse), true, false, (localize "STR_X39_MedSys_var__Option_Bandage"), "_res = [1, player] spawn X39_MedSys_fnc_BandageUnit"],
		[([MORPHINE, typeOf player] call X39_MedSys_fnc_isAllowedToUse), true, false, (localize "STR_X39_MedSys_var__Option_Morphine"), "_res = [1, player] spawn X39_MedSys_fnc_MorphineUnit"],
		[([MEDKIT, typeOf player] call X39_MedSys_fnc_isAllowedToUse), true, false, (localize "STR_X39_MedSys_var__Option_Medikit"), "_res = [1, player] spawn X39_MedSys_fnc_UseMediKitOnUnit"]
	];
*/
		_actions = [
			[0, localize "STR_X39_MedSys_var__Option_CheckSelf", "_res = [0, player] spawn X39_MedSys_fnc_checkUnitStatus"]
		];
		if(ISALLOWEDTOUSE(BANDAGE)) then
		{
			_actions set [count _actions, [1, localize "STR_X39_MedSys_var__Option_Bandage", format["_res = [0, player, %1] spawn X39_MedSys_fnc_BandageUnit", _allowID]]];
		};
		if(ISALLOWEDTOUSE(TOURNIQUET)) then
		{
			_actions set [count _actions, [2, localize _tourniquetString, format["_res = [0, player, %1] spawn X39_MedSys_fnc_putTourniquet", _allowID]]];
		};
		if(ISALLOWEDTOUSE(BLOOD)) then
		{
			_actions set [count _actions, [3, localize "STR_X39_MedSys_var__Option_Blood", format["_res = [0, player, %1] spawn X39_MedSys_fnc_BloodUnit", _allowID]]];
		};
		if(ISALLOWEDTOUSE(MORPHINE)) then
		{
			_actions set [count _actions, [4, localize "STR_X39_MedSys_var__Option_Morphine", format["_res = [0, player, %1] spawn X39_MedSys_fnc_MorphineUnit", _allowID]]];
		};
		if(true) then
		{
			_actions set [count _actions, [5, localize _earplugString, format["_res = [0, player, %1] spawn X39_MedSys_fnc_UseEarplugs", _allowID]]];
		};
		if(ISALLOWEDTOUSE(MEDKIT)) then
		{
			_actions set [count _actions, [6, localize "STR_X39_MedSys_var__Option_Medikit", format["_res = [0, player, %1] spawn X39_MedSys_fnc_UseMediKitOnUnit", _allowID]]];
		};
		DEBUG_LOG(_actions)
		[
			_actions
		]	call X39_ActionUI_fnc_createDialog;

};