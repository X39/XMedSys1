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

#define LOCAL_KEY ((X39_MedSys_var_Keys select 1) select 0)
/**
 *	Handle the OthersInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_otherUnit", "_tourniquetString", "_actions", "_allowID"];
if(dialog) exitWith{ call X39_ActionUI_fnc_closeDialog; };
if((player == vehicle player) && !(player call X39_MedSys_fnc_isUnitKnockedOut) && !X39_MedSys_var_PreventGuiOpening) then {
	_otherUnit = cursorTarget;
	if(_otherUnit getVariable ["X39_MedSys_var_UnitInitilized", false] && player distance _otherUnit < 4) then
	{
		_tourniquetString = _otherUnit call {private["_res"];_res = "";if(_this getVariable ["X39_MedSys_var_Bleeding_hasTourniquet", false])then{_res = "STR_X39_MedSys_var__Option_RemoveTourniquet";}else{	_res = "STR_X39_MedSys_var__Option_PutTourniquet";}; _res};
		/*
		createDialog "X39_MedSys_var_Gui";
		call X39_MedSys_fnc_medicalMenuHideAll;
		[
			[true, false, false, (localize "STR_X39_MedSys_var__Header_MS_Menu"), ""],
			[true, false, true, "", ""],
			[true, true, false, format["%1 '%2'", (localize "STR_X39_MedSys_var__Option_CheckOther"), name _otherUnit], "_res = [0, cursorTarget] spawn X39_MedSys_fnc_checkUnitStatus"],
			[true, false, true, "", ""],
			[([BANDAGE, typeOf player] call X39_MedSys_fnc_isAllowedToUse), true, false, (localize "STR_X39_MedSys_var__Option_Bandage"), "_res = [0, cursorTarget] spawn X39_MedSys_fnc_BandageUnit"],
			[([TOURNIQUET, typeOf player] call X39_MedSys_fnc_isAllowedToUse), true, false, (localize _tourniquetString), "_res = [0, cursorTarget] spawn X39_MedSys_fnc_putTourniquet"],
			[([BLOOD, typeOf player] call X39_MedSys_fnc_isAllowedToUse), true, false, (localize "STR_X39_MedSys_var__Option_Blood"), "_res = [0, cursorTarget] spawn X39_MedSys_fnc_BloodUnit"],
			[([MORPHINE, typeOf player] call X39_MedSys_fnc_isAllowedToUse), true, false, (localize "STR_X39_MedSys_var__Option_Morphine"), "_res = [0, cursorTarget] spawn X39_MedSys_fnc_MorphineUnit"],
			[([EPINEPHRINE, typeOf player] call X39_MedSys_fnc_isAllowedToUse), true, false, (localize "STR_X39_MedSys_var__Option_Epinephrine"), "_res = [0, cursorTarget] spawn X39_MedSys_fnc_EpinephrineUnit"],
			[([DEPHIBRILATE, typeOf player] call X39_MedSys_fnc_isAllowedToUse), true, false, (localize "STR_X39_MedSys_var__Option_Defibrillator"), "_res = [0, cursorTarget] spawn X39_MedSys_fnc_defibrilatorUnit"],
			[([MEDKIT, typeOf player] call X39_MedSys_fnc_isAllowedToUse), true, false, (localize "STR_X39_MedSys_var__Option_Medikit"), "_res = [0, cursorTarget] spawn X39_MedSys_fnc_UseMediKitOnUnit"],
			[true, false, true, "", ""],
			[true, false, false, (localize "STR_X39_MedSys_var__Header_Character_Interactions"), ""],
			[true, true, false, (localize "STR_X39_MedSys_var__Interaction_Drag"), "_res = [0, cursorTarget] spawn X39_MedSys_fnc_DragUnit"],
			[true, true, false, (localize "STR_X39_MedSys_var__Interaction_Carry"), "_res = [0, cursorTarget] spawn X39_MedSys_fnc_CarryUnit"]
		] call X39_MedSys_fnc_medicalMenuCreateMenu;
		*/
		//----------------------------------------------------------------------------------------------------------------------------------
		_actions = [];
		_actions set [count _actions, [0, format["%1 '%2'", (localize "STR_X39_MedSys_var__Option_CheckOther"), name _otherUnit], "_res = [0, cursorTarget] spawn X39_MedSys_fnc_checkUnitStatus"]];
		if(X39_MedSys_var_enableDrag) then
		{
			_actions set [count _actions, [9, localize "STR_X39_MedSys_var__Interaction_Drag", "_res = [0, cursorTarget] spawn X39_MedSys_fnc_DragUnit"]];
		};
		if(X39_MedSys_var_enableCarry) then
		{
			_actions set [count _actions, [10, localize "STR_X39_MedSys_var__Interaction_Carry", "_res = [0, cursorTarget] spawn X39_MedSys_fnc_CarryUnit"]];
		};

		if(ISALLOWEDTOUSE(BANDAGE)) then
		{
			_actions set [count _actions, [1, localize "STR_X39_MedSys_var__Option_Bandage", format["_res = [0, cursorTarget, %1] spawn X39_MedSys_fnc_BandageUnit", _allowID]]];
		};
		if(ISALLOWEDTOUSE(TOURNIQUET)) then
		{
			_actions set [count _actions, [2, localize _tourniquetString, format["_res = [0, cursorTarget, %1] spawn X39_MedSys_fnc_putTourniquet", _allowID]]];
		};
		if(ISALLOWEDTOUSE(BLOOD)) then
		{
			_actions set [count _actions, [3, localize "STR_X39_MedSys_var__Option_Blood", format["_res = [0, cursorTarget, %1] spawn X39_MedSys_fnc_BloodUnit", _allowID]]];
		};
		if(ISALLOWEDTOUSE(MORPHINE)) then
		{
			_actions set [count _actions, [4, localize "STR_X39_MedSys_var__Option_Morphine", format["_res = [0, cursorTarget, %1] spawn X39_MedSys_fnc_MorphineUnit", _allowID]]];
		};
		if(ISALLOWEDTOUSE(MEDKIT)) then
		{
			_actions set [count _actions, [6, localize "STR_X39_MedSys_var__Option_Medikit", format["_res = [0, cursorTarget] spawn X39_MedSys_fnc_UseMediKitOnUnit", _allowID]]];
		};
		_reviveTopMenu = ["LIST"];
		if(ISALLOWEDTOUSE(EPINEPHRINE)) then
		{
			_reviveTopMenu set [count _reviveTopMenu, [0, localize "STR_X39_MedSys_var__Option_Epinephrine", format["_res = [0, cursorTarget, %1] spawn X39_MedSys_fnc_EpinephrineUnit", _allowID]]];
		};
		if(ISALLOWEDTOUSE(DEFIBRILLATE)) then
		{
			_reviveTopMenu set [count _reviveTopMenu, [1, localize "STR_X39_MedSys_var__Option_Defibrillator", format["_res = [0, cursorTarget, %1] spawn X39_MedSys_fnc_defibrilatorUnit", _allowID]]];
		};
		_reviveTopMenu set [count _reviveTopMenu, [2, localize "STR_X39_MedSys_var__Interaction_doCPR", "_res = [0, cursorTarget] spawn X39_MedSys_fnc_doCpr"]];
		_reviveTopMenu set [count _reviveTopMenu, [3, localize "STR_X39_MedSys_var__Interaction_doStabilize", "_res = [0, cursorTarget] spawn X39_MedSys_fnc_stabilize"]];
			
		_actions set [count _actions, [8, localize "STR_X39_MedSys_var__ReviveTopMenu", "", nil, _reviveTopMenu]];
		DEBUG_LOG(_actions)
		[
			_actions
		]	call X39_ActionUI_fnc_createDialog;
		//----------------------------------------------------------------------------------------------------------------------------------
	}
	else 
	{
		if(_otherUnit isKindOf "car" || _otherUnit isKindOf "air") then
		{
			private["_putActions", "_pullActions"];
			//get knockedout units around
			X39_MedSys_var_MedicalMenu_PullUnitFromVehicle_TempObjectsPlaceholder = nearestObjects[position player, ["CAManBase"], 10];
			_pullActions = ["LIST"];
			{
				if(_x getVariable ["X39_MedSys_var_UnitInitilized", false]) then
				{
					if(_x call X39_MedSys_fnc_isUnitKnockedOut) then
					{
						_pullActions set[count _pullActions, [
							0,
							format["%1 %2 %3", localize "STR_X39_MedSys_var__VehiclePut_Put", name _x, localize "STR_X39_MedSys_var__VehiclePut_IntoVehicle"],
							format["_res = [] spawn{[[(X39_MedSys_var_MedicalMenu_PullUnitFromVehicle_TempObjectsPlaceholder select %1), cursorTarget], ""X39_MedSys_fnc_putUnitIntoVehicle"", (X39_MedSys_var_MedicalMenu_PullUnitFromVehicle_TempObjectsPlaceholder select %1), false] call BIS_fnc_MP; cursorTarget call X39_MedSys_fnc_MM_putUnitIntoVehicle}; call X39_ActionUI_fnc_closeDialog;", _forEachIndex]
						]];
					};
				};
			}forEach X39_MedSys_var_MedicalMenu_PullUnitFromVehicle_TempObjectsPlaceholder;
			//get knockedout units in vehicle
			X39_MedSys_var_MedicalMenu_PutUnitIntoVehicle_TempObjectsPlaceholder = crew _otherUnit;
			_putActions = ["LIST"];
			{
				if(_x getVariable ["X39_MedSys_var_UnitInitilized", false]) then
				{
					if(_x call X39_MedSys_fnc_isUnitKnockedOut) then
					{
						_putActions set[count _putActions, [
							0,
							format["%1 %2 %3", localize "STR_X39_MedSys_var__VehiclePull_Pull", name _x, localize "STR_X39_MedSys_var__VehiclePull_OutOfVehicle"],
							format["_res = [] spawn{[(X39_MedSys_var_MedicalMenu_PutUnitIntoVehicle_TempObjectsPlaceholder select %1),""X39_MedSys_fnc_pullUnitOutOfVehicle"", (X39_MedSys_var_MedicalMenu_PutUnitIntoVehicle_TempObjectsPlaceholder select %1), false] call BIS_fnc_MP; cursorTarget call X39_MedSys_fnc_MM_dropUnitFromVehicle}; call X39_ActionUI_fnc_closeDialog;", _forEachIndex]
						]];
					};
				};
			}forEach X39_MedSys_var_MedicalMenu_PutUnitIntoVehicle_TempObjectsPlaceholder;
			//finally create the UI
			_actions = [[0, localize "STR_X39_MedSys_var__Option_CloseUI", "call X39_ActionUI_fnc_closeDialog;"]];
			if(count _putActions > 1) then
			{
				_actions set [count _actions, [3, format["%1 %2", localize "STR_X39_MedSys_var__VehiclePull_Pull", localize "STR_X39_MedSys_var__VehiclePull_OutOfVehicle"], "", {}, _putActions]];
			};
			if(count _pullActions > 1) then
			{
				_actions set [count _actions, [8, format["%1 %2", localize "STR_X39_MedSys_var__VehiclePut_Put", localize "STR_X39_MedSys_var__VehiclePut_IntoVehicle"], "", {}, _pullActions]];
			};
			[
				_actions 
			] call X39_ActionUI_fnc_createDialog;
		};
	};
};