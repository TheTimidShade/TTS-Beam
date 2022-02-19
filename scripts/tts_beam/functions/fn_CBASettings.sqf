// EFFECTS ////////////////////////////////////////////////////////////////////////////////////////
[
	"tts_beam_vaporiseBodies",
	"CHECKBOX",
	["STR_tts_beam_settings_vaporiseBodies", "STR_tts_beam_settings_vaporiseBodies_desc"],
	["TTS Beam Laser", "STR_tts_beam_settingsCat_effects"],
	true,
	1, // 0 = local, 1 = global, 2 = no overwriting
	{},
	false
] call CBA_fnc_addSetting;

[
	"tts_beam_structureFiresEnabled",
	"CHECKBOX",
	["STR_tts_beam_settings_structureFiresEnabled", "STR_tts_beam_settings_structureFiresEnabled_desc"],
	["TTS Beam Laser", "STR_tts_beam_settingsCat_effects"],
	true,
	1, // 0 = local, 1 = global, 2 = no overwriting
	{},
	false
] call CBA_fnc_addSetting;

[
	"tts_beam_structureFireChance",
	"SLIDER",
	["STR_tts_beam_settings_structureFireChance", "STR_tts_beam_settings_structureFireChance_desc"],
	["TTS Beam Laser", "STR_tts_beam_settingsCat_effects"],
	[0.01, 1, 0.03, 0, true],
	1, // 0 = local, 1 = global, 2 = no overwriting
	{},
	false
] call CBA_fnc_addSetting;

[
	"tts_beam_structureFireMinDuration",
	"SLIDER",
	["STR_tts_beam_settings_structureFireDurationMin", "STR_tts_beam_settings_structureFireDurationMin_desc"],
	["TTS Beam Laser", "STR_tts_beam_settingsCat_effects"],
	[1, 600, 60, 0, false],
	1, // 0 = local, 1 = global, 2 = no overwriting
	{},
	false
] call CBA_fnc_addSetting;

[
	"tts_beam_structureFireMaxDuration",
	"SLIDER",
	["STR_tts_beam_settings_structureFireDurationMax", "STR_tts_beam_settings_structureFireDurationMax_desc"],
	["TTS Beam Laser", "STR_tts_beam_settingsCat_effects"],
	[1, 600, 120, 0, false],
	1, // 0 = local, 1 = global, 2 = no overwriting
	{},
	false
] call CBA_fnc_addSetting;

[
	"tts_beam_createCraters",
	"CHECKBOX",
	["STR_tts_beam_settings_createCraters", "STR_tts_beam_settings_createCraters_desc"],
	["TTS Beam Laser", "STR_tts_beam_settingsCat_effects"],
	true,
	1, // 0 = local, 1 = global, 2 = no overwriting
	{},
	false
] call CBA_fnc_addSetting;

// CLEANUP ////////////////////////////////////////////////////////////////////////////////////////
[
	"tts_beam_cleanupSkeletons",
	"CHECKBOX",
	["STR_tts_beam_settings_cleanupSkeletons", "STR_tts_beam_settings_cleanupSkeletons_desc"],
	["TTS Beam Laser", "STR_tts_beam_settingsCat_cleanup"],
	false,
	1, // 0 = local, 1 = global, 2 = no overwriting
	{},
	false
] call CBA_fnc_addSetting;

[
	"tts_beam_cleanupSkeletonsDelay",
	"SLIDER",
	["STR_tts_beam_settings_cleanupSkeletonsDelay", "STR_tts_beam_settings_cleanupSkeletonsDelay_desc"],
	["TTS Beam Laser", "STR_tts_beam_settingsCat_cleanup"],
	[1, 600, 300, 0, false],
	1, // 0 = local, 1 = global, 2 = no overwriting
	{},
	false
] call CBA_fnc_addSetting;

// MISC ////////////////////////////////////////////////////////////////////////////////////////
[
	"tts_beam_disableImpactFlash",
	"CHECKBOX",
	["STR_tts_beam_settings_disableImpactFlash", "STR_tts_beam_settings_disableImpactFlash_desc"],
	["TTS Beam Laser", "STR_tts_beam_settingsCat_misc"],
	false,
	0, // 0 = local, 1 = global, 2 = no overwriting
	{},
	false
] call CBA_fnc_addSetting;