class NATO_Box_Base;
class x39_medicBox: NATO_Box_Base {
	scope = 2;
	vehicleClass = "Ammo";
	displayName = $STR_X39_MedSys_var__Items_Vehicles_MedicalBox1;
	hiddenSelectionsTextures[] = {"X39_MedSys_Ressources\X39\Mods\MedSys\Overlays\MedicBox_HiddenSelectionTexture.paa","A3\Weapons_F\Ammoboxes\data\AmmoBox_CO.paa"};
	model = "\A3\weapons_F\AmmoBoxes\WpnsBox_large_F";
	icon = "iconCrateLarge";
	mapSize = 2.34;
	transportMaxMagazines = 10000;
	transportMaxWeapons = 10000;
	transportMaxBackpacks = 10000;
	maximumLoad = 200000;
	class TransportMagazines{};
	class TransportWeapons{};
	class TransportItems {
		class x39_medicBox_Bandages {
			name = "x39_bandage";
			count = 100;
		};
		class x39_medicBox_Morphine {
			name = "x39_morphine";
			count = 100;
		};
		class x39_medicBox_Epinephrine {
			name = "x39_epinephrine";
			count = 100;
		};
		class x39_medicBox_Tourniquet {
			name = "x39_tourniquet";
			count = 100;
		};
		class x39_medicBox_BloodBags {
			name = "x39_bloodbag";
			count = 100;
		};
		class x39_medicBox_Defibrillator {
			name = "x39_defibrillator";
			count = 100;
		};
		class x39_medicBox_MediKit_single {
			name = "x39_medikit";
			count = 100;
		};
		class x39_medicBox_MediKit_2 {
			name = "x39_medikit2";
			count = 100;
		};
		class x39_medicBox_MediKit_3 {
			name = "x39_medikit3";
			count = 100;
		};
		class x39_medicBox_MediKit_4 {
			name = "x39_medikit4";
			count = 100;
		};
		class x39_medicBox_MediKit_5 {
			name = "x39_medikit5";
			count = 100;
		};
		class x39_medicBox_x39_earplug {
			name = "x39_earplug";
			count = 100;
		};
	};

};