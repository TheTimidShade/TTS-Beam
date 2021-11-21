/*
    Author: TheTimidShade

    Description:
        Converts colour string into [R,G,B] format

    Parameters:
        0: STRING - Colour string
        
    Returns:
        NONE
*/

params [
    ["_colourString", "", [""]]
];

if (_colourString == "") exitWith {};

switch (_colourString) do {
    case "Red": {[0.5,0,0]};
    case "Orange": {[0.3,0.15,0.1]};
    case "Yellow": {[1,0.9,0]}; 
    case "Green": {[0,0.5,0]};
    case "Blue": {[0,0,0.5]};
    case "Cyan": {[0,0.5,0.5]}; 
    case "Pink": {[1,0,0.6]};
    case "Purple": {[0.5,0,1]};
    case "Mud": {[0.15,0.11,0.08]};
    case "Snow": {[1,1,1]};
    case "Sand": {[1,0.8,0.3]};
    default {[1,1,1]};
};