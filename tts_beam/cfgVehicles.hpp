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
			class BeamColour : Edit {
				property = "tts_beam_moduleBeamStrike_BeamColour";
				displayName = "$STR_tts_beam_moduleBeamStrike_beamColour";
				tooltip = "$STR_tts_beam_moduleBeamStrike_beamColour_desc";
				typeName = "STRING";
				defaultValue = """[1,0.6,0.2]""";
			};
			class DebrisColour : Edit {
				property = "tts_beam_moduleBeamStrike_DebrisColour";
				displayName = "$STR_tts_beam_moduleBeamStrike_debrisColour";
				tooltip = "$STR_tts_beam_moduleBeamStrike_debrisColour_desc";
				typeName = "STRING";
				defaultValue = """[0.3, 0.27, 0.15]""";
			};
			class BeamDamage : Checkbox {
				property = "tts_beam_moduleBeamStrike_BeamDamage";
				displayName = "$STR_tts_beam_moduleBeamStrike_disableBeamDamage";
				tooltip = "$STR_tts_beam_moduleBeamStrike_disableBeamDamage_desc";
				typeName = "BOOL";
				defaultValue = "false";
			};
		};
	};

	class tts_beam_moduleOrbitalBombardment : tts_beam_module {
		scope = 2;
		scopeCurator = 0; // module is not available in Zeus
		isDisposable = 1; // 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
		isGlobal = 0; // 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isTriggerActivated = 1;
		displayName = "$STR_tts_beam_moduleOrbitalBombardment_title";
		icon = "tts_beam\icons\beam_strike.paa"
		category = "tts_beam_modules";
		function = "tts_beam_fnc_moduleOrbitalBombardment";
		
		class Attributes : AttributesBase {
			class BeamColour : Edit {
				property = "tts_beam_moduleOrbitalBombardment_BeamColour";
				displayName = "$STR_tts_beam_moduleBeamStrike_beamColour";
				tooltip = "$STR_tts_beam_moduleBeamStrike_beamColour_desc";
				typeName = "STRING";
				defaultValue = """[1,0.6,0.2]""";
			};
			class DebrisColour : Edit {
				property = "tts_beam_moduleOrbitalBombardment_DebrisColour";
				displayName = "$STR_tts_beam_moduleBeamStrike_debrisColour";
				tooltip = "$STR_tts_beam_moduleBeamStrike_debrisColour_desc";
				typeName = "STRING";
				defaultValue = """[0.3, 0.27, 0.15]""";
			};
			class BeamDamage : Checkbox {
				property = "tts_beam_moduleOrbitalBombardment_BeamDamage";
				displayName = "$STR_tts_beam_moduleBeamStrike_disableBeamDamage";
				tooltip = "$STR_tts_beam_moduleBeamStrike_disableBeamDamage_desc";
				typeName = "BOOL";
				defaultValue = "false";
			};
			class BombardmentRadius : Edit {
				property = "tts_beam_moduleOrbitalBombardment_BombardmentRadius";
				displayName = "$STR_tts_beam_moduleOrbitalBombardment_radius";
				tooltip = "$STR_tts_beam_moduleOrbitalBombardment_radius_desc";
				typeName = "NUMBER";
				defaultValue = "200";
			};
			class StrikeCount : Edit {
				property = "tts_beam_moduleOrbitalBombardment_StrikeCount";
				displayName = "$STR_tts_beam_moduleOrbitalBombardment_strikeCount";
				tooltip = "$STR_tts_beam_moduleOrbitalBombardment_strikeCount_desc";
				typeName = "NUMBER";
				defaultValue = "5";
			};
			class ShotDelay : Edit {
				property = "tts_beam_moduleOrbitalBombardment_ShotDelay";
				displayName = "$STR_tts_beam_moduleOrbitalBombardment_shotDelay";
				tooltip = "$STR_tts_beam_moduleOrbitalBombardment_shotDelay_desc";
				typeName = "NUMBER";
				defaultValue = "5";
			};
			class RainbowMode : Checkbox {
				property = "tts_beam_moduleOrbitalBombardment_RainbowMode";
				displayName = "$STR_tts_beam_moduleBeamStrike_disableBeamDamage";
				tooltip = "$STR_tts_beam_moduleBeamStrike_disableBeamDamage_desc";
				typeName = "BOOL";
				defaultValue = "false";
			};
		};
	};
	
}