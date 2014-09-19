#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
#define ITEMSTRING "x39_tourniquet"
/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */


_animationIndex = [_this, 0, 0, [0]] call BIS_fnc_param;
_unit = [_this, 1, cursorTarget, [objNull]] call BIS_fnc_param;
_unit_hasTourniquet = _unit getVariable["X39_MedSys_var_Bleeding_hasTourniquet", false];
[] call X39_XLib_fnc_ActionDialog_closeDialog;
if(items player find ITEMSTRING < 0 && items _unit find ITEMSTRING < 0 && !_unit_hasTourniquet) exitWith{[localize "STR_X39_MedSys_var__msg_NoTourniquetLeft"] call X39_MedSys_fnc_OutputMessageToPlayer;};

player playActionNow (_animationIndex call X39_MedSys_fnc_getMedicAnimation);
X39_XLib_var_ActionDialog_preventMenuOpening = true;
sleep X39_MedSys_var_actionTimeout_PutTourniquet;
X39_XLib_var_ActionDialog_preventMenuOpening = false;
player playAction "medicStop";

if(!_unit_hasTourniquet) then 
{//Put
	_unit setVariable["X39_MedSys_var_Bleeding_hasTourniquet", true, true];
	if(items _unit find ITEMSTRING > 0) then
	{
		_unit removeItem ITEMSTRING;
	}
	else
	{
		player removeItem ITEMSTRING;
	};
}
else
{//Remove
	_unit setVariable["X39_MedSys_var_Bleeding_hasTourniquet", false, true];
	player addItem ITEMSTRING;
};