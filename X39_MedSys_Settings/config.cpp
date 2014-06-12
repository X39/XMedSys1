class CfgPatches{
	class X39_MedSys_Settings{
         units[] = {};
         weapons[] = {};
         requiredVersion = 1.0;
         requiredAddons[] = {"X39_XLib_Core"};
         author = "X39|Cpt. HM Murdock";
         mail = "killerx29@gmail.com";
	};
};
class CfgSettings {
	class X39 {
		#include "\userconfig\X39\MedSys_ClientConfig.hpp"
		class ServerConfig {
			#include "\userconfig\X39\MedSys_ServerConfig.hpp"
		};
	};
};

#include "propertiesFile.cpp"