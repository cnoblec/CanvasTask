//
//  Sketch.swift
//  Animation
//
//  Created by Russell Gordon on 2015-12-05.
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//

import Foundation

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : EnhancedCanvas
    
    // Create the basic L-systems
    let kochSnowflake : LindenmayerSystem
    let kochIsland : LindenmayerSystem
    let kochSwirl : LindenmayerSystem
    var kochConstruction : LindenmayerSystem
    let triangle : LindenmayerSystem
    let square : LindenmayerSystem
    
    // Create the visualizations of the snowflake
    let smallKochSnowflake : VisualizedLindenmayerSystem
    let mediumKochSnowflake : VisualizedLindenmayerSystem
    
    let vistriangle : VisualizedLindenmayerSystem
    let vissquare : VisualizedLindenmayerSystem
    
    // Create visualizations of other systems
    let largeKochIsland : VisualizedLindenmayerSystem
    let mediumKochSwirl : VisualizedLindenmayerSystem
    let mediumConstruction : VisualizedLindenmayerSystem
    
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        // Create a new canvas
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        // Set up a Koch snowflake
        kochSnowflake = LindenmayerSystem(angle: 60,
                                          axiom: "F++F++F",
                                          rules: ["F":"F-F++F-F"],
                                          generations: 5)
        
        // Visualize this as a small snowflake
        smallKochSnowflake = VisualizedLindenmayerSystem(with: kochSnowflake,
                                                         length: 90,
                                                         reduction: 3,
                                                         x: 120,
                                                         y: 175,
                                                         direction: 0,
                                                         colours: ["1":Colour(hue: 240, saturation: 80,               brightness: 90),
                                                                   "2":Colour(hue: 0, saturation: 80, brightness: 90),
                                                                   "3":Colour(hue: 120, saturation: 80, brightness: 90)])
        
        // Visualize this as a small snowflake
        mediumKochSnowflake = VisualizedLindenmayerSystem(with: kochSnowflake,
                                                          length: 270,
                                                          reduction: 3,
                                                          x: 250,
                                                          y: 300,
                                                          direction: 0,
                                                          colours: ["1":Colour(hue: 240, saturation: 80,               brightness: 90),
                                                                    "2":Colour(hue: 0, saturation: 80, brightness: 90),
                                                                    "3":Colour(hue: 120, saturation: 80, brightness: 90)])
        
        
        // Set up a Koch Island
        kochIsland = LindenmayerSystem(angle: 90,
                                       axiom: "F-F-F-F",
                                       rules: ["F":"F-F+F+FF-F-F+F"],
                                       generations: 5)
        
        // Visualize the Koch Island
        largeKochIsland = VisualizedLindenmayerSystem(with: kochIsland,
                                                       length: 300,
                                                       reduction: 4,
                                                       x: 100,
                                                       y: 400,
                                                       direction: 10,
                                                       colours: ["1":Colour(hue: 240, saturation: 80,               brightness: 90),
                                                                 "2":Colour(hue: 0, saturation: 80, brightness: 90),
                                                                 "3":Colour(hue: 120, saturation: 80, brightness: 90)])
        
        // Set up a Koch Swirl
        kochSwirl = LindenmayerSystem(angle: 90,
                                      axiom: "-F",
                                      rules: ["F":"F+F-F-F+F"],
                                      generations: 4)
        
        // Visualize the Koch Swirl
        mediumKochSwirl = VisualizedLindenmayerSystem(with: kochSwirl,
                                                      length: 300,
                                                      reduction: 3,
                                                      x: 250,
                                                      y: 400,
                                                      direction: 0,
                                                      colours: ["1":Colour(hue: 240, saturation: 80,               brightness: 90),
                                                                "2":Colour(hue: 0, saturation: 80, brightness: 90),
                                                                "3":Colour(hue: 120, saturation: 80, brightness: 90)])

        // Set up another Koch construction
        kochConstruction = LindenmayerSystem(angle: 90,
                                             axiom: "F-F-F-F",
                                             rules: ["F":"FF-F-F-F-F-F+F"],
                                             generations: 3)

        // Visualize this other Koch construction
        mediumConstruction = VisualizedLindenmayerSystem(with: kochConstruction,
                                                         length: 200,
                                                         reduction: 4,
                                                         x: 250,
                                                         y: 350,
                                                         direction: 0,
                                                         colours: ["1":Colour(hue: 240, saturation: 80,               brightness: 90),
                                                                   "2":Colour(hue: 0, saturation: 80, brightness: 90),
                                                                   "3":Colour(hue: 120, saturation: 80, brightness: 90),
                                                                   "4":Colour(hue: 120, saturation: 80, brightness: 90)])
        
        triangle = LindenmayerSystem(angle: 60, axiom: "F++F++F",rules: ["F":"F[++F]F"], generations: 7)
        vistriangle = VisualizedLindenmayerSystem(with: triangle, length: 500, reduction: 2, x: 50, y: 50, direction: 0, colours: ["1":Colour(hue: 240, saturation: 80, brightness: 90)])
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 120
        
        square = LindenmayerSystem(angle: 90, axiom: "F",rules: ["F":"F[X]F","X":"+f-F"], generations: 7)
        
        vissquare = VisualizedLindenmayerSystem(with: square, length: 400, reduction: 3, x: 50, y: 50, direction: 0, colours: ["1":Colour(hue: 240, saturation: 80, brightness: 90)])
        canvas.render(system: vissquare, generation: 2)
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Render the current system
        
        
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
