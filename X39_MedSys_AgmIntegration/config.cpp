class CfgPatches{
	class X39_MedSys_AgmIntegration{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};

class CfgVehicles
{
	class Man;
	class CAManBase: Man
	{
		class AGM_Actions
		{
			class XMedSys_MedicalOther
			{
				displayName = "Medical Treatment >>";
				distance = 4;
				condition = "(vehicle player == player) && (cursorTarget getVariable ['X39_MedSys_var_UnitInitilized', false])";
				statement = "'XMedSys_MedicalOther' call AGM_Interaction_fnc_openMenu;";
				showDisabled = 1;
				icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				priority = 6;
				subMenu[] = {"XMedSys_MedicalOther", 0};
			
				class XMedSys_CheckOther
				{
					displayName = "$STR_X39_MedSys_var__Option_CheckOther";
					condition = "X39_MedSys_var_Running && {vehicle player == player}";
					statement = "[0, cursorTarget] spawn X39_MedSys_fnc_checkUnitStatus";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_Bandage
				{
					displayName = "$STR_X39_MedSys_var__Option_Bandage";
					condition = "X39_MedSys_var_Running && ('BANDAGE' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, cursorTarget, ('BANDAGE' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_BandageUnit";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_PutTourniquet
				{
					displayName = "$STR_X39_MedSys_var__Option_PutTourniquet";
					condition = "X39_MedSys_var_Running && ('TOURNIQUET' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && !(cursorTarget getVariable ['X39_MedSys_var_Bleeding_hasTourniquet', false]) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, cursorTarget, ('TOURNIQUET' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_putTourniquet";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_RemoveTourniquet
				{
					displayName = "$STR_X39_MedSys_var__Option_RemoveTourniquet";
					condition = "X39_MedSys_var_Running && ('TOURNIQUET' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && (cursorTarget getVariable ['X39_MedSys_var_Bleeding_hasTourniquet', false]) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, cursorTarget, ('TOURNIQUET' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_putTourniquet";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_Blood
				{
					displayName = "$STR_X39_MedSys_var__Option_Blood";
					condition = "X39_MedSys_var_Running && ('BLOOD' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, cursorTarget, ('BLOOD' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_BloodUnit";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_Morphine
				{
					displayName = "$STR_X39_MedSys_var__Option_Morphine";
					condition = "X39_MedSys_var_Running && ('MORPHINE' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, cursorTarget, ('MORPHINE' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_MorphineUnit";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_Medikit
				{
					displayName = "$STR_X39_MedSys_var__Option_Medikit";
					condition = "X39_MedSys_var_Running && ('MEDKIT' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, cursorTarget, ('MEDKIT' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_UseMediKitOnUnit";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_Epinephrine
				{
					displayName = "$STR_X39_MedSys_var__Option_Epinephrine";
					condition = "X39_MedSys_var_Running && ('EPINEPHRINE' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, cursorTarget, ('EPINEPHRINE' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_EpinephrineUnit";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_Defibrillator
				{
					displayName = "$STR_X39_MedSys_var__Option_Defibrillator";
					condition = "X39_MedSys_var_Running && ('DEFIBRILLATE' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, cursorTarget, ('DEFIBRILLATE' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_defibrilatorUnit";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_doCPR
				{
					displayName = "$STR_X39_MedSys_var__Interaction_doCPR";
					condition = "X39_MedSys_var_Running && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, cursorTarget] spawn X39_MedSys_fnc_doCpr";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_doStabilize
				{
					displayName = "$STR_X39_MedSys_var__Interaction_doStabilize";
					condition = "X39_MedSys_var_Running && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, cursorTarget, ('MEDKIT' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_stabilize";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
			};
			
			class XMedSys_Drag
			{
				displayName = "$STR_X39_MedSys_var__Interaction_Drag";
				distance = 4;
				condition = "X39_MedSys_var_Running && X39_MedSys_var_enableDrag && {!X39_XLib_var_ActionDialog_IsSelf && {vehicle player == player}}";
				statement = "[0, cursorTarget] spawn X39_MedSys_fnc_DragUnit";
				priority = 2.1;
				icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
			};
			class XMedSys_Carry
			{
				displayName = "$STR_X39_MedSys_var__Interaction_Carry";
				distance = 4;
				condition = "X39_MedSys_var_Running && X39_MedSys_var_enableCarry && {!X39_XLib_var_ActionDialog_IsSelf && {vehicle player == player}}";
				statement = "[0, cursorTarget] spawn X39_MedSys_fnc_CarryUnit";
				priority = 2.0;
				icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
			};
		};
			
		class AGM_SelfActions
		{
			class XMedSys_MedicalSelf
			{
				displayName = "Medical Treatment >>";
				condition = "(vehicle player == player) && (player getVariable ['X39_MedSys_var_UnitInitilized', false])";
				statement = "'XMedSys_MedicalSelf' call AGM_Interaction_fnc_openMenuSelf;";
				showDisabled = 1;
				priority = 6;
				icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				subMenu[] = {"XMedSys_MedicalSelf", 1};
			
				class XMedSys_CheckSelf
				{
					displayName = "$STR_X39_MedSys_var__Option_CheckSelf";
					condition = "X39_MedSys_var_Running && {vehicle player == player}";
					statement = "[0, player] spawn X39_MedSys_fnc_checkUnitStatus";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_Bandage
				{
					displayName = "$STR_X39_MedSys_var__Option_Bandage";
					condition = "X39_MedSys_var_Running && ('BANDAGE' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, player, ('BANDAGE' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_BandageUnit";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_PutTourniquet
				{
					displayName = "$STR_X39_MedSys_var__Option_PutTourniquet";
					condition = "X39_MedSys_var_Running && ('TOURNIQUET' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && !(player getVariable ['X39_MedSys_var_Bleeding_hasTourniquet', false]) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, player, ('TOURNIQUET' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_putTourniquet";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_RemoveTourniquet
				{
					displayName = "$STR_X39_MedSys_var__Option_RemoveTourniquet";
					condition = "X39_MedSys_var_Running && ('TOURNIQUET' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && (player getVariable ['X39_MedSys_var_Bleeding_hasTourniquet', false]) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, player, ('TOURNIQUET' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_putTourniquet";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_Blood
				{
					displayName = "$STR_X39_MedSys_var__Option_Blood";
					condition = "X39_MedSys_var_Running && ('BLOOD' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, player, ('BLOOD' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_BloodUnit";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_Morphine
				{
					displayName = "$STR_X39_MedSys_var__Option_Morphine";
					condition = "X39_MedSys_var_Running && ('MORPHINE' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, player, ('MORPHINE' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_MorphineUnit";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_PutEarplugs
				{
					displayName = "$STR_X39_MedSys_var__Option_PutEarplugs";
					condition = "X39_MedSys_var_Running && !(player getVariable ['X39_MedSys_var_hasEarplugs', false]) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, player] spawn X39_MedSys_fnc_UseEarplugs";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_RemoveEarplugs
				{
					displayName = "$STR_X39_MedSys_var__Option_RemoveEarplugs";
					condition = "X39_MedSys_var_Running && (player getVariable ['X39_MedSys_var_hasEarplugs', false]) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, player] spawn X39_MedSys_fnc_UseEarplugs";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
				class XMedSys_Medikit
				{
					displayName = "$STR_X39_MedSys_var__Option_Medikit";
					condition = "X39_MedSys_var_Running && ('MEDKIT' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true}) && {vehicle player == player}";
					statement = "private['_allowID']; _res = [0, player, ('MEDKIT' call {	_allowID = (_this call{		if(!X39_MedSys_var_Limitations_enable) exitWith {  0 };		 [_this, player] call X39_MedSys_fnc_isAllowedToUse;	});	if(_allowID < 0) exitWith { false};	 true})] spawn X39_MedSys_fnc_UseMediKitOnUnit";
					priority = 1;
					showDisabled = 1;
					icon = "X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
				};
			};
		};
	};
};