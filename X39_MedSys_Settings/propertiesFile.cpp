 #include "\X39_XLib_ModProperties\modPropertiesIncludes.hpp"

class XLib {
	class modProperties {
		class propertyBase;
		class valueBase;
		class modBase;
		class X39_MedSys: modBase {
			scope = 2;
			name = "X39s Medical System";
			image = "\X39_MedSys_Ressources\X39\Mods\MedSys\logo.paa";
			class properties {
				class key1: propertyBase {
					variable = "X39_MedSys_var_Internal_Key1";
					display = "Self interaction key";
					type = TYPE_KEY;
					description = "Key for self interaction";
					default[] = {211, 0, 0, 0};
				};
				class key2: propertyBase {
					variable = "X39_MedSys_var_Internal_Key2";
					display = "Others interaction key";
					type = TYPE_KEY;
					description = "Key to interact with other people";
					default[] = {210, 0, 0, 0};
				};
				class X39_MedSys_var_IOMsg_AsHint: propertyBase {
					variable = "X39_MedSys_var_IOMsg_AsHint";
					display = "General >> Output messages as hint";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "Output XMedSys messages as hint";
					default = 1;
				};
				class X39_MedSys_var_IOMsg_AsSystemChat: propertyBase {
					variable = "X39_MedSys_var_IOMsg_AsSystemChat";
					display = "General >> Output messages as systemChat message";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "Output XMedSys messages as systemChat message";
					default = 1;
				};
				class X39_MedSys_var_enableOnAllMissions: propertyBase {
					variable = "X39_MedSys_var_enableOnAllMissions";
					display = "General >> enableOnAllMissions";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "Force XMedSys to be enabled clientside (!WARNING! Cant be prevented by missions!)";
					default = 0;
				};
				class X39_MedSys_var_Settings_playEarRingingSound: propertyBase {
					variable = "X39_MedSys_var_Settings_playEarRingingSound";
					display = "General >> Play ear ringing sound";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "When true, the earringing sound will be played when you cant hear anything because of explosions";
					default = 1;
				};
				class X39_MedSys_var_Settings_Overlay_Transparency: propertyBase {
					variable = "X39_MedSys_var_Settings_Overlay_Transparency";
					display = "Overlay >> transparency";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "Manipulates overlay transparency (does not includes the total screen overlay! Only the icons)";
					default = 1;
				};
				class X39_MedSys_var_Settings_Overlay_RefreshRate: propertyBase {
					variable = "X39_MedSys_var_Settings_Overlay_RefreshRate";
					display = "Overlay >> refreshRate";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "Overlay refreshRate in seconds (can increase performance if set to higher values)";
					default = 1;
				};
				class X39_MedSys_var_Settings_EnableCamShake: propertyBase {
					variable = "X39_MedSys_var_Settings_EnableCamShake";
					display = "Overlay >> enableCamShake";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "if enabled, your cam will shake when you have taken a hit";
					default = 1;
				};
				class X39_MedSys_var_Display_Overlay_AllowHealthView: propertyBase {
					variable = "X39_MedSys_var_Display_Overlay_AllowHealthView";
					display = "Overlay >> AllowHealthView";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "Enable/Disable specific overlay part<br />Local settings are only effective if the server is not forcing false!";
					default = 1;
				};
				class X39_MedSys_var_Display_Overlay_AllowBoodView: propertyBase {
					variable = "X39_MedSys_var_Display_Overlay_AllowBoodView";
					display = "Overlay >> AllowBoodView";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "Enable/Disable specific overlay part<br />Local settings are only effective if the server is not forcing false!";
					default = 1;
				};
				class X39_MedSys_var_Display_Overlay_AllowLegView: propertyBase {
					variable = "X39_MedSys_var_Display_Overlay_AllowLegView";
					display = "Overlay >> AllowLegView";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "Enable/Disable specific overlay part<br />Local settings are only effective if the server is not forcing false!";
					default = 1;
				};
				class X39_MedSys_var_Display_Overlay_AllowTourniquetView: propertyBase {
					variable = "X39_MedSys_var_Display_Overlay_AllowTourniquetView";
					display = "Overlay >> AllowTourniquetView";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "Enable/Disable specific overlay part<br />Local settings are only effective if the server is not forcing false!";
					default = 1;
				};
				class X39_MedSys_var_Display_Overlay_AllowMorphineView: propertyBase {
					variable = "X39_MedSys_var_Display_Overlay_AllowMorphineView";
					display = "Overlay >> AllowMorphineView";
					type = TYPE_VALUE;
					valueType = "SCALAR";
					description = "Enable/Disable specific overlay part<br />Local settings are only effective if the server is not forcing false!";
					default = 1;
				};
				class X39_MedSys_var_Settings_Overlay_Blood_PictureValues: propertyBase {
					variable = "X39_MedSys_var_Settings_Overlay_Blood_PictureValues";
					display = "Overlay >> Bleeding - Blood picture values";
					type = TYPE_VALUE;
					valueType = "ARRAY";
					description = "Options for the blood status pic. Usualy you can leave this like it is shipped<br />array position 0: Needed blood for the first blood pic in % (max value 1 min value 0)<br />array position 1: Needed blood for the second blood pic in % (max value 1 min value 0)<br />array position 2: Needed blood for the third blood pic in % (max value 1 min value 0)<br />array position 3: Needed blood for the fourth blood pic in % (max value 1 min value 0)<br />array position 4: Needed blood for the fifth blood pic in % (max value 1 min value 0)";
					default[] = {1, 0.8, 0.6, 0.4, 0.2};
				};
			};
		};
	};
};