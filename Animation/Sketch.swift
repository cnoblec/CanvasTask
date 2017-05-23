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
    let triangle : LindenmayerSystem
    
    // Create the visualizations of the L-sys
    let vistriangle : VisualizedLindenmayerSystem
    
    
    
    // Create visualizations of other systems
    let largeKochIsland : VisualizedLindenmayerSystem
    
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
        largeKochIsland = VisualizedLindenmayerSystem(with: kochIsland, length: 10, lineReduction: 4, x: 300, y: 200, direction: 0, colours: ["1":Colour(hue: 240, saturation: 80, brightness: 90)])
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 120
        // "FFFFF[-------FFFF]F[------FFF][-------FFF][+++FF]F[-----FF]F"
        triangle = LindenmayerSystem(angle: 15, axiom: "F",rules: ["F":["XXXXX[-------XXFF]X[------FFF][-------XFF][+++FF]F[-----FF]F"], "X": ["XXXXXX"]], generations: 3)
                
        vistriangle = VisualizedLindenmayerSystem(with: triangle, length: 200, lineReduction: 6, width: 1, widthReduction: 1, x: 220, y: 20, direction: 90, colours: ["1":Colour(hue: 240, saturation: 80, brightness: 90)])
        
//        canvas.render(system: vistriangle, generation: 8)
        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Render the current system
        canvas.renderAnimatedSystems(systems: [vistriangle], generations: [3])
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
