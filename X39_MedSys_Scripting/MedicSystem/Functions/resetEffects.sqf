#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	resets all effects of XMedSys to default
 *
 *	@ParamsCount - 0
 *	@Return - NA
 *	@Author - X39|Cpt. HM Murdock
 */

if(X39_MedSys_var_ppEffects_ColorCorrections == -1) then
{
	diag_log "'X39_MedSys_var_ppEffects_ColorCorrections' never got a valid effect object";
}
else
{
	X39_MedSys_var_ppEffects_ColorCorrections ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
	X39_MedSys_var_ppEffects_ColorCorrections ppEffectCommit X39_MedSys_var_TickRate;
};

if(X39_MedSys_var_ppEffects_Blur == -1) then
{
	diag_log "'X39_MedSys_var_ppEffects_Blur' never got a valid effect object";
}
else
{
	X39_MedSys_var_ppEffects_Blur ppEffectAdjust [0];
	X39_MedSys_var_ppEffects_Blur ppEffectCommit X39_MedSys_var_TickRate;
};

if(X39_MedSys_var_ppEffects_ColorInversion == -1) then
{
	diag_log "'X39_MedSys_var_ppEffects_ColorInversion' never got a valid effect object";
}
else
{
	X39_MedSys_var_ppEffects_ColorInversion ppEffectAdjust [0, 0, 0];
	X39_MedSys_var_ppEffects_ColorInversion ppEffectCommit X39_MedSys_var_TickRate;
};

if(X39_MedSys_var_ppEffects_ChromAberration == -1) then
{
	diag_log "'X39_MedSys_var_ppEffects_ChromAberration' never got a valid effect object";
}
else
{
	X39_MedSys_var_ppEffects_ChromAberration ppEffectAdjust [0, 0, true];
	X39_MedSys_var_ppEffects_ChromAberration ppEffectCommit X39_MedSys_var_TickRate;
};