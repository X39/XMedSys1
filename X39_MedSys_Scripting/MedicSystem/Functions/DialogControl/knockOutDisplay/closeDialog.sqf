#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Creates the KnockedOut GUI
 *
 *	@ParamsCount - 1
 *	@Return - int - Time berofre respawn is available (-1 if disabled)
 *	@Author - X39|Cpt. HM Murdock
 */
if(X39_MedSys_var_Display_BlackOut_Open) then
{
	X39_MedSys_var_Display_BlackOut_Open = false;
	//TFAR Related:
	//Is player can press tangent on radio [default value = false]:
	player setVariable ["tf_unable_to_use_radio", false];
	//Set voice volume level for player (not affect distance where voice is hearable) [default value - 1]:
	player setVariable ["tf_voiceVolume", player getVariable "X39_MedSys_var_tfar_voiceVolumeValueBefore"];
	closeDialog 30097;
};