#define PREVENTCALLOUTPUT
#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *
 *	@ParamsCount - 1
 *	@Param1 - Code	- Handler
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
private["_handler", "_tickRate"];
_handler = [_this, 0, "", [{}, "", text ""]] call BIS_fnc_param;
_tickRate = [_this, 1, 1, [1]] call BIS_fnc_param;
if(typeName _handler == "STRING" || typeName _handler == "TEXT") then
{
	if(_handler == "") exitWith { diag_log format["handler '%1' cannot be registered for new ticks!", _handler];};
	
	_handler = compile _handler;
};
if(_tickRate >= X39_MedSys_var_TickRateMaxTicks) exitWith { diag_log "wanted tickRate is to high!"; };
if(_tickRate <= 0) exitWith { diag_log "wanted tickRate needs to be larger then 0!"; };
X39_MedSys_var_TickHandlers set[count X39_MedSys_var_TickHandlers, [_handler, _tickRate]];