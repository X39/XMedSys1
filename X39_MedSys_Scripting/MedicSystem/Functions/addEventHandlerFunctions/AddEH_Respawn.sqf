#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Adds "Respawn" eventHandler to unit with the correct code
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (Unit) - N/A
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_this addEventHandler["Respawn", 
{
	_res = _this spawn{
		sleep 0.1;
		_unit = _this select 0;
		//_corpse = _this select 1;
		DEBUG_LOG(format["RespawnHandle at '%1', Arguments: %2" KOMMA time KOMMA _this])
		waitUntil{alive _unit};
		[_unit, false, true] call X39_MedSys_fnc_initializeUnit;
		waitUntil{sleep 0.000001; _unit getVariable ["X39_MedSys_var_UnitInitilized", false]};
		sleep 0.5;
		if(isPlayer _unit && local _unit) then
		{
			//call X39_MedSys_fnc_AddEH_KeyDown;
			call X39_MedSys_fnc_MedSysOverlayUnloadOverlay;
			call X39_MedSys_fnc_MedSysOverlayCreateDisplay;
		};
		[_unit] call X39_MedSys_fnc_runTickThread;
		if(captive _unit) then
		{
			diag_log "stupid ArmA bug with captive units again happened. Please report because i dont wanted to report another bug ... thx X39";
		};
		_unit setCaptive false;
		call X39_MedSys_fnc_closeBlackOutDisplay;
		X39_XLib_var_ActionDialog_preventMenuOpening = false;
	}
}];