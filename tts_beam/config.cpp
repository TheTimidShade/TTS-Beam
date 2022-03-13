#include "cfgPatches.hpp"
#include "cfgFactionClasses.hpp"
#include "cfgVehicles.hpp"

class CfgFunctions {
    #include "cfgFunctions.hpp"
};

class CfgSounds {	
    #include "cfgSounds.hpp"
};

// Required to register CBA settings
class Extended_PreInit_EventHandlers {
	class tts_beam_CBA_init {
        init = "call compile preprocessFileLineNumbers '\tts_beam\functions\fn_CBASettings.sqf'";
    };
};