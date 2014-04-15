#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Adds "HandleDamage" eventHandler to unit with the correct code
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (Unit) - N/A
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_this addEventHandler["HandleDamage", 
{
	DEBUG_LOG("HandleDamageEH")
	DEBUG_LOG(str _this)
	_unit = 			_this select 0;
	_sectionHit = 		_this select 1;
	_damageDealt = 		(_this select 2) * X39_MedSys_var_DamageMultiplicator;
	_UnitDealtDamage = 	_this select 3;
	//_AmmoUsed = 		_this select 4;
	_unit setVariable["X39_MedSys_var_LastHitter", _UnitDealtDamage, false];
	if(_sectionHit == "") then{
		[_unit, _damageDealt] call X39_MedSys_fnc_handleDamage;
	}
	else
	{
		[_unit, _damageDealt] spawn X39_MedSys_fnc_handleDamageGeneral;
		if(_sectionHit == "head" || {_sectionHit == "head_hit"}) then{
			[_unit, _damageDealt] call X39_MedSys_fnc_handleHead;
		}
		else
		{
			if(_sectionHit == "body") then{
				[_unit, _damageDealt] call X39_MedSys_fnc_handleBody;
			}
			else
			{
				if(_sectionHit == "hands" || {_sectionHit == "hand_l" || {_sectionHit == "hand_r"}}) then{
					[_unit, _damageDealt] call X39_MedSys_fnc_handleHand;
				}
				else
				{
					if(_sectionHit == "legs" || {_sectionHit == "leg_l" || {_sectionHit == "leg_r"}}) then{
						[_unit, _damageDealt] call X39_MedSys_fnc_handleLeg;
					};
				};
			};
		};
	};
	_res = 0;
	if((_unit call X39_MedSys_fnc_getPlayerBleeding) select 0) then
	{
		_res = 0.5;
	};
	_res
}];