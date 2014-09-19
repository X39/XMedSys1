#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	Creates the KnockedOut GUI
 *
 *	@ParamsCount - 1
 *	@Return - int - Time berofre respawn is available (-1 if disabled)
 *	@Author - X39|Cpt. HM Murdock
 */
DEBUG_LOG("Trying to create a dialog")
if!(X39_MedSys_var_Display_BlackOut_Open) then
{
	if(dialog) then {[] call X39_XLib_fnc_ActionDialog_closeDialog};
	X39_MedSys_var_Display_BlackOut_Open = true;
	//TFAR Related:
	//Is player can press tangent on radio [default value = false]:
	player setVariable ["tf_unable_to_use_radio", true];
	//Set voice volume level for player (not affect distance where voice is hearable) [default value - 1]:
	player setVariable["X39_MedSys_var_tfar_voiceVolumeValueBefore", player getVariable "tf_voiceVolume"];
	player setVariable ["tf_voiceVolume", 0];
	_res = [_this] spawn {
		private["_time", "_fadeIn", "_fadeOut", "_res"];
		_time = _this select 0;
		_fadeIn = {
			private["_i"];
			_i = 1;
			while{_i > X39_MedSys_var_Display_BlackOut_MaxFade && dialog} do {
				((findDisplay 30097) displayCtrl 2200) ctrlSetBackgroundColor  [0, 0, 0, _i];
				_i = _i - X39_MedSys_var_Display_BlackOut_FadeManipulator;
				sleep 0.1;
			};
		 };
		_fadeOut = {
			private["_i"];
			_i = X39_MedSys_var_Display_BlackOut_MaxFade;
			while{_i < 1 && dialog} do {
				((findDisplay 30097) displayCtrl 2200) ctrlSetBackgroundColor  [0, 0, 0, _i];
				_i = _i + X39_MedSys_var_Display_BlackOut_FadeManipulator;
				sleep 0.1;
			};
		};
		 
		 
		
		createDialog "X39_MedSys_blackOut";
		DEBUG_LOG("'X39_MedSys_blackOut' has been created")
		(findDisplay 30097) displayAddEventHandler ["KeyDown", 
		format["call %1", {
			private["_res"];
			_res = true;
			if((_this select 1) == ((actionKeys "chat") select 0) && X39_MedSys_var_KnockOut_enableChatWhenKnockedOut) then
			{
				_res = false;
			};
			//if(_this select 1 == 1 && X39_MedSys_var_KnockOut_enableEscMenuWhenKnockedOut) then
			//{
			//	createDialog "RscDisplayInterrupt";
			//	//(_this select 0) createDisplay  "RscDisplayInterrupt";
			//	((findDisplay 49) displayCtrl 1010) ctrlEnable false; //disable RespawnButton
			//};
			_res;
		}]];
		DEBUG_LOG("added displayEventHandler")
		
		if(X39_MedSys_var_KnockOut_showRespawnButton) then
		{
			ctrlEnable[1600, false];
			if(_time > -1) then
			{
				DEBUG_LOG(format["creating timed respawnButton (time before available: %1)" KOMMA _time])
				_res = _time spawn {
					private["_timestamp"];
					_timestamp = (player getVariable ["X39_MedSys_var_LifeTime_TimeStamp", -1]) + _this;
					while{_timestamp - time > 0 && dialog} do
					{
						sleep 1;
					};
					ctrlEnable[1600, true];
					buttonSetAction[1600, "player call X39_MedSys_fnc_killUnit; call X39_MedSys_fnc_closeBlackOutDisplay;"];
					DEBUG_LOG("Enabled respawn button");
				};
			}DEBUG_CODE(else {DEBUG_LOG("No respawnbutton will be released!")});
		}
		else
		{
			ctrlShow[1600, false];
		};
		if(!X39_MedSys_var_KnockOut_showAbortButton) then
		{
			ctrlShow[1601, false];
		};
		_res = [] spawn {
			while {dialog} do
			{
				ctrlSetText [1002, "Blood left:"];
				ctrlSetText [1003, format["%1%2", floor ((((player call X39_MedSys_fnc_getPlayerBleeding) select 2) / X39_MedSys_var_Bleeding_StartingBlood) * 100), "%"]];
				sleep 0.01;
			};
		};
		while {dialog} do
		{
			//player sideChat format["%1", dialog];
			DEBUG_LOG("Fading in")
			call _fadeIn;
			sleep 3;
			DEBUG_LOG("Fading out")
			call _fadeOut;
			sleep (X39_MedSys_var_Display_BlackOut_FadeTime_Value + (random X39_MedSys_var_Display_BlackOut_FadeTime_RandomMinMax - (X39_MedSys_var_Display_BlackOut_FadeTime_RandomMinMax / 2)));
		};
	};
}DEBUG_CODE(else{diag_log "Failed to create display!";});