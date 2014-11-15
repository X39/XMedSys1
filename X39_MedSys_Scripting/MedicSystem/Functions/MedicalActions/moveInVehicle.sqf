#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_animationIndex", "_unit", "_allowedID", "_item", "_removeFrom"];
_animationIndex = [_this, 0, 0, [0]] call BIS_fnc_param;
_unit = [_this, 1, cursorTarget, [objNull]] call BIS_fnc_param;
_allowedID = [_this, 2, -1, [0]] call BIS_fnc_param;

[] call X39_XLib_fnc_ActionDialog_closeDialog;
_veh = nearestObjects[_unit, ["LandVehicle", "Air", "Ship"], 10];
if(count _veh == 0) exitWith {[localize "STR_X39_MedSys_var__VehiclePut_NoVehicleInRange"] call X39_MedSys_fnc_OutputMessageToPlayer;};
_veh = _veh select 0;
[_unit, "(_this select 0) moveInCargo (_this select 1)", [_unit, _veh]] call X39_XLib_fnc_executeLocalToUnit;