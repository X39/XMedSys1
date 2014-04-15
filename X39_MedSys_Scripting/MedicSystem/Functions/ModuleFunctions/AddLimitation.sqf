#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
private["_logic", "_takeSynchedObjectsClassnames", "_limitations", "_behaviourOfSynchedObjects", "_obj"];
if(!isServer) exitWith {};
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_takeSynchedObjectsClassnames = (_logic getVariable ["DialogOptions_TakeSynchedClassnames", 1]) call X39_MedSys_fnc_intToBoolean;
_limitations = compile (_logic getVariable ["DialogOptions_LimitationToAdd", "[]"]);
_behaviourOfSynchedObjects = (_logic getVariable ["DialogOptions_BehaviourID", 1]);

{
	if(_takeSynchedObjectsClassnames) then
	{
		_obj = typeOf _x;
		deleteVehicle _x;
	}
	else
	{
		_obj = _x;
	};
	
	call {
		private["_x"];
		{
			[_x, _obj, _behaviourOfSynchedObjects] call X39_MedSys_fnc_addLimitation;
			false
		}count ([] call _limitations);
	};
	false
}count (synchronizedObjects _logic);

[] call X39_MedSys_fnc_pushLimitations;