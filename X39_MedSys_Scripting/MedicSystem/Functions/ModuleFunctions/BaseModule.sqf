#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
diag_log "XMedSys BaseModule is placed, Initializing player unit ...";
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
X39_MedSys_var_Display_Overlay_EnableHealthView =		(_logic getVariable ["DialogOptions_EnableHealthView", 1])		call X39_MedSys_fnc_intToBoolean;
X39_MedSys_var_Display_Overlay_EnableBoodView =			(_logic getVariable ["DialogOptions_EnableBloodView", 1])		call X39_MedSys_fnc_intToBoolean;
X39_MedSys_var_Display_Overlay_EnableLegView =			(_logic getVariable ["DialogOptions_EnableLegView", 1])			call X39_MedSys_fnc_intToBoolean;
X39_MedSys_var_Display_Overlay_EnableTourniquetView =	(_logic getVariable ["DialogOptions_EnableTourniquetView", 1])	call X39_MedSys_fnc_intToBoolean;
X39_MedSys_var_Display_Overlay_EnableMorphineView =		(_logic getVariable ["DialogOptions_EnableMorphineView", 1])	call X39_MedSys_fnc_intToBoolean;

[] call X39_MedSys_fnc_initMod;