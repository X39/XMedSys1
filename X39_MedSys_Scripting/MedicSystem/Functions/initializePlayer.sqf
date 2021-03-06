#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Initializes the player
 *	In most cases you DONT need to initiate players seperated!
 *	Use with care! (if players are in JIP and the function is callen this can
 *	and WILL lead into unexpected behaviour!)
 *
 *	@ParamsCount - 0
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
if(isDedicated) exitWith {};
_res = _this spawn{
	private["_unit", "_addEventHandlers", "_forceInit", "_resetEffects"];
	sleep 1;
	_addEventHandlers = [_this, 0, true, [true]] call BIS_fnc_param;
	_forceInit = [_this, 1, false, [true]] call BIS_fnc_param;
	_resetEffects = false;
	waitUntil{(alive player) && (!isNull player)};

	// Needed for our include of "init.sqf".
	// N.B.: this assignment needs to happen fairly late, if it happens too
	// early on, _unit may not equal player by the time arma begins to execute
	// this point in the script. See https://github.com/X39/XMedSys1/issues/15
	_unit = player;

#include "init.sqf"

	if(X39_MedSys_var_ppEffects_ColorCorrections == -1) then
	{
		_resetEffects = true;
		X39_MedSys_var_ppEffects_ColorCorrections = ppEffectCreate ["Colorcorrections", 1150]; //BASE PRIO - 1150
		X39_MedSys_var_ppEffects_ColorCorrections ppEffectEnable true;
	};
	if(X39_MedSys_var_ppEffects_Blur == -1) then
	{
		_resetEffects = true;
		X39_MedSys_var_ppEffects_Blur = ppEffectCreate ["DynamicBlur", 450]; //BASE PRIO - 450
		X39_MedSys_var_ppEffects_Blur ppEffectEnable true;
	};
	if(X39_MedSys_var_ppEffects_ColorInversion == -1) then
	{
		_resetEffects = true;
		X39_MedSys_var_ppEffects_ColorInversion = ppEffectCreate ["ColorInversion", 2500]; //BASE PRIO - 2500
		X39_MedSys_var_ppEffects_ColorInversion ppEffectEnable true;
	};
	if(X39_MedSys_var_ppEffects_ChromAberration == -1) then
	{
		_resetEffects = true;
		X39_MedSys_var_ppEffects_ChromAberration = ppEffectCreate ["ChromAberration", 5000]; //BASE PRIO - 200
		X39_MedSys_var_ppEffects_ChromAberration ppEffectEnable true;
	};
	if(_resetEffects) then
	{
		[] call X39_MedSys_fnc_resetEffects;
	};
	/*
		EFFEKT = ppEffectCreate ["ChromAberration", 200];
		EFFEKT ppEffectEnable true;
		EFFEKT ppEffectAdjust[0.5 * 0.1, 3 * 0.1, true];
		EFFEKT ppEffectCommit 0;
	*/
};
/*

		X39_MedSys_var_ppEffects_ColorCorrections = ppEffectCreate ["Colorcorrections", 1150];
		X39_MedSys_var_ppEffects_ColorCorrections ppEffectEnable true;
		X39_MedSys_var_ppEffects_Blur = ppEffectCreate ["DynamicBlur", 450];
		X39_MedSys_var_ppEffects_Blur ppEffectEnable true;
		X39_MedSys_var_ppEffects_ColorInversion = ppEffectCreate ["ColorInversion", 2500];
		X39_MedSys_var_ppEffects_ColorInversion ppEffectEnable true;
*/
