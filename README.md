## Changelog
Read below for complete changelog history.

### 18/11/2021
Applied changes from script version:
- The orbital bombardment is now limited to a maximum of 10 strikes per second. Delays shorter than 0.1s will be increased to 0.1s.
- Cleanup for orbital bombardment is now done individually for each strike instead of all at once at the end of the bombardment.
- Orbital bombardment can now be aborted by setting the `tts_beam_stopOrbitalBombardment` variable to true.
- Added a new parameter to the 'Orbital Bombardment' ZEN module which can be used to abort currently active orbital bombardments (using the variable above).

### 09/11/2021
- Cleaned up ZEN functions a bit.
- Redid support for TTS Effects AIO so it should work as intended now.

### 07/11/2021
- Fixed default settings for modules having incorrect types. Beam Strike and Orbital Bombardment modules should not cause errors when using default settings anymore.

### 14/10/2021
Applied changes from script version:
- Removed delay before ZEN module initialisation so modules should appear in Zeus instantly now.
- Cleaned up ZEN related functions to be more consistent with other TTS scripts.
- ZEN modules are now under their own category 'TTS Beam Laser' instead of 'Fire Support' so it is easier to find and doesn't clutter up the other fire support options.
- Fixed an issue that was causing close consecutive beam strikes to destroy the sound emitter from the previous strike.
- Added 'blue' colour back in the ZEN module colours list.
- Added a new function `fn_orbitalBombardment` and a complementary ZEN module because overkill is underrated.

Mod version specific changes:
- Renamed 'TTS Beam' category to 'TTS Beam Laser' for consistency.
- Added 'Orbital Bombardment' editor module.

### 14/10/2021
Applied changes from script version:
- Added stringtable support to allow the script to be translated. If you are willing to help translate the script into another language, contact me in my Discord!

### 09/10/2021
- Added compatibility for upcoming AIO mod.

### 12/07/2021
Applied changes from script version:
- Removed redundant Achilles code.
- Added paramater to script/modules to enable/disable damage from the beam.
- Added icon for beam strike module.

### 22/02/2021
- Initial upload.
