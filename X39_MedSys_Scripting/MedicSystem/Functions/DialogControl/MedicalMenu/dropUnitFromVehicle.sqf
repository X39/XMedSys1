#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Handle the OthersInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 1
 *	@Param1 - Object - vehicle which is targeted
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_actions = [
				[true, false, false, (localize "STR_X39_MedSys_var__Header_MS_Menu"), ""],
				[true, false, true, "", ""]
			];
X39_MedSys_var_MedicalMenu_PullUnitFromVehicle_TempObjectsPlaceholder = crew _this;
{
	if(_x getVariable ["X39_MedSys_var_UnitInitilized", false]) then
	{
		if(_x call X39_MedSys_fnc_isUnitKnockedOut) then
		{
			_name = "";
			if(isPlayer _x) then { _name = name _x}
							else { _name = str _x};
			_actions set[count _actions, [
				true,																																																	//activate (not for this usecase!)
				true,																																																	//enable
				false,																																																	//emptySpace
				format["%1 %2 %3", localize "STR_X39_MedSys_var__VehiclePull_Pull", name _x, localize "STR_X39_MedSys_var__VehiclePull_OutOfVehicle"],																			//DisplayString
				format["_res = [] spawn{[(X39_MedSys_var_MedicalMenu_PullUnitFromVehicle_TempObjectsPlaceholder select %1),""X39_MedSys_fnc_pullUnitOutOfVehicle"", (X39_MedSys_var_MedicalMenu_PullUnitFromVehicle_TempObjectsPlaceholder select %1), false] call BIS_fnc_MP; cursorTarget call X39_MedSys_fnc_MM_dropUnitFromVehicle}", _forEachIndex]	//ButtonAction
			]];
		};
	};
}forEach X39_MedSys_var_MedicalMenu_PullUnitFromVehicle_TempObjectsPlaceholder;
if(count _actions <= 2) then
{
	_actions set[count _actions, [true, false, false, "NA", ""]];
};
call X39_MedSys_fnc_medicalMenuHideAll;
_actions call X39_MedSys_fnc_medicalMenuCreateMenu;