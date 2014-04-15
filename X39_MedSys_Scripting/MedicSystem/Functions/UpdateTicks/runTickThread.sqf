#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
_res = _this spawn {
	private["_unit", "_ticks"];
	DEBUG_CODE(private["_randomID"];_randomID = random 20000)
	
	_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_ticks = 0;
	
	if(isNull _unit) exitWith { };
	while { alive _unit } do
	{
		{
			if(_ticks % (_x select 1) == 0) then
			{
				if(!alive _unit) exitWith { DEBUG_LOG(format["'%1' died while tickHandling was in progress" KOMMA _unit]); };
				_unit call (_x select 0);
			};
			false
		} count X39_MedSys_var_TickHandlers;
		_ticks = _ticks + 1;
		if(_ticks >= X39_MedSys_var_TickRateMaxTicks) then
		{
			_ticks = 0;
		};
		DEBUG_CODE(diag_log format["runTickThread %1: %2, %3" KOMMA _randomID KOMMA _unit KOMMA alive _unit])
		sleep X39_MedSys_var_TickRate;
	};
	
};