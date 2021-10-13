# TTS Beam Laser Script
Beam Laser script for Arma 3, which calls down a laser strike on the desired object/position.

A [mod version](https://steamcommunity.com/sharedfiles/filedetails/?id=2393517275) is also available on the Steam Workshop.

**FEATURES:**
- Customisable beam/debris colour
- Damages/destroys nearby units, vehicles and buildings
- Nearby units can be knocked down by the blast wave
- ACE compatibility
- Designed for multiplayer and tested on dedicated server
- Compatible with Zeus Enhanced
- Editor module to simplify usage (**Mod version only!**)

[Zeus Enhanced](https://steamcommunity.com/sharedfiles/filedetails/?id=1779063631) is required to use the module from Zeus.

You can see the script in action in this [demo video](https://www.youtube.com/watch?v=OPNlwLIzreI) or try out the [demo mission](https://steamcommunity.com/sharedfiles/filedetails/?id=2373483475) yourself.


**INTALLATION INSTRUCTIONS:**
1. Download the script files via the green 'Code' button in the top right. Extract the ZIP file somewhere easily accessible.
2. Open your mission folder. You can do this from the 3den Editor using (Scenario > Open Scenario Folder).
3. Copy the 'scripts' folder into your mission folder.
4. If you do not already have a `description.ext` file in your mission, copy it into your mission folder. If you already have one, copy the contents of my `description.ext` into yours. Any 'CfgSomething' classes need to be merged together into one.
e.g.
```cpp
// from TTS Cloak
class CfgFunctions
{
    #include "scripts\tts_cloak\cfgFunctions.hpp"
}
```
and
```cpp
// from TTS Beam Laser
class CfgFunctions
{
    #include "scripts\tts_beam\cfgFunctions.hpp"
}
```
should become
```cpp
// what CfgFunctions should look like when using both
class CfgFunctions
{
    #include "scripts\tts_cloak\cfgFunctions.hpp"
    #include "scripts\tts_beam\cfgFunctions.hpp"
}
```

5. Done! You can now trigger a beam strike using `tts_beam_fnc_beam` with the object you want the strike to land on as the first parameter (see below for examples). If you would rather use Zeus Enhanced, you can use the Zeus module instead.

**EXAMPLES:**  
`tts_beam_fnc_beam` **needs to be executed on all connected clients AND the server to work correctly in multiplayer.** You can do this using triggers or via remoteExec.  

Trigger example (trigger must NOT be server only):
```sqf
// beam is called down above object 'beamTarget' with default beam and debris colour
[beamTarget] spawn tts_beam_fnc_beam; 
```
Trigger example (with optional colour params):
```sqf
// beam is called down above object 'beamTarget' with green laser and white debris (snow environment)
[beamTarget, [0,0.5,0], [1,1,1]] spawn tts_beam_fnc_beam; 
```
Code example:
```sqf
// make sure if using this method, this code is run only on the server or host client, otherwise there will be duplication
[beamTarget, [0,0.5,0], [1,1,1]] remoteExec ["tts_beam_fnc_beam", 0, false];
```
___

## Changelog
Read below for complete changelog history.

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
