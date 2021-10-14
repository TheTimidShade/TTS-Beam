class CfgVehicles {
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;
			class Combo;
			class Checkbox;
			class CheckboxNumber;
			class ModuleDescription;
			class Units;
		};
		class ModuleDescription;
	};
	
	class tts_beam_module : Module_F {
		author = "TheTimidShade";
		scope = 1;
		scopeCurator = 1;
		is3DEN = 0;
		displayName = "TheTimidShade's Module";
		vehicleClass = "Modules";
		category = "tts_beam_modules";
	};
	
	class tts_beam_moduleBeamStrike : tts_beam_module {
		scope = 2;
		scopeCurator = 0; // module is not available in Zeus
		isDisposable = 1; // 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
		isGlobal = 1; // 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isTriggerActivated = 1;
		displayName = "$STR_tts_beam_moduleBeamStrike_title";
		icon = "tts_beam\icons\beam_strike.paa"
		category = "tts_beam_modules";
		function = "tts_beam_fnc_moduleBeamStrike";
		
		class Attributes : AttributesBase {
			class beamColour : Edit {
				property = "tts_beam_moduleBeamStrike_beamColour";
				displayName = "$STR_tts_beam_moduleBeamStrike_beamColour";
				tooltip = "$STR_tts_beam_moduleBeamStrike_beamColour_desc";
				defaultValue = "[1,0.6,0.2]";
			};
			class debrisColour : Edit {
				property = "tts_beam_moduleBeamStrike_debrisColour";
				displayName = "$STR_tts_beam_moduleBeamStrike_debrisColour";
				tooltip = "$STR_tts_beam_moduleBeamStrike_debrisColour_desc";
				defaultValue = "[0.3, 0.27, 0.15]";
			};
			class beamDamage : Checkbox {
				property = "tts_beam_moduleBeamStrike_beamDamage";
				displayName = "$STR_tts_beam_moduleBeamStrike_disableBeamDamage";
				tooltip = "$STR_tts_beam_moduleBeamStrike_disableBeamDamage_desc";
				defaultValue = "0";
			};
		};
	};
	
}