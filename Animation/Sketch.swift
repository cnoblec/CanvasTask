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
//    let kochSwirl : LindenmayerSystem
//    var kochConstruction : LindenmayerSystem
    let triangle : LindenmayerSystem
//    let square : LindenmayerSystem
    
    // Create the visualizations of the snowflake
//    let smallKochSnowflake : VisualizedLindenmayerSystem
//    let mediumKochSnowflake : VisualizedLindenmayerSystem
    
    let vistriangle : VisualizedLindenmayerSystem
    
//    let vissquare : VisualizedLindenmayerSystem
    
    
    // Create visualizations of other systems
    let largeKochIsland : VisualizedLindenmayerSystem
//    let mediumKochSwirl : VisualizedLindenmayerSystem
//    let mediumConstruction : VisualizedLindenmayerSystem
    
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        
        // Set up a Koch snowflake
        kochSnowflake = LindenmayerSystem(angle: 60,
                                          axiom: "F++F++F",
                                          rules: ["F":["F-F++F-F"]],
                                          generations: 5)
        
        // Set up a Koch Island
        kochIsland = LindenmayerSystem(angle: 90,
                                       axiom: "F-F-F-F",
                                       rules: ["F":["F-F+F+FF-F-F+F"]],
                                       generations: 5)
        largeKochIsland = VisualizedLindenmayerSystem(with: kochIsland, length: 200, reduction: 2, x: 0, y: 200, direction: 0, colours: ["1":Colour(hue: 240, saturation: 80, brightness: 90)])
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 120
        
        triangle = LindenmayerSystem(angle: 30, axiom: "F",rules: ["F":["1/+F-FF","1/F+FF","1/F-FF"]], generations: 8)
                
        vistriangle = VisualizedLindenmayerSystem(with: triangle, length: 200, reduction: 2, x: 200, y: 0, direction: 90, colours: ["1":Colour(hue: 240, saturation: 80, brightness: 90)])
        
//        canvas.render(system: vistriangle, generation: 8)
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Render the current system
        canvas.renderAnimated(system: vistriangle, generation: 8)
//        canvas.renderAnimated(system: largeKochIsland, generation: 2)
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
