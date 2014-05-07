/**
* Drop carried unit if exits and clear menu.
*/
if !(isNull (player getVariable["X39_MedSys_var_DragCarry_OtherUnit", objNull])) then {
	player playMove "AidlPknlMstpSrasWrflDnon_AI";
	detach (player getVariable "X39_MedSys_var_DragCarry_OtherUnit" );
	player removeAction (player getVariable["X39_MedSys_var_DragCarry_Action", -1]);
	player setVariable["X39_MedSys_var_DragCarry_Action", -1, false];
	player setVariable["X39_MedSys_var_DragCarry_OtherUnit", objNull, false];
};