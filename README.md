# TTS Beam Laser
This is a beam laser effect I created for one of my missions. The beam particle effect is based on [ALIAS's gravity script](https://steamcommunity.com/sharedfiles/filedetails/?id=884555116) which you should check out if you like the look of this script. When activated, a beam laser will come from the sky above the target position and obliterate most objects beneath it. The damage/destruction can be disabled if you just want to use the effect.

You can see the script in action in this [demo video](https://www.youtube.com/watch?v=OPNlwLIzreI) or if you'd like to test the script for yourself you can try out the [demo mission](https://steamcommunity.com/sharedfiles/filedetails/?id=2373483475).

This is the script version, a [mod version](https://steamcommunity.com/sharedfiles/filedetails/?id=2393517275) is also available on the Steam Workshop.

### **Features:**
- Customisable beam/debris colour
- Damages/destroys nearby units, vehicles and buildings
- Nearby units can be knocked down by the blast wave
- ACE compatibility
- Designed for multiplayer and tested on dedicated server
- Useable from Zeus via [Zeus Enhanced](https://steamcommunity.com/sharedfiles/filedetails/?id=1779063631)
- Editor module to simplify usage (**Mod version only!**)

**ZEN Modules**:
- Beam Laser Strike
- Orbital Bombardment

**Editor Modules (MOD VERSION ONLY):**
- Beam Laser Strike
- Orbital Bombardment

**For help with troubleshooting, questions or feedback, join my [Discord](https://discord.gg/8Y2ENWQMpK)**

___

### **More information:**
- [Script version install instructions](https://github.com/TheTimidShade/TTS-Beam/wiki/Script-version-install-instructions)
- [Function documentation](https://github.com/TheTimidShade/TTS-Beam/wiki/Function-documentation)

### **License:**
This script is licensed under [Arma Public License No Derivatives (APL-ND)](https://www.bohemia.net/community/licenses/arma-public-license-nd). You can freely use the script in your missions, private or uploaded to the Steam Workshop but you must not use any parts of the script in another mod without my permission.

### **Supported Languages:**
- English  

If you'd like to translate the script into a different language, contact me via my Discord or create a pull request.

### **Credits:**
- ALIAScartoons for the Gravity script, which this script is based off. You can find a collection of his scripts [here](https://steamcommunity.com/workshop/filedetails/?id=1123074587). 
- Killzone_Kid for the forced ragdoll function which this script makes use of. 
- Fess from the [Tiberian Genesis](https://steamcommunity.com/sharedfiles/filedetails/?id=2336555877) mod team, who generously provided me with most of the config required to make this mod work.
- Unwittingrabbit and AlphaAmpersandOmega for the suggestion to allow usage from Zeus.

___

### **Examples:**  
`tts_beam_fnc_beam` **needs to be executed on all connected clients AND the server to work correctly in multiplayer.** You can do this using triggers or via remoteExec.  

Trigger example (trigger must NOT be server only):
```sqf
if (isServer) then {
    [_beamTarget, [1,0.6,0.2], [0.3,0.27,0.15], true] remoteExec ["tts_beam_fnc_beam", 0, false];
};
```

For extra destruction, you can also create a barrage of beam strikes:
```sqf
// the orbital bombardment should only be triggered from the server
if (isServer) then {
    [getPos beamTarget, [1,0.6,0.2], [0.3,0.27,0.15], true, 200, 5, 1, false] spawn tts_beam_fnc_orbitalBombardment; 
};
```
If necessary, the orbital bombardment can be aborted by setting the `tts_beam_stopOrbitalBombardment` variable to true:
```sqf
tts_beam_stopOrbitalBombardment = true;
publicVariable "tts_beam_stopOrbitalBombardment";
```

___

## Changelog
Read below for complete changelog history.

### 24/11/2021
- Fixed 'Disable beam damage' parameter for ZEN modules enabling damage instead of disabling it.

### 22/11/2021
- Fixed typo in stringtable.

### 21/11/2021
- Converted tabs to spaces.
- Added colour picker to 'Beam Laser Strike' and 'Orbital Bombardment' ZEN modules.

### 18/11/2021
- The orbital bombardment is now limited to a maximum of 10 strikes per second. Delays shorter than 0.1s will be increased to 0.1s.
- Cleanup for orbital bombardment is now done individually for each strike instead of all at once at the end of the bombardment.
- Orbital bombardment can now be aborted by setting the `tts_beam_stopOrbitalBombardment` variable to true.
- Added a new parameter to the 'Orbital Bombardment' ZEN module which can be used to abort currently active orbital bombardments (using the variable above).

### 09/11/2021
- Cleaned up ZEN functions a bit.

### 31/10/2021
- Fixed typo in stringtable.

### 26/10/2021
- Removed delay before ZEN module initialisation so modules should appear in Zeus instantly now.
- Cleaned up ZEN related functions to be more consistent with other TTS scripts.
- ZEN modules are now under their own category 'TTS Beam Laser' instead of 'Fire Support' so it is easier to find and doesn't clutter up the other fire support options.
- Fixed an issue that was causing close consecutive beam strikes to destroy the sound emitter from the previous strike.
- Added 'blue' colour back in the ZEN module colours list.
- Added a new function `fn_orbitalBombardment` and a complementary ZEN module because overkill is underrated.

### 14/10/2021
- Added stringtable support to allow the script to be translated. If you are willing to help translate the script into another language, contact me in my Discord!

### 11/10/2021
- Cleaned up README file and improved installation instructions.

### 12/07/2021
- Added custom icon to beam strike module.
- Added parameter to script to enable/disable beam damage.

### 12/04/2021
- Removed Achilles compatibility (no longer supported).

### 13/02/2021
- Removed need for `tts_beam_fnc_customZeusModules` to be run from `initPlayerLocal.sqf`.
- Updated sound classes to use tts prefix.

### 05/02/2021
- Tweaked `tts_beam_fnc_customZeusModules` again since it still seemed to be causing a few issues adding modules.

### 05/02/2021
- Adjusted `tts_beam_fnc_customZeusModules` slightly so it should correctly add the modules more reliably.

### 29/01/2021
- Added compatibility for Achilles and Zeus Enhanced. The 'Beam Laser Strike' module can be found under the 'Fire Support' section when either of these mods are loaded and the script is present in the mission file. 
- The beam should now behave as expected when it hits an object before impacting terrain, and will timeout automatically if it gets stuck.

### 25/01/2021
- Initial upload.
