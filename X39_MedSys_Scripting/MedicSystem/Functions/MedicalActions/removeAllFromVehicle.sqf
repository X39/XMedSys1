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
{
	if(_unit call X39_MedSys_fnc_isUnitKnockedOut) then
	{
		moveOut _x;
	};
	false
}count crew _unit