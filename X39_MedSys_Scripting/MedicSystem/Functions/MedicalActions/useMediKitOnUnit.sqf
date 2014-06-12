#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
#define ITEMSTRINGS ["x39_medikit", "x39_medikit2", "x39_medikit3", "x39_medikit4", "x39_medikit5"]
#define ITEMSTRING(X) (ITEMSTRINGS select X)
/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_animationIndex", "_unit", "_allowedID", "_item", "_removeFrom"];
_animationIndex = [_this, 0, 0, [0]] call BIS_fnc_param;
_unit = [_this, 1, cursorTarget, [objNull]] call BIS_fnc_param;
_allowedID = [_this, 2, -1, [0]] call BIS_fnc_param;

call X39_ActionUI_fnc_closeDialog;
_item = false;
if(items player find ITEMSTRING(4) >= 0 || items _unit find ITEMSTRING(4) >= 0)  then { _item = ITEMSTRING(4) } else { 
	if(items player find ITEMSTRING(3) >= 0 || items _unit find ITEMSTRING(3) >= 0)  then { _item = ITEMSTRING(3) } else { 
		if(items player find ITEMSTRING(2) >= 0 || items _unit find ITEMSTRING(2) >= 0)  then { _item = ITEMSTRING(2) } else { 
			if(items player find ITEMSTRING(1) >= 0 || items _unit find ITEMSTRING(1) >= 0)  then { _item = ITEMSTRING(1) } else { 
				if(items player find ITEMSTRING(0) >= 0 || items _unit find ITEMSTRING(0) >= 0)  then { _item = ITEMSTRING(0) };
			};
		};
	};
};
if(typeName _item == "BOOL") exitWith{[localize "STR_X39_MedSys_var__msg_NoMediKitLeft"] call X39_MedSys_fnc_OutputMessageToPlayer;};
player playActionNow (_animationIndex call X39_MedSys_fnc_getMedicAnimation);
X39_MedSys_var_PreventGuiOpening = true;
sleep X39_MedSys_var_actionTimeout_UseMedkitOnUnit;
X39_MedSys_var_PreventGuiOpening = false;
player playAction "medicStop";
if(X39_MedSys_var_Limitations_allowHealingLegsInField && _allowedID != ALLOWED_LIMITED) then
{
	[_unit, 0] call X39_MedSys_fnc_hitzoneLeg_setDamage;
};
if(X39_MedSys_var_Limitations_allowHealingHeadInField && _allowedID != ALLOWED_LIMITED) then
{
	[_unit, 0] call X39_MedSys_fnc_hitzoneHead_setDamage;
};

[_unit, X39_MedSys_var_Healing_MedKitValue, _allowedID] call X39_MedSys_fnc_healUnit;
_removeFrom = objNull;
if(items _unit find _item > 0) then
{
	_removeFrom = _unit;
}
else
{
	_removeFrom = player;
};
_removeFrom removeItem _item;
if(_item != ITEMSTRING(0)) then
{
	_removeFrom addItem (ITEMSTRINGS select ((ITEMSTRINGS find _item) - 1));
};