#define BANDAGE "BANDAGE"
#define BLOOD "BLOOD"
#define DEFIBRILLATE "DEFIBRILLATE"
#define EPINEPHRINE "EPINEPHRINE"
#define MORPHINE "MORPHINE"
#define MEDKIT "MEDKIT"
#define TOURNIQUET "TOURNIQUET"

#define ISSTRING(X) (typeName X == "STRING" || typeName X == "TEXT")
#define ISOBJECT(X) (typeName X == "OBJECT")
#define ISBOOL(X) (typeName X == "BOOL")

#define assignVariable(X,Y) if(isNil {X})then{X = Y;};
#define assignVariable_STR(X,Y) if(X39_MedSys_var_varNames find X == -1) then {X39_MedSys_var_varNames set [count X39_MedSys_var_varNames, X];}; if(isNil X)then{missionNamespace setVariable [X, Y];};
#define forceLocal(UNIT) if(!local UNIT) exitWith {[_this, _fnc_scriptName, UNIT, false] call BIS_fnc_MP};


#define BEHAVIOUR_FULL 0
#define BEHAVIOUR_LIMITED 1
#define BEHAVIOUR_SERVICE 2

#define ALLOWED_NO -1
#define ALLOWED_FULL 0
#define ALLOWED_OVERRIDE 1
#define ALLOWED_LIMITED 2

//#define DEBUG

#ifndef DEBUG
	#define DEBUG_LOG(X) 
	#define DEBUG_LOG_WFn(X) 
	#define DEBUG_CODE(X) 
	#define DEBUG_CODE_NS(X) 
	#define KOMMA 
	#define COMMA 
	#define DUMP_UNIT(UNIT)
#else
	#define DEBUG_LOG(X) diag_log (X);
	#define DEBUG_LOG_WFn(X) diag_log format["%1 - %2: %3", time, _fnc_scriptName, X];
	#define DEBUG_CODE(X) X;
	#define DEBUG_CODE_NS(X) X
	#define KOMMA ,
	#define COMMA ,
	#define DUMP_UNIT(UNIT) diag_log format["%1 dumping unit '%2': X39_MedSys_var_Legs_Damage = '%3', X39_MedSys_var_Head_Damage = '%4', X39_MedSys_var_UnitDamage = '%5', X39_MedSys_var_Alive = '%6', X39_MedSys_var_DeathThreadRunning = '%7', X39_MedSys_var_UnitKnockedOut = '%8', X39_MedSys_var_LifeTime_TimeStamp = '%9', X39_MedSys_var_LifeTime_stop = '%10', X39_MedSys_var_Bleeding_BloodLoosePerTick = '%11', X39_MedSys_var_Bleeding_isBleeding = '%12', X39_MedSys_var_Bleeding_blood = '%13', X39_MedSys_var_Bleeding_hasTourniquet = '%14', X39_MedSys_var_Pain = '%15', X39_MedSys_var_loc_DragCarry_OtherUnit = '%16', X39_MedSys_var_loc_DragCarry_Action = '%17', X39_MedSys_var_loc_doCpr_inProgress = '%18', X39_MedSys_var_loc_doCpr_action = '%19', X39_MedSys_var_KnockOut_CheckInProgress = '%20', X39_MedSys_var_KnockOut_lastTempKnockOut = '%21'", time, UNIT, UNIT getVariable "X39_MedSys_var_Legs_Damage", UNIT getVariable "X39_MedSys_var_Head_Damage", UNIT getVariable "X39_MedSys_var_UnitDamage", UNIT getVariable "X39_MedSys_var_Alive", UNIT getVariable "X39_MedSys_var_DeathThreadRunning", UNIT getVariable "X39_MedSys_var_UnitKnockedOut", UNIT getVariable "X39_MedSys_var_LifeTime_TimeStamp", UNIT getVariable "X39_MedSys_var_LifeTime_stop", UNIT getVariable "X39_MedSys_var_Bleeding_BloodLoosePerTick", UNIT getVariable "X39_MedSys_var_Bleeding_isBleeding", UNIT getVariable "X39_MedSys_var_Bleeding_blood", UNIT getVariable "X39_MedSys_var_Bleeding_hasTourniquet", UNIT getVariable "X39_MedSys_var_Pain", UNIT getVariable "X39_MedSys_var_loc_DragCarry_OtherUnit", UNIT getVariable "X39_MedSys_var_loc_DragCarry_Action", UNIT getVariable "X39_MedSys_var_loc_doCpr_inProgress", UNIT getVariable "X39_MedSys_var_loc_doCpr_action", UNIT getVariable "X39_MedSys_var_KnockOut_CheckInProgress", UNIT getVariable "X39_MedSys_var_KnockOut_lastTempKnockOut"];
#endif
#ifndef PREVENTCALLOUTPUT
DEBUG_CODE(if(isNil "_fnc_scriptName") then { _fnc_scriptName = "nil"; })
DEBUG_LOG(format["%3: %1 call %2" COMMA _this COMMA _fnc_scriptName COMMA time])
#endif
#ifndef USERETURN
	#define returnToEnd
	#define return
#else
	#define returnToEnd breakTo format["localScope_%1", _fnc_scriptName];
	#define return breakOut format["localScope_%1", _fnc_scriptName];
	scopeName format["localScope_%1", _fnc_scriptName];
#endif