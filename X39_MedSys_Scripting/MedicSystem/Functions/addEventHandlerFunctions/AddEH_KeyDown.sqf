#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Adds "KeyDown" eventHandler to game
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
 
waituntil {!isNull (findDisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown", "(_this call X39_MedSys_fnc_handleKeyPress)"];  