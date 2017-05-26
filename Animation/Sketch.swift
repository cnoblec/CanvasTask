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
    
    let file : SharedFileParser
    
    // Create the visualizations of the L-sys
    let vistriangle : VisualizedLindenmayerSystem
        
    // Create visualizations of other systems
    let largeKochIsland : VisualizedLindenmayerSystem
    
    let Lsystems : [VisualizedLindenmayerSystem]
    
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        file = SharedFileParser(path: "/Users/student/Desktop/test.txt")
        
        Lsystems = file.parseFile()
        
//        print(file.parseFile())
        // Set up a Koch snowflake
        kochSnowflake = LindenmayerSystem(angle: 60,
                                          axiom: "F++F++F",
                                          rules: ["F":["F-F++F-F"]],
                                          generations: 5)
        
        // Set up a Koch Island
        kochIsland = LindenmayerSystem(angle: 20,
                                       axiom: "F",
                                       rules: ["F":["X[++F][+F][-F][--F]"], "X" : ["XX"]],
                                       generations: 5)
        largeKochIsland = VisualizedLindenmayerSystem(with: kochIsland, length: 200, lineReduction: 2, x: 150, y: 20, direction: 90)
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 120
        // "FFFFF[-------FFFF]F[------FFF][-------FFF][+++FF]F[-----FF]F"
        triangle = LindenmayerSystem(angle: 10, axiom: "F",rules: ["F":["1/FF+F","1/F[F+FF]","1/F-FF"], "X": ["XX"]], generations: 10)
                
        vistriangle = VisualizedLindenmayerSystem(with: triangle, length: 200, lineReduction: 2, width: 1, widthReduction: 1, x: 300, y: 200, direction: 90)
        
//        canvas.render(system: vistriangle, generation: 8)
        
//        for (i, _) in largeKochIsland.word.enumerated()
//        {
//            print(largeKochIsland.word[i])
//        }
        canvas.framesPerSecond = 60
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Render the current system
        canvas.renderAnimatedSystems(systems: [vistriangle], generations: [1])
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
