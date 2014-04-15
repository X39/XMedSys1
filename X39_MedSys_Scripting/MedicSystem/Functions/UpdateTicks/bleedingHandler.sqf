#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (UNIT)	- Unit to watch
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */

if(!X39_MedSys_var_Bleeding_Allow) exitWith { };

_isBleeding = _this getVariable ["X39_MedSys_var_Bleeding_isBleeding", false];
_hasTourniquet = _this getVariable ["X39_MedSys_var_Bleeding_hasTourniquet", false];
_bloodLoosePerTick = _this getVariable ["X39_MedSys_var_Bleeding_BloodLoosePerTick", 0];
_blood = _this getVariable "X39_MedSys_var_Bleeding_blood";

if(_isBleeding && !_hasTourniquet) then
{
	if(_blood <= 0) then
	{
		_this call X39_MedSys_fnc_killUnit;
	};
	if(_blood <= X39_MedSys_var_Bleeding_KnockOutBloodLimit && X39_MedSys_var_Bleeding_KnockOutBloodLimit != -1) then
	{
		[_this, true, X39_MedSys_var_Display_TimeBeforeRespawnAvailable_NormalKnockout, false] call X39_MedSys_fnc_knockOutUnit;
	};
	if(X39_MedSys_var_Bleeding_BloodLossPerTickModificator != 0) then
	{
		_this setVariable ["X39_MedSys_var_Bleeding_blood", _blood - (_bloodLoosePerTick * X39_MedSys_var_Bleeding_BloodLossPerTickModificator), true];
	};
};