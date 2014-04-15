#include "\X39_MedSys_Scripting\MedicSystem\default.hpp"
/**
 *	MedicalMenu setup
 *	
 *
 *	@ParamsCount - 1
 *	@Param1 - Array - endless objects for medicalMenu (see following list:)
 *		-ARR1 - Boolean - enable processing (use this for dynamic on/off thingies)
 *		-ARR2 - Boolean - enable button
 *		-ARR3 - Boolean - empty spacer
 *		-ARR4 - String - Text on button
 *		-ARR5 - String - Action to perform
 *	@Return - N/A
 *	@Author - X39|Cpt. HM Murdock
 */
_index = 1600;
{
	if(_x select 0) then
	{
		if!(_x select 2) then
		{
			ctrlShow[_index, true];
			ctrlEnable[_index, _x select 1];
			ctrlSetText[_index, _x select 3];
			buttonSetAction[_index, _x select 4];
		};
		_index = _index + 1;
	};
}forEach _this;
