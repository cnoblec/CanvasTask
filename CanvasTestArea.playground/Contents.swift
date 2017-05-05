/*:
 
 # Canvas
 
 The Canvas class provides methods that allow basic shapes to be drawn on a Cartesian plane.
 
 - callout(Experiment):
 
 Uncomment line 27 so that the axes of the plane are automatically drawn.
 
 Where is the origin?
 
 In what direction do values on the *x* and *y* axes increase?
 
 */
// These are some required statements to make this playground work.
import Cocoa
import PlaygroundSupport

// Create a new canvas
let canvas = EnhancedCanvas(width: 500, height: 500)

// Set up a Koch snowflake
let kochSnowflake = LindenmayerSystem(length: 270,
                                      reduction: 3,
                                      x: 175,
                                      y: 100,
                                      direction: 0,
                                      angle: 60,
                                      axiom: "F++F++F",
                                      rule: "F-F++F-F",
                                      generations: 5)

// Render the system
canvas.render(system: kochSnowflake)

// Set up a Koch Island
let kochIsland = LindenmayerSystem(length: 100,
                                   reduction: 4,
                                   x: 100,
                                   y: 400,
                                   direction: 0,
                                   angle: 90,
                                   axiom: "F-F-F-F",
                                   rule: "F-F+F+FF-F-F+F",
                                   generations: 2)

// Render the system
var character  = "A"
var val = character.unicodeScalars

print(val[val.startIndex].value)
canvas.render(system: kochIsland)
/*:
 
 ## To see output
 
 To see output, ensure that you have enabled the Assistant Editor...
 
 ![assistant-editor](assistant-editor.png "Enable the Assistant Editor")
 
 ... and verify that you have selected the *Timeline* option:
 
 ![timeline-option](timeline-option.png "Show the timeline")
 
 Finally, do not remove the following line of code:
 
 */
PlaygroundPage.current.liveView = canvas.imageView
