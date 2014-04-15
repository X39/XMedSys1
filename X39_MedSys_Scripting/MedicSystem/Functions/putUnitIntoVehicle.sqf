#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	
 *
 *	@ParamsCount - 2
 *	@Param1 - OBJECT (Unit) - N/A
 *	@Param2 - OBJECT (Vehicle)|BOOL - OBJECT:	puts unit of Param1 into Param2 vehicle
 *									  BOOL:		regardless of if true or false, will put unit in nearest vehicle
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_param2 = [_this, 1, false, [ObjNull, false]] call BIS_fnc_param;

if(typeName _param2 == "BOOL") then
{
	_targetLand = nearestObject [_unit, "car"];
	_targetAir = nearestObject [_unit, "air"];
	_distanceLand = 100;
	_distanceAir  = 100;
	if(!isNull _targetLand) then
	{
		_distanceLand = _unit distance _targetLand;
		if(_distanceLand > 10) then
		{
			_targetLand = ObjNull;
			_distanceLand = 100;
		};
	};
	if(!isNull _targetAir) then
	{
		_distanceAir = _unit distance _targetAir;
		if(_distanceAir > 10) then
		{
			_targetAir = ObjNull;
			_distanceAir = 100;
		};
	};
	if(!(isNull _targetLand) || !(isNull _targetAir)) then
	{
		if(_distanceLand < _distanceAir) then
		{
			[_unit, _targetLand] call X39_MedSys_fnc_putUnitIntoVehicle;
		}
		else
		{
			[_unit, _targetAir] call X39_MedSys_fnc_putUnitIntoVehicle;
		};
	}
	else
	{
		[localize "STR_X39_MedSys_var__VehiclePut_NoVehicleInRange"] call X39_MedSys_fnc_OutputMessageToPlayer;
	};
}
else
{
	_unit moveInCargo _param2;
	sleep 0.25;
	if(_unit call X39_MedSys_fnc_isUnitKnockedOut) then
	{
		_unit playAction "die";
	};
};