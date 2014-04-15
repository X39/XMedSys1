#define DUMP_XMEDSYS_UNIT(UNIT) diag_log format["%1 dumping unit '%2': X39_MedSys_var_Legs_Damage = '%3', X39_MedSys_var_Head_Damage = '%4', X39_MedSys_var_UnitDamage = '%5', X39_MedSys_var_Alive = '%6', X39_MedSys_var_DeathThreadRunning = '%7', X39_MedSys_var_UnitKnockedOut = '%8', X39_MedSys_var_LifeTime_TimeStamp = '%9', X39_MedSys_var_LifeTime_stop = '%10', X39_MedSys_var_Bleeding_BloodLoosePerTick = '%11', X39_MedSys_var_Bleeding_isBleeding = '%12', X39_MedSys_var_Bleeding_blood = '%13', X39_MedSys_var_Bleeding_hasTourniquet = '%14', X39_MedSys_var_Pain = '%15', X39_MedSys_var_loc_DragCarry_OtherUnit = '%16', X39_MedSys_var_loc_DragCarry_Action = '%17', X39_MedSys_var_loc_doCpr_inProgress = '%18', X39_MedSys_var_loc_doCpr_action = '%19', X39_MedSys_var_KnockOut_CheckInProgress = '%20', X39_MedSys_var_KnockOut_lastTempKnockOut = '%21'", time, UNIT, UNIT getVariable "X39_MedSys_var_Legs_Damage", UNIT getVariable "X39_MedSys_var_Head_Damage", UNIT getVariable "X39_MedSys_var_UnitDamage", UNIT getVariable "X39_MedSys_var_Alive", UNIT getVariable "X39_MedSys_var_DeathThreadRunning", UNIT getVariable "X39_MedSys_var_UnitKnockedOut", UNIT getVariable "X39_MedSys_var_LifeTime_TimeStamp", UNIT getVariable "X39_MedSys_var_LifeTime_stop", UNIT getVariable "X39_MedSys_var_Bleeding_BloodLoosePerTick", UNIT getVariable "X39_MedSys_var_Bleeding_isBleeding", UNIT getVariable "X39_MedSys_var_Bleeding_blood", UNIT getVariable "X39_MedSys_var_Bleeding_hasTourniquet", UNIT getVariable "X39_MedSys_var_Pain", UNIT getVariable "X39_MedSys_var_loc_DragCarry_OtherUnit", UNIT getVariable "X39_MedSys_var_loc_DragCarry_Action", UNIT getVariable "X39_MedSys_var_loc_doCpr_inProgress", UNIT getVariable "X39_MedSys_var_loc_doCpr_action", UNIT getVariable "X39_MedSys_var_KnockOut_CheckInProgress", UNIT getVariable "X39_MedSys_var_KnockOut_lastTempKnockOut"];
#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"

if(isDedicated) exitWith {};
waitUntil{!isNull player};
waitUntil{alive player};

diag_log "DUMP before handling";
DUMP_XMEDSYS_UNIT(player)

_res = [] spawn X39_MedSys_fnc_AddEH_KeyDown;
_res = player spawn X39_MedSys_fnc_initializePlayer;
[] call X39_MedSys_fnc_MedSysOverlayCreateDisplay;

diag_log "DUMP after handling";
DUMP_XMEDSYS_UNIT(player)