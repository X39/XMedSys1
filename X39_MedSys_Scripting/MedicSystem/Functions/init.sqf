#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
{
	if(_x == "FirstAidKit" || {_x == "Medikit" || {_x isKindOf "FirstAidKit" || {_x isKindOf "Medikit"}}}) then
	{
		_unit removeItem _x;
	};
	false
}count (items _unit);
if(!(_unit getVariable["X39_MedSys_var_UnitInitilized", false]) || _forceInit) then
{
	DEBUG_LOG(format["Init some unit: _this = %1, _forceInit = %2, _addEventHandlers = %3" KOMMA _this KOMMA _forceInit KOMMA _addEventHandlers])
	DEBUG_LOG("Dumping unit before init")
	DUMP_UNIT(_unit)
	_unit setVariable["X39_MedSys_var_Legs_Damage", 0, true];
	_unit setVariable["X39_MedSys_var_Head_Damage", 0, true];
	_unit setVariable["X39_MedSys_var_UnitDamage", 0, true];
	_unit setVariable["X39_MedSys_var_Alive", true, true];
	_unit setVariable["X39_MedSys_var_DeathThreadRunning", false, true];
	
	_unit setVariable["X39_MedSys_var_UnitKnockedOut", false, true];
	_unit setVariable["X39_MedSys_var_LifeTime_TimeStamp", -1, true];
	_unit setVariable["X39_MedSys_var_LifeTime_stop", false, true];
	_unit setVariable["X39_MedSys_var_Bleeding_BloodLoosePerTick", 0, true];
	_unit setVariable["X39_MedSys_var_Bleeding_isBleeding", false, true];
	_unit setVariable["X39_MedSys_var_Bleeding_blood", X39_MedSys_var_Bleeding_StartingBlood, true];
	_unit setVariable["X39_MedSys_var_Bleeding_hasTourniquet", false, true]; //player setVariable["X39_MedSys_var_Bleeding_hasTourniquet", true, true]; X39_MedSys_var_Bleeding_Tourniquet_DamagePerTick = 0.25
	_unit setVariable["X39_MedSys_var_Pain", 0, true];
	_unit setVariable["X39_MedSys_var_Hearing", 0, true];
	_unit setVariable["X39_MedSys_var_hasEarplugs", false, true];
	if(!isNil "AGM_Interaction_fnc_addInteraction") then
	{
		_unit setVariable["X39_MedSys_var_hasEarplugs", false, true];
	};
	
	
	//local variables
	_unit setVariable["X39_MedSys_var_loc_DragCarry_OtherUnit", objNull, false];
	_unit setVariable["X39_MedSys_var_loc_DragCarry_Action", -1, false];
	_unit setVariable["X39_MedSys_var_loc_doCpr_inProgress", objNull, false];
	_unit setVariable["X39_MedSys_var_LastHitter", objNull, false];
	_unit setVariable["X39_MedSys_var_loc_doCpr_action", -1, false];
	_unit setVariable["X39_MedSys_var_KnockOut_CheckInProgress", false, false];
	_unit setVariable["X39_MedSys_var_KnockOut_lastTempKnockOut", 0, false];
	
	//Function calling	
	[_unit] call X39_MedSys_fnc_runTickThread;
	if(isPlayer _unit) then
	{
		_unit call X39_MedSys_fnc_runCamShakeThread;
	};
	if(_addEventHandlers) then
	{
		_unit call X39_MedSys_fnc_AddEH_Respawn;
		_unit call X39_MedSys_fnc_AddEH_AnimChanged;
		_unit call X39_MedSys_fnc_AddEH_HandleDamage;
		_unit call X39_MedSys_fnc_AddEH_FiredNear;
		_unit call X39_MedSys_fnc_AddEH_Explosion;
	};
	_unit setVariable["X39_MedSys_var_UnitInitilized", true, true];
	DEBUG_LOG("Dumping unit after init")
	DUMP_UNIT(_unit)
}DEBUG_CODE(else { diag_log format["unit '%1' is already initialized" COMMA _unit];});