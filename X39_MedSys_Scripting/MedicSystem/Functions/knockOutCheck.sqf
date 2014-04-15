#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	calculate if unit needs to be knocked out
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (Unit) - N/A
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_res"];
if(!(_this getVariable ["X39_MedSys_var_KnockOut_CheckInProgress", false])) then
{
	_this setVariable["X39_MedSys_var_KnockOut_CheckInProgress", true, false];
	_res = _this spawn {
	private["_unit", "_damage"];
		sleep 0.25;
		DEBUG_CODE(_debugXVAL = random 2000)
		DEBUG_LOG("knockOutCheck start")
		DEBUG_LOG(_debugXVAL)
		_unit = _this;
		_damage = ([_unit, true] call X39_MedSys_fnc_getUnitDamage);
		DEBUG_LOG(_unit)
		DEBUG_LOG(_damage)
		if(_damage > X39_MedSys_var_Generic_DamageBeforeKnockOut) then
		{
			if(_damage > X39_MedSys_var_Generic_DamageBeforePermaKnockOut) then
			{
				if(_damage > X39_MedSys_var_Generic_DamageBeforeDead) then
				{
					if(X39_MedSys_var_KillUnitWhenMaxDamageReached && {_damage >= X39_MedSys_var_maxDamage}) then
					{
						DEBUG_LOG("Killing unit")
						_unit call X39_MedSys_fnc_killUnit;
						DEBUG_LOG(_debugXVAL)
						DEBUG_LOG("knockOutCheck end")
					}
					else
					{
						DEBUG_LOG("FakeKilling Unit")
						_res = [[_unit, true], "X39_MedSys_fnc_fakeKillUnit", _unit, false] spawn BIS_fnc_MP;
						_unit setVariable["X39_MedSys_var_KnockOut_CheckInProgress", false, false];
						DEBUG_LOG(_debugXVAL)
						DEBUG_LOG("knockOutCheck end")
					};
				}
				else
				{
					DEBUG_LOG("Perma KnockOut unit")
					[_unit, true, X39_MedSys_var_Display_TimeBeforeRespawnAvailable_NormalKnockout] call X39_MedSys_fnc_knockOutUnit;
					_unit setVariable["X39_MedSys_var_KnockOut_CheckInProgress", false, false];
					DEBUG_LOG(_debugXVAL)
					DEBUG_LOG("knockOutCheck end")
				};
			} else {
				DEBUG_LOG("Temp KnockOut unit")
				if(time - (_unit getVariable["X39_MedSys_var_KnockOut_lastTempKnockOut", 0]) > X39_MedSys_var_KnockOut_MinTimeBetweenTempKnockOuts) then
				{
					[_unit, _damage DEBUG_CODE_NS(KOMMA _debugXVAL)] spawn {
						_unit = _this select 0;
						_damage = _this select 1;
						
						_timeKnockedOut = 10 + (_damage - X39_MedSys_var_Generic_DamageBeforeKnockOut) * 20;
						[_unit, true] call X39_MedSys_fnc_knockOutUnit;
						sleep _timeKnockedOut;
						[_unit, false] call X39_MedSys_fnc_knockOutUnit;
						_unit setVariable["X39_MedSys_var_KnockOut_CheckInProgress", false, false];
						_unit setVariable["X39_MedSys_var_KnockOut_lastTempKnockOut", time, true];
						DEBUG_LOG(_this select 2)
						DEBUG_LOG("knockOutCheck end")
					};
				}
				else
				{
					DEBUG_LOG("TempKnockOut aborted! time - X39_MedSys_var_KnockOut_lastTempKnockOut > X39_MedSys_var_KnockOut_MinTimeBetweenTempKnockOuts")
					_unit setVariable["X39_MedSys_var_KnockOut_lastTempKnockOut", time];
					_unit setVariable["X39_MedSys_var_KnockOut_CheckInProgress", false, false];
					DEBUG_LOG(_debugXVAL)
					DEBUG_LOG("knockOutCheck end")
				};
			};
		}
		else
		{
			_unit setVariable["X39_MedSys_var_KnockOut_CheckInProgress", false, false];
			DEBUG_LOG(_debugXVAL)
			DEBUG_LOG("knockOutCheck end")
		};
	};
}DEBUG_CODE(else{diag_log "knockOutCheck already in progress!"});