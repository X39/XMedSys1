#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Starts the CamShakeThread for a unit
 *	!Internal function!
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (Unit) - N/A
 *	@Return - N/A
 *	@Author - Tinter, X39|Cpt. HM Murdock
 */
if(!isPlayer _this) exitWith {DEBUG_LOG_WFn("given unit is not local")};
if(!local _this) exitWith{ [_this, "X39_MedSys_fnc_runCamShakeThread", _this, false] call BIS_fnc_MP; };
_res = [_this] spawn {
	private["_unit", "_unitDamage"];
	_unit = _this select 0;
	_unitDamage = _unit call X39_MedSys_fnc_getUnitDamage;
	while {alive _unit} do {
		if(((profileNamespace getVariable ["X39_MedSys_var_Settings_EnableCamShake", X39_MedSys_var_Settings_EnableCamShake]) call X39_MedSys_fnc_IntToBoolean) || X39_MedSys_var_Force_CamShake) then
		{
			if(_unitDamage > X39_MedSys_var_Generic_DamageBeforePermaKnockOut) then
			{
				_unit setFatigue 1;
				addCamShake [2,20,3];
				sleep 10;
			}
			else
			{
				if(_unitDamage > X39_MedSys_var_Generic_DamageBeforeKnockOut) then
				{
					_unit setFatigue 0.8; 
					addCamShake [1,20,3];
					sleep 10;
				}
				else
				{
					if(_unitDamage > (X39_MedSys_var_Generic_DamageBeforeKnockOut * 0.6)) then
					{
						_unit setFatigue 0.5; 
						addCamShake [1,20,2];
						sleep 10;
					}
					else
					{
						if(_unitDamage > X39_MedSys_var_Generic_DamageBeforeKnockOut * 0.1) then
						{
							_unit setFatigue 0.3; 
							addCamShake [1,20,1];
							sleep 10;
						}
						else
						{
							sleep 10;
						};
					};
				};
			};
			_unitDamage = _unit call X39_MedSys_fnc_getUnitDamage;
		}
		else
		{
			sleep 60;
		};
	};
};