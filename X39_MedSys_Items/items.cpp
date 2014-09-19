//ArmA 3 default FAK fix
//class FirstAidKit
//{
//	class ItemInfo
//	{
////	};
//};


class x39_bandage : x39_itemcore
{
	scope = 2;
	displayName = $STR_X39_MedSys_var__Items_Weapons_Bandage;
	model = "\X39_MedSys_Ressources\X39\Mods\MedSys\Models\Bandage\Bandage.p3d";
	class ItemInfo
    {
		mass = 2;
    }; 
	picture = "\X39_MedSys_Ressources\X39\Mods\MedSys\images\bandage.paa";
	descriptionShort = "";
};
class x39_morphine : x39_itemcore
{
	scope = 2;
	displayName = $STR_X39_MedSys_var__Items_Morphine;
	class ItemInfo
    {
    	mass = 1;
    }; 
	picture = "\X39_MedSys_Ressources\X39\Mods\MedSys\images\morphine.paa";
	descriptionShort = "";
	model = "\X39_MedSys_Ressources\X39\Mods\MedSys\Models\Injector\Injector.p3d";
};
class x39_epinephrine : x39_itemcore
{
	scope = 2;
	displayName = $STR_X39_MedSys_var__Items_Epinephrine;
	class ItemInfo
    {
		mass = 1;
    }; 
	picture = "\X39_MedSys_Ressources\X39\Mods\MedSys\images\epinephrine.paa";
	descriptionShort = "";
	model = "\X39_MedSys_Ressources\X39\Mods\MedSys\Models\Injector\InjectorInv.p3d";
};
class x39_tourniquet : x39_itemcore
{
	scope = 2;
	displayName = $STR_X39_MedSys_var__Items_Tourniquet;
	class ItemInfo
    {
    	mass = 10;
    }; 
	picture = "\X39_MedSys_Ressources\X39\Mods\MedSys\images\tourniquet.paa";
	descriptionShort = "";
};
class x39_bloodbag : x39_itemcore
{
	scope = 2;
	displayName = $STR_X39_MedSys_var__Items_BloodBag;
	class ItemInfo
    {
    	mass = 10;
    }; 
	picture = "\X39_MedSys_Ressources\X39\Mods\MedSys\images\BloodBag.paa";
	descriptionShort = "";
};
class x39_defibrillator : x39_itemcore
{
	scope = 2;
	displayName = $STR_X39_MedSys_var__Items_Defibrillator;
	model = "\A3\Structures_F_EPA\Items\Medical\Defibrillator_F.p3d";
	class ItemInfo
    {
    	mass = 20;
    }; 
	picture = "\X39_MedSys_Ressources\X39\Mods\MedSys\images\Defibrillator.paa";
	descriptionShort = "";
};
class x39_medikit : x39_itemcore
{
	scope = 2;
	displayName = $STR_X39_MedSys_var__Items_MediKit;
	class ItemInfo
    {
    	mass = 10;
    }; 
	picture = "\X39_MedSys_Ressources\X39\Mods\MedSys\images\MedKit.paa";
	descriptionShort = "Enough to heal 1 soldier";
};
class x39_medikit2 : x39_itemcore
{
	scope = 2;
	displayName = $STR_X39_MedSys_var__Items_MediKit;
	class ItemInfo
    {
    	mass = 18;
    }; 
	picture = "\X39_MedSys_Ressources\X39\Mods\MedSys\images\MedKit.paa";
	descriptionShort = "Enough to heal 2 soldiers";
};
class x39_medikit3 : x39_itemcore
{
	scope = 2;
	displayName = $STR_X39_MedSys_var__Items_MediKit;
	class ItemInfo
    {
    	mass = 26;
    }; 
	picture = "\X39_MedSys_Ressources\X39\Mods\MedSys\images\MedKit.paa";
	descriptionShort = "Enough to heal 3 soldiers";
};
class x39_medikit4 : x39_itemcore
{
	scope = 2;
	displayName = $STR_X39_MedSys_var__Items_MediKit;
	class ItemInfo
    {
    	mass = 34;
    }; 
	picture = "\X39_MedSys_Ressources\X39\Mods\MedSys\images\MedKit.paa";
	descriptionShort = "Enough to heal 4 soldiers";
};
class x39_medikit5 : x39_itemcore
{
	scope = 2;
	displayName = $STR_X39_MedSys_var__Items_MediKit;
	class ItemInfo
    {
    	mass = 42;
    }; 
	picture = "\X39_MedSys_Ressources\X39\Mods\MedSys\images\MedKit.paa";
	descriptionShort = "Enough to heal 5 soldiers";
};
class x39_earplug : x39_itemcore
{
	scope = 2;
	displayName = $STR_X39_MedSys_var__Items_EarPlug;
	class ItemInfo
    {
		mass = 0;
    }; 
	picture = "\X39_MedSys_Ressources\X39\Mods\MedSys\images\earplugs.paa";
	descriptionShort = "";
};