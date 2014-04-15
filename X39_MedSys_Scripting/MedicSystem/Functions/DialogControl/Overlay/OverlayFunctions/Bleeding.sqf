#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
#include "header.hpp"
/**
 *	GUI control function!
 *	DONT use if youre not sure what you are doing!
 *
 *	@ParamsCount - 1
 *	@Param1 - int (controlToUse) - N/A
 *	@Return - modified input
 *	@Author - X39|Cpt. HM Murdock
 */
_getBleedingResult = player call X39_MedSys_fnc_getPlayerBleeding;
_isBleeding = _getBleedingResult select 0;
_bloodPercent = _getBleedingResult select 2;

_bloodPercent = 1 / (X39_MedSys_var_Bleeding_StartingBlood / _bloodPercent);
if(_bloodPercent <= X39_MedSys_var_Settings_Overlay_Blood_PictureValues select 4) then
{
	displayControl _this ctrlSetText BLOODDROP_5;
}
else
{
	if(_bloodPercent <= X39_MedSys_var_Settings_Overlay_Blood_PictureValues select 3) then
	{
		displayControl _this ctrlSetText BLOODDROP_4;
	}
	else
	{
		if(_bloodPercent <= X39_MedSys_var_Settings_Overlay_Blood_PictureValues select 2) then
		{
			displayControl _this ctrlSetText BLOODDROP_3;
		}
		else
		{
			if(_bloodPercent <= X39_MedSys_var_Settings_Overlay_Blood_PictureValues select 1) then
			{
				displayControl _this ctrlSetText BLOODDROP_2;
			}
			else
			{
				displayControl _this ctrlSetText BLOODDROP_1;
			};
		};
	};
};
if(_isBleeding) then
{
	displayControl _this ctrlSetTextColor[1, 0, 0, X39_MedSys_var_Settings_Overlay_Transparency];
}
else
{
	displayControl _this ctrlSetTextColor[0, 1, 0, X39_MedSys_var_Settings_Overlay_Transparency];
};