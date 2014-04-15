#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	"kills" a unit in a way that alive returns true but the unit is for AI dead (and seems like dead also)
 *	revive is also done with this function (to keep it small)
 *
 *	@ParamsCount - 2
 *	@Param1 - Object (UNIT)	- Unit to apply
 *	@Param2 - Boolean		- false if kill, true if revive
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_unit"];
DEBUG_LOG(format["%1 call X39_MedSys_fnc_fakeKillUnit"])
_unit = _this select 0;
if(!local _unit) exitWith {[_this, "X39_MedSys_fnc_fakeKillUnit", _unit, false] spawn BIS_fnc_MP};
if(_this select 1) then
{
	DEBUG_LOG(format["%1 has been set as dead", _unit])
	_unit setVariable["X39_MedSys_var_Alive", false, true];
	[_unit, true, X39_MedSys_var_Display_TimeBeforeRespawnAvailable_Death, true] call X39_MedSys_fnc_knockOutUnit;
	waituntil{sleep 0.000001; _unit call X39_MedSys_fnc_isUnitKnockedOut};
	if!(_unit getVariable["X39_MedSys_var_DeathThreadRunning", false]) then
	{
		_res = _unit spawn {
			private["_time", "_timestamp", "_wasStopped"];
			_this setVariable["X39_MedSys_var_DeathThreadRunning", true, true];
			_timestamp = _this getVariable ["X39_MedSys_var_LifeTime_TimeStamp", -1];
			if(_timestamp == -1) then
			{
				_timestamp = time;
				_this setVariable["X39_MedSys_var_LifeTime_TimeStamp", _timestamp, true];
			};
			_wasStopped = -1;
			while {!(_this getVariable["X39_MedSys_var_Alive", false]) && alive _this} do
			{
				scopeName "out";
				_time = time - _timestamp;
				if(isPlayer _this) then
				{
					ctrlSetText [1000, "Time left:"];
					if(_wasStopped != -1) then
					{
						DEBUG_LOG(format["%1s DEATH TIMER IS STOPPED!" KOMMA _this]);
						ctrlSetText [1001, "SAFE"];
					}
					else
					{
						ctrlSetText [1001, format["%1s", X39_MedSys_var_LifeTime - _time]];
					};
				};
				if(_this getVariable["X39_MedSys_var_LifeTime_stop", false]) then
				{
					if(_wasStopped == -1) then
					{
						DEBUG_LOG(format["X39_MedSys_fnc_fakeKillUnit: setting _wasStopped to %1" KOMMA _time])
						_wasStopped = _time;
					};
				}
				else
				{
					if(_wasStopped != -1) then
					{
						_timestamp = time - _wasStopped;
						DEBUG_LOG(format["X39_MedSys_fnc_fakeKillUnit: setting ""X39_MedSys_var_LifeTime_TimeStamp"" to %1 ( %2 - %3 )" KOMMA _timestamp KOMMA time KOMMA _wasStopped])
						_this setVariable["X39_MedSys_var_LifeTime_TimeStamp", _timestamp, true];
						_wasStopped = -1;
					};
					if(_time >= X39_MedSys_var_LifeTime) then
					{
						_this call X39_MedSys_fnc_killUnit;
						breakOut "out";
					};
				};
				sleep 1;
			};
			_this setVariable["X39_MedSys_var_DeathThreadRunning", false, true];
		};
	};
	if(X39_MedSys_var_UsingEventSystem) then {
		["Killed", [_unit], false, "XMedSys", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
	};
}
else
{
	DEBUG_LOG(format["%1 has been set as alive", _unit])
	_unit setVariable["X39_MedSys_var_Alive", true, true];
	_unit setVariable["X39_MedSys_var_LifeTime_stop", false, true];
	_unit setVariable["X39_MedSys_var_LifeTime_TimeStamp", -1, true];
	[_unit, false] call X39_MedSys_fnc_knockOutUnit;
	if(X39_MedSys_var_UsingEventSystem) then {
		["Revived", [_unit], false, "XMedSys", missionNamespace] call X39_XLib_EH_fnc_triggerEvent;
	};
};