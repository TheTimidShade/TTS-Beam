# Beam Script
Beam script for Arma 3, which calls down a laser strike on the desired object/position.

Demo Video: https://www.youtube.com/watch?v=OPNlwLIzreI&ab_channel=TheTimidShade
Steam Workshop page: https://steamcommunity.com/sharedfiles/filedetails/?id=2373483475

Steps for usage:
1. Merge scripts folder with existing scripts folder in mission folder (if it exists).
2. Merge description.ext.
3. Execute tts_beam_fnc_beam with the object you want the strike to land on as the first parameter.

**IMPORTANT**  
tts_beam_fnc_beam needs to be executed on all connected clients AND the server to work correctly in multiplayer. You can do this using triggers or via remoteExec.

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
### 25/01/2021
- Initial upload.
