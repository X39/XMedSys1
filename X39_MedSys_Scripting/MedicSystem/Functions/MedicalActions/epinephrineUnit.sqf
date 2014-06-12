#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Handle the SelfInteraction KeyPress
 *	(Open correct GUI etc.)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

#define ITEMSTRING "x39_epinephrine"
_animationIndex = [_this, 0, 0, [0]] call BIS_fnc_param;
_unit = [_this, 1, cursorTarget, [objNull]] call BIS_fnc_param;
call X39_ActionUI_fnc_closeDialog;
if(items player find ITEMSTRING < 0 && items _unit find ITEMSTRING < 0) exitWith{[localize "STR_X39_MedSys_var__msg_NoEpiLeft"] call X39_MedSys_fnc_OutputMessageToPlayer;};
_isBleeding = (_unit call X39_MedSys_fnc_getPlayerBleeding) select 0;
_unitDamage = damage _unit;
player playActionNow (_animationIndex call X39_MedSys_fnc_getMedicAnimation);
X39_MedSys_var_PreventGuiOpening = true;
sleep X39_MedSys_var_actionTimeout_EpinephrineUnit;
player playAction "medicStop";
X39_MedSys_var_PreventGuiOpening = false;
if(!_isBleeding && (_unit call X39_MedSys_fnc_alive)) then
{
	[_unit, false] call X39_MedSys_fnc_knockOutUnit;
	//if(_unitDamage >= X39_MedSys_var_Generic_DamageBeforePermaKnockOut) then
	//{
	//	[_unit, X39_MedSys_var_Generic_DamageBeforePermaKnockOut - 0.1] call X39_MedSys_fnc_setUnitDamage;
	//}
	//else
	//{
		if(_unitDamage >= X39_MedSys_var_Generic_DamageBeforeKnockOut) then
		{
			[format["%1 %2", name _unit, localize "STR_X39_MedSys_var__msg_tooDamagedToBeRevived"]] call X39_MedSys_fnc_OutputMessageToPlayer;
			//[_unit, X39_MedSys_var_Generic_DamageBeforeKnockOut - 0.1] call X39_MedSys_fnc_setUnitDamage;
		};
	//};
}
else
{
	if(_isBleeding) then
	{
		[localize "STR_X39_MedSys_var__msg_TargetStillBleeding"] call X39_MedSys_fnc_OutputMessageToPlayer;
	}
	else
	{
		[localize "STR_X39_MedSys_var__msg_TargetIsNotKnockedOut"] call X39_MedSys_fnc_OutputMessageToPlayer;
	};
};
if(items _unit find ITEMSTRING > 0) then
{
	_unit removeItem ITEMSTRING;
}
else
{
	player removeItem ITEMSTRING;
};