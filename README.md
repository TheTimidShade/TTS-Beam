# Beam Script
Beam script for Arma 3, which calls down a laser strike on the desired object/position.

Now compatible with Achilles/Zeus Enhanced, which allows you to activate the script using a custom module. You will not be able to use this module from Zeus unless one of either Achilles or Zeus Enhanced is loaded.

Demo Video: https://www.youtube.com/watch?v=OPNlwLIzreI&ab_channel=TheTimidShade  
Steam Workshop page: https://steamcommunity.com/sharedfiles/filedetails/?id=2373483475  
Achilles: https://steamcommunity.com/sharedfiles/filedetails/?id=723217262  
Zeus Enhanced: https://steamcommunity.com/sharedfiles/filedetails/?id=1779063631  

Steps for usage:
1. Merge scripts folder with existing scripts folder in mission folder (if it exists).
2. Merge `description.ext` and `initPlayerLocal.sqf` (`initPlayerLocal.sqf` is only necessary if you want to use the beam strike module).
3. Execute `tts_beam_fnc_beam` with the object you want the strike to land on as the first parameter, or place down the module in Zeus to call down a strike above that position.

**IMPORTANT**  
`tts_beam_fnc_beam` needs to be executed on all connected clients AND the server to work correctly in multiplayer. You can do this using triggers or via remoteExec.  
If the module does not appear in the Zeus modules list even after adding `[] spawn tts_beam_fnc_customZeusModules` to `initPlayerLocal.sqf`, you can attempt to re-add it by executing `[] spawn tts_beam_fnc_customZeusModules` from debug console or by using the Achilles/ZEN execute code module.

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

## Changelog
Read below for complete changelog history.

### 05/02/2021
- Tweaked fn_customZeusModules again since it still seemed to be causing a few issues adding modules.

### 05/02/2021
- Adjusted fn_customZeusModules slightly so it should correctly add the modules more reliably.

### 29/01/2021
- Added compatibility for Achilles and Zeus Enhanced. The 'Beam Laser Strike' module can be found under the 'Fire Support' section when either of these mods are loaded and the script is present in the mission file. 
  
**NOTE**: Using the Zeus module still requires the script to have been added to the mission. This means the module will not be present for pre-made missions (e.g. Vanilla Zeus gamemodes). If the module does not show up the list, you can try re-adding it by executing `[] spawn tts_beam_fnc_customZeusModules` from debug console, or using Achilles/ZEN execute code module.
- The beam should now behave as expected when it hits an object before impacting terrain, and will timeout automatically if it gets stuck.

### 25/01/2021
- Initial upload.
