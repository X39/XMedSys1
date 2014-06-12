#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
#define ITEMSTRING "x39_morphine"

/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_animationIndex", "_unit", "_currentPain", "_newPain", "_allowedID"];
_animationIndex = [_this, 0, 0, [0]] call BIS_fnc_param;
_unit = [_this, 1, cursorTarget, [objNull]] call BIS_fnc_param;
_allowedID = [_this, 2, 0, [0]] call BIS_fnc_param;

call X39_ActionUI_fnc_closeDialog;
if(items player find ITEMSTRING < 0 && items _unit find ITEMSTRING < 0) exitWith{[localize "STR_X39_MedSys_var__msg_NoMorphineLeft"] call X39_MedSys_fnc_OutputMessageToPlayer;};
player playActionNow (_animationIndex call X39_MedSys_fnc_getMedicAnimation);
X39_MedSys_var_PreventGuiOpening = true;
sleep X39_MedSys_var_actionTimeout_MorphineUnit;
X39_MedSys_var_PreventGuiOpening = false;
player playAction "medicStop";
if(X39_MedSys_var_Pain_MorphineAlsoHeals) then
{
	[_unit, X39_MedSys_var_Pain_MorphineHpHealValue, _allowedID] call X39_MedSys_fnc_healUnit;
};
_currentPain = _unit getVariable ["X39_MedSys_var_Pain", 0];
_newPain = _currentPain - X39_MedSys_var_Pain_MorphineHealValue;
if(!X39_MedSys_var_Pain_disableZeroingOnReceive) then
{
	if(_newPain < 0 && _currentPain > 0) then
	{
		_newPain = 0;
	};
};
[_unit, _newPain] call X39_MedSys_fnc_setUnitPain;
if(items _unit find ITEMSTRING > 0) then
{
	_unit removeItem ITEMSTRING;
}
else
{
	player removeItem ITEMSTRING;
};