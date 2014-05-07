class CfgPatches{
	class X39_MedSys_Scripting{
         units[] = {"X39_MedSys_Module_BasicModule", "X39_MedSys_Module_EnableLimitationsSystemModule", "X39_MedSys_Module_AddLimitationModule"};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_MedSys_Settings", "X39_XLib_Core", "X39_XLib_ScriptObjectCreation", "X39_MedSys_UIs", "X39_ActionUi_Scripting", "X39_XLib_EventSystem"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};

class X39_XLib_Function_TypeA;
class X39_XLib_Function_TypeB;
class X39_XLib_Function_TypeC;
class CfgFactionClasses
{
	class X39_XMedSys
	{
		displayName = "XMedSys";
		priority = 5000;
		side = 7;
	};
};
class CfgFunctions 
{
	class X39_MedSys
	{
		class ModuleFunctions
		{
			class module_BaseModule:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\ModuleFunctions\BaseModule.sqf";};
			class module_AddLimitation:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\ModuleFunctions\AddLimitation.sqf";};
			class module_EnableLimitationSystem:X39_XLib_Function_TypeA		{file = "\X39_MedSys_Scripting\MedicSystem\Functions\ModuleFunctions\EnableLimitationSystem.sqf";};
		}
		class Generic
		{//
			class initModVariables:X39_XLib_Function_TypeB					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\initModVariables.sqf";};
			class initMod:X39_XLib_Function_TypeA							{file = "\X39_MedSys_Scripting\MedicSystem\Functions\initMod.sqf";};
			
 			class fakeKillUnit:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\fakeKillUnit.sqf";};
			class alive:X39_XLib_Function_TypeA								{file = "\X39_MedSys_Scripting\MedicSystem\Functions\alive.sqf";};
			class getUnitDamage:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\getUnitDamage.sqf";};
			class handleKeyPress:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\handleKeyPress.sqf";};
			class healUnit:X39_XLib_Function_TypeA							{file = "\X39_MedSys_Scripting\MedicSystem\Functions\healUnit.sqf";};
			class intToBoolean:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\IntToBoolean.sqf";};
			class knockOutUnit:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\knockOutUnit.sqf";};
			class knockOutCheck:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\knockOutCheck.sqf";};
			class initializePlayer:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\initializePlayer.sqf";};
			class initializeUnit:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\initializeUnit.sqf";};
			class setUnitDamage:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\setUnitDamage.sqf";};
			class setUnitPain:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\setUnitPain.sqf";};
			
			class pullUnitOutOfVehicle:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\pullUnitOutOfVehicle.sqf";};
			class putUnitIntoVehicle:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\putUnitIntoVehicle.sqf";};
			
			class isUnitInProneStance:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\isUnitInProneStance.sqf";};
			class isUnitAbleToMove:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\isUnitAbleToMove.sqf";};
			class isUnitKnockedOut:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\isUnitKnockedOut.sqf";};
			
			
			class OutputMessageToPlayer:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\OutputMessageToPlayer.sqf";};
			
			class killUnit:X39_XLib_Function_TypeA							{file = "\X39_MedSys_Scripting\MedicSystem\Functions\killUnit.sqf";};
			class runCamShakeThread:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\runCamShakeThread.sqf";};
			class resetEffects:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\resetEffects.sqf";};
			class applyServerConfig:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\applyServerConfig.sqf";};
			
			
			class getUnitHearing:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\getUnitHearing.sqf";};
			class setUnitHearing:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\setUnitHearing.sqf";};
			class addUnitHearing:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\addUnitHearing.sqf";};
			
			class dropUnit:X39_XLib_Function_TypeA							{file = "\X39_MedSys_Scripting\MedicSystem\Functions\dropUnit.sqf"};			
		};
		class HandleDamage
		{
			class handleBody:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\HandleDamage\handleBody.sqf";};
			class handleDamage:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\HandleDamage\handleDamage.sqf";};
			class handleDamageGeneral:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\HandleDamage\handleDamageGeneral.sqf";};
			class handleHand:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\HandleDamage\handleHand.sqf";};
			class handleHead:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\HandleDamage\handleHead.sqf";};
			class handleLeg:X39_XLib_Function_TypeA							{file = "\X39_MedSys_Scripting\MedicSystem\Functions\HandleDamage\handleLeg.sqf";};
		};
		class MedicalMenu
		{
			class othersInteraction:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\MedicalMenu\othersInteraction.sqf";};
			class selfInteraction:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\MedicalMenu\selfInteraction.sqf";};
			class medicalMenuHideAll:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\MedicalMenu\hideAll.sqf";};
			class medicalMenuCreateMenu:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\MedicalMenu\medicalMenuCreateMenu.sqf";};
			class MM_putUnitIntoVehicle:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\MedicalMenu\putUnitIntoVehicle.sqf";};
			class MM_dropUnitFromVehicle:X39_XLib_Function_TypeA			{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\MedicalMenu\dropUnitFromVehicle.sqf";};
		};
		class MedSysOverlay
		{
			class MedSysOverlayCreateDisplay:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\Overlay\createDisplay.sqf";};
			class MedSysOverlayInitOverlay:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\Overlay\initOverlay.sqf";};
			class MedSysOverlayUnloadOverlay:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\Overlay\unloadOverlay.sqf";};
			class MedSysOverlayHideAll:X39_XLib_Function_TypeA							{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\Overlay\hideAll.sqf";};
			class MedSysOverlayOverlayThread:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\Overlay\overlayThread.sqf";};
			
			class MedSysOverlay_controlFunctions_Health:X39_XLib_Function_TypeA			{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\Overlay\OverlayFunctions\Health.sqf";};
			class MedSysOverlay_controlFunctions_Leg:X39_XLib_Function_TypeA			{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\Overlay\OverlayFunctions\Leg.sqf";};
			class MedSysOverlay_controlFunctions_Bleeding:X39_XLib_Function_TypeA		{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\Overlay\OverlayFunctions\Bleeding.sqf";};
			class MedSysOverlay_controlFunctions_Tourniquet:X39_XLib_Function_TypeA		{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\Overlay\OverlayFunctions\Tourniquet.sqf";};
			class MedSysOverlay_controlFunctions_Morphine:X39_XLib_Function_TypeA		{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\Overlay\OverlayFunctions\Morphine.sqf";};
		};
		class BlackOutDisplay
		{
			class createBlackOutDisplay:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\knockOutDisplay\createDialog.sqf";};
			class closeBlackOutDisplay:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\DialogControl\knockOutDisplay\closeDialog.sqf";};
		};
		class MedicalActions
		{
			class bandageUnit:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\bandageUnit.sqf";};
			class bloodUnit:X39_XLib_Function_TypeA							{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\bloodUnit.sqf";};
			class putTourniquet:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\putTourniquet.sqf";};
			class carryUnit:X39_XLib_Function_TypeA							{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\carryUnit.sqf";};			
			class checkUnitStatus:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\checkUnitStatus.sqf";};
			class defibrilatorUnit:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\dephibrilatorUnit.sqf";};
			class dragUnit:X39_XLib_Function_TypeA							{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\dragUnit.sqf";};
			class epinephrineUnit:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\epinephrineUnit.sqf";};
			class getMedicAnimation:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\getMedicAnimation.sqf";};
			class morphineUnit:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\morphineUnit.sqf";};
			class useMediKitOnUnit:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\useMediKitOnUnit.sqf";};
			class doCpr:X39_XLib_Function_TypeA								{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\doCpr.sqf";};
			class UseEarplugs:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\UseEarplugs.sqf";};
			class stabilize:X39_XLib_Function_TypeA							{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\stabilize.sqf";};
		};
		class MedicalActions_Messages
		{
			class msg_lifeTime:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\MedicalMessages\msg_lifeTime.sqf";};
			class msg_damageReceived:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\MedicalMessages\msg_damageReceived.sqf";};
			class msg_isBleeding:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\MedicalMessages\msg_isBleeding.sqf";};
			class msg_bloodLeft:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\MedicalMessages\msg_bloodLeft.sqf";};
			class msg_legsBroken:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\MedicalMessages\msg_legsBroken.sqf";};
			class msg_knockedOut:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\MedicalMessages\msg_knockedOut.sqf";};
			class msg_painReceived:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\MedicalActions\MedicalMessages\msg_painReceived.sqf";};
		};
		class Bleeding
		{
			class getPlayerBleeding:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\Bleeding\getPlayerBleeding.sqf";};
			class setPlayerBleeding:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\Bleeding\setPlayerBleeding.sqf";};
		};
		class UpdateTick
		{
			class runTickThread:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\UpdateTicks\runTickThread.sqf";};
			class registerNewTickHandler:X39_XLib_Function_TypeA			{file = "\X39_MedSys_Scripting\MedicSystem\Functions\UpdateTicks\registerNewTickHandler.sqf";};
			class TH_bleedingHandler:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\UpdateTicks\bleedingHandler.sqf";};
			class TH_walkingHandler:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\UpdateTicks\walkingHandler.sqf";};
			class TH_tourniquetHandler:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\UpdateTicks\tourniquetHandler.sqf";};
			class TH_painHandler:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\UpdateTicks\painHandler.sqf";};
			class TH_HealthRegenOverTimeHandler:X39_XLib_Function_TypeA		{file = "\X39_MedSys_Scripting\MedicSystem\Functions\UpdateTicks\HealthRegenOverTimeHandler.sqf";};
			class TH_hearingHandler:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\UpdateTicks\hearingHandler.sqf";};
		};
		class AddEventHandlerFunctions
		{
			class AddEH_AnimChanged:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\addEventHandlerFunctions\AddEH_AnimChanged.sqf";};
			class AddEH_KeyDown:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\addEventHandlerFunctions\AddEH_KeyDown.sqf";};
			class AddEH_HandleDamage:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\addEventHandlerFunctions\AddEH_HandleDamage.sqf";};
			class AddEH_Respawn:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\addEventHandlerFunctions\AddEH_Respawn.sqf";};
			class AddEH_FiredNear:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\addEventHandlerFunctions\AddEH_FiredNear.sqf";};
			class AddEH_Explosion:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\addEventHandlerFunctions\AddEH_Explosion.sqf";};
		};
		class LimitMedicFunctionallity
		{
			class pushLimitations:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\Limit\pushLimitations.sqf";};
			class addLimitation:X39_XLib_Function_TypeA						{file = "\X39_MedSys_Scripting\MedicSystem\Functions\Limit\addLimitation.sqf";};
			class dropLimitation:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\Limit\dropLimitation.sqf";};
			class hasLimitations:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\Limit\hasLimitations.sqf";};
			class isAllowedToUse:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\Limit\isAllowedToUse.sqf";};
			class getLimitations:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\Limit\getLimitations.sqf";};
			class isValidLimitation:X39_XLib_Function_TypeA					{file = "\X39_MedSys_Scripting\MedicSystem\Functions\Limit\isValidLimitation.sqf";};
			class registerLimitation:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\Limit\registerLimitation.sqf";};
			class removeDeadObjectsFromLimitations:X39_XLib_Function_TypeA	{file = "\X39_MedSys_Scripting\MedicSystem\Functions\Limit\removeDeadObjectsFromLimitations.sqf";};
		};
		class Hitzones
		{
			class hitzoneHead_getDamage:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\HitZones\getHeadDamage.sqf";};
			class hitzoneHead_setDamage:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\HitZones\setHeadDamage.sqf";};
			class hitzoneLeg_getDamage:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\HitZones\getLegDamage.sqf";};
			class hitzoneLeg_setDamage:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\HitZones\setLegDamage.sqf";};
		};
		class HelperFunctions
		{
			class helper_playMove:X39_XLib_Function_TypeA				{file = "\X39_MedSys_Scripting\MedicSystem\Functions\HelperFunctions\playMove.sqf";};
		};
	};
};
class CfgVehicles
{
#include "module.cpp"
};