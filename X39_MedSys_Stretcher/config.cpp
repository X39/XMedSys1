class CfgPatches
{
	class X39_MedSys_Patch_Stretcher
	{
		units[] = {"X39_MedSys_var_Stretcher"};
		weapons[] = {};
		requiredVersion = 0.10;
		requiredAddons[] = {};
        author = "Config: X39|Cpt. HM Murdock, Model/Textures: Nicomach";
        mail = "killerx29@gmail.com";
	};
};
class CfgVehicles
{

	class NonStrategic;
	class X39_MedSys_Stretcher: NonStrategic
	{
		mapSize = 1.46;
		author = "Nicomach";
		icon = "\X39_MedSys_Stretcher\data\stretcher_ico.paa";
		_generalMacro = "kay_stretcher";
		scope = 2;
		displayName = "kay_stretcher";
		vehicleClass = "Objects";
		destrType = "DestructNo";
		accuracy = 0.3;
		armor = 100;
		model = "\X39_MedSys_Stretcher\stretcher.p3d";
	};
};