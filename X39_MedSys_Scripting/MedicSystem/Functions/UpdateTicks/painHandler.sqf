#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *
 *	@ParamsCount - 1
 *	@Param1 - Object (UNIT)	- Unit to watch
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(!isPlayer _this) exitWith { };
if(!X39_MedSys_var_Pain_Allow) exitWith { };
private["_painOrig", "_painWork", "_brightness", "_contrast", "_offset", "_blendColor", "_colorizeColorSub", "_colorizeColorAdd", "_red", "_green", "_blue", "_dissortA", "_dissortB", "_flag"];
_painOrig = _this getVariable "X39_MedSys_var_Pain";
_painWork = _painOrig / X39_MedSys_var_Pain_minPainToMaxPain;
if(_painWork > 1) then
{
	_painWork = 1;
};
if(_painWork < 0) then
{
	_painWork = _painWork * -1;
};
if(_painOrig < 0) then
{
	_painOrig = _painOrig + X39_MedSys_var_Pain_MorphineEffectReducedPerTick;
	if(_painOrig > 0) then
	{
		_painOrig = 0;
	};
}
else
{
	_painOrig = _painOrig - X39_MedSys_var_Pain_ReductionPerTick;
	if(_painOrig < 0) then
	{
		_painOrig = 0;
	};
};
if(_painOrig > 0) then
{
	_this setFatigue _painWork; 
};
if(X39_MedSys_var_Pain_ColorCorrections) then
{
	if(X39_MedSys_var_ppEffects_ColorCorrections == -1) exitWith
	{
		diag_log "'X39_MedSys_var_ppEffects_ColorCorrections' never got a valid effect object";
	};
	/*
	_brightness		float	[0,1]
	_contrast		float	
	_offset			float	
	_blend color	(R,G,B,A)	 float	
	_colorize color (R,G,B,A)	 float	
	_colorize color (R,G,B,A)	 float	
	*/
	_brightness			= 1;
	_contrast			= 1;
	_offset				= 0;
	_blendColor			= [0, 0, 0, 0];
	_colorizeColorSub	= [0, 0, 0, 1];
	_colorizeColorAdd	= [0, 0, 0, 1];
	
	if(_painOrig > 0) then
	{
		if(X39_MedSys_var_Pain_RedScreen) then
		{
			_blendColor set[0, _painWork];
			_blendColor set[3, _painWork * 0.5];
		};
		if(X39_MedSys_var_Pain_GreyScreen) then
		{
			_colorizeColorSub = [
									_painWork * X39_MedSys_var_Pain_GreyScreenManipulator,
									_painWork * X39_MedSys_var_Pain_GreyScreenManipulator,
									_painWork * X39_MedSys_var_Pain_GreyScreenManipulator,
									1
								];
		};
	};
	
	
	
	X39_MedSys_var_ppEffects_ColorCorrections ppEffectAdjust [
							_brightness,
							_contrast,
							_offset,
							_blendColor,
							_colorizeColorSub,
							_colorizeColorAdd
						];
	X39_MedSys_var_ppEffects_ColorCorrections ppEffectCommit X39_MedSys_var_TickRate;
};
if(X39_MedSys_var_Pain_Blur) then
{
	if(X39_MedSys_var_ppEffects_Blur == -1) exitWith
	{
		diag_log "'X39_MedSys_var_ppEffects_Blur' never got a valid effect object";
	};
	_flag = true;
	if(!X39_MedSys_var_Pain_AllowMorphineOverdoseEffect && _painOrig < 0) then
	{
		_flag = false;
	};
	if(_flag) then
	{
		X39_MedSys_var_ppEffects_Blur ppEffectAdjust [_painWork * X39_MedSys_var_Pain_MaxBlur];
		X39_MedSys_var_ppEffects_Blur ppEffectCommit X39_MedSys_var_TickRate;
	};
};
if(X39_MedSys_var_Pain_AllowMorphineOverdoseEffect) then
{
	if(X39_MedSys_var_ppEffects_ColorInversion == -1) exitWith
	{
		diag_log "'X39_MedSys_var_ppEffects_ColorInversion' never got a valid effect object";
	};
	if(X39_MedSys_var_ppEffects_ChromAberration == -1) exitWith
	{
		diag_log "'X39_MedSys_var_ppEffects_ChromAberration' never got a valid effect object";
	};
	_red	= 0;
	_green	= 0;
	_blue	= 0;
	_dissortA = 0;
	_dissortB = 0;
	if(_painOrig < 0) then
	{
		if(X39_MedSys_var_pain_ColorInversion) then
		{
			_red	= 0.2 * (X39_MedSys_var_Pain_HealthOverchargeEffectManipulator * _painWork);
			_green	= 0.9 * (X39_MedSys_var_Pain_HealthOverchargeEffectManipulator * _painWork);
			_blue	= 0.5 * (X39_MedSys_var_Pain_HealthOverchargeEffectManipulator * _painWork);
		};
		if(X39_MedSys_var_pain_ChromAberration) then
		{
			_dissortA = 0.5 * (0.1 * _painWork);
			_dissortB = 3 * (0.1 * _painWork);
		};
	};
	X39_MedSys_var_ppEffects_ColorInversion ppEffectAdjust [_red, _green, _blue];
	X39_MedSys_var_ppEffects_ColorInversion ppEffectCommit X39_MedSys_var_TickRate;
	
	X39_MedSys_var_ppEffects_ChromAberration ppEffectAdjust [_dissortA, _dissortB, true];
	X39_MedSys_var_ppEffects_ChromAberration ppEffectCommit X39_MedSys_var_TickRate;
	
	//EFFEKT ppEffectAdjust[0.5 * (0.1 * VAR), 3 * (0.1 * VAR), true]; EFFEKT ppEffectCommit 0;
};
_this setVariable ["X39_MedSys_var_Pain", _painOrig, true];