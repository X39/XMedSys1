#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	knockOut a unit with propper effects etc.
 *
 *	@ParamsCount - 4
 *	@Param1 - Object (Unit) - N/A
 *	@Param2 - Boolean - if true unit will be knocked out else unit will get awake again
 *	@Param3 - Integer - Time before respawn button is clickable
 *	@Param4 - Boolean - is unit dead or unconscious  (decides which animation to use)
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit", "_flag", "_time", "_isDead", "_res", "_isUnitPlayer", "_otherUnit", "_actionToUse"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_flag = [_this, 1, true, [false]] call BIS_fnc_param;
_time = [_this, 2, -1, [0]] call BIS_fnc_param;
_isDead = [_this, 3, false, [false]] call BIS_fnc_param;
if!(local _unit) then
{
	_res = [_this, "X39_MedSys_fnc_knockOutUnit", _unit, false] spawn BIS_fnc_MP; 
}
else
{
	_isUnitPlayer = (_unit == player);
	if(_flag) then
	{
		_unit setVariable["X39_MedSys_var_LifeTime_TimeStamp", time, true];
		_otherUnit = _unit getVariable["X39_MedSys_var_loc_DragCarry_OtherUnit", objNull];
		if(!isNull _otherUnit) then
		{
			detach _otherUnit;
			_otherUnit playMoveNow "AinjPpneMstpSnonWrflDb_release";
			if(isPlayer _unit) then
			{
				_unit removeAction (_unit getVariable["X39_MedSys_var_loc_DragCarry_Action", -1]);
			};
			_unit setVariable["X39_MedSys_var_loc_DragCarry_OtherUnit", objNull, false];
			_unit setVariable["X39_MedSys_var_loc_DragCarry_Action", -1, false];
		};
		_otherUnit = _unit getVariable["X39_MedSys_var_loc_doCpr_inProgress", objNull];
		if(!isNull _otherUnit) then
		{
			X39_XLib_var_ActionDialog_preventMenuOpening = false;
			_otherUnit setVariable["X39_MedSys_var_LifeTime_stop", false, true];
			_unit playAction "medicStop";
			if(isPlayer _unit) then
			{
				_unit removeAction (_this select 2);
			};
			_unit setVariable["X39_MedSys_var_loc_doCpr_action", -1, false];
			_unit setVariable["X39_MedSys_var_loc_doCpr_inProgress", objNull, false];
		};
		if(_unit getVariable "X39_MedSys_var_UnitKnockedOut") exitWith {};
		_actionToUse = "";
		if(_isDead) then
		{
			_actionToUse = "die";
		}
		else
		{
			_actionToUse = "unconscious";
		};
		DEBUG_LOG(_unit)
		DEBUG_LOG("knocking out unit")
		//if(_isUnitPlayer) then
		//{
		//	true call X39_MedSys_fnc_FadeToBlack;
		//};
		//_unit allowDamage false;
		_unit setCaptive true;
		if(_unit == vehicle _unit) then
		{
			_unit playActionNow _actionToUse;
		};
		_unit setVariable["X39_MedSys_var_UnitKnockedOut", true, true];
		if(_isUnitPlayer) then
		{
			_time call X39_MedSys_fnc_createBlackOutDisplay;
			//ctrlSetText [1000, "You are"];
			//ctrlSetText [1001, "Knocked out"];
		};
		if(vehicle _unit == _unit) then
		{
			_unit setVelocity [0,0,0.1];
			_unit setDir (direction _unit);
			//_unit setPosASL [(getPosASL _unit) select 0, (getPosASL _unit) select 1, ((getPosASL _unit) select 2) + 0.1];
		}
	} else {
		DEBUG_LOG("unknocking out unit")
		//if(_isUnitPlayer) then
		//{
		//	false call X39_MedSys_fnc_FadeToBlack;
		//};
		if(vehicle _unit == _unit) then
		{
			_unit switchAction "down";
			_unit switchAction "down";
		};
		_unit setVariable["X39_MedSys_var_UnitKnockedOut", false, true];
		if(_isUnitPlayer) then
		{
			call X39_MedSys_fnc_closeBlackOutDisplay;
		};
		//_unit allowDamage true;
		_unit setCaptive false;
		_unit setVariable["X39_MedSys_var_LifeTime_TimeStamp", -1, true];
	};
};