#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Outputs a message to the player (use this at any output from the mod!)
 *
 *	@ParamsCount - 1
 *	@Param1 - String - Message to output
 *	@Return - Boolean - True if message was send, false if not
 *	@Author - X39|Cpt. HM Murdock
 */

_msg = _this;
if(typeName _msg == "ARRAY") then
{
	_msg = _this select 0;
};
if(typeName _msg != "TEXT" && typeName _msg != "STRING") exitWith {
	diag_log format["'%1' is not a valid string for output", _this];
	false
};
if(X39_MedSys_var_IOMsg_AsHint) then
{
	hint _msg;
};
if(X39_MedSys_var_IOMsg_AsSystemChat) then
{
	systemChat _msg;
};