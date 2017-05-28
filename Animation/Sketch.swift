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
        let sierpinski : VisualizedLindenmayerSystem
    // Create visualizations of other systems
    let largeKochIsland : VisualizedLindenmayerSystem
    
    let VLsystems : [VisualizedLindenmayerSystem]
    
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        file = SharedFileParser(path: "/Users/student/Desktop/test.txt")
        
        VLsystems = file.parseFile()
        
//        print(file.parseFile())
        // Set up a Koch snowflake
        kochSnowflake = LindenmayerSystem(angle: 120,
                                          axiom: "F",
                                          rules: ["F":["F[+F]F"]],
                                          generations: 5)
        
        sierpinski = VisualizedLindenmayerSystem(with: kochSnowflake, length: 200, lineReduction: 2, width: 1, widthReduction: 1, x: 50, y: 50, direction: 0)
        // Set up a Koch Island
        kochIsland = LindenmayerSystem(angle: 20,
                                       axiom: "1F",
                                       rules: ["F":["1X[++1F][+1F][-1F][--1F]"], "X" : ["1X1X"]],
                                       generations: 5)
        largeKochIsland = VisualizedLindenmayerSystem(with: kochIsland, length: 200, lineReduction: 2, x: 350, y: 20, direction: 90, colours: ["1" : Colour(hue: 132, saturation: 3, brightness: 98)])
        // The frame rate can be adjusted; the default is 60 fps
        
        // "Faster, Faster, until the thrill of speed overcomes the fear of death." Hunter S. Thompson
        
        canvas.framesPerSecond = 120
        // "FFFFF[-------FFFF]F[------FFF][-------FFF][+++FF]F[-----FF]F"
        triangle = LindenmayerSystem(angle: 15, axiom: "1F",rules: ["F":["1/1X+F[+++F]","1/1Y-F","1/1F1F[---1F]"], "X": ["1/1F-1X","1/1X1X[+++1F--1F]"], "Y" : ["1/1F+1Y[--F]","1/1F+1Y[++1F-1F]","1/1Y1Y"]], generations: 10)
                
        vistriangle = VisualizedLindenmayerSystem(with: triangle, length: 100, lineReduction: 1.7, width: 2, widthReduction: 1, x: 250, y: 500, direction: 270,colours: ["1": Colour(hue: 206,saturation: 14, brightness: 97)])
        
//        canvas.render(system: vistriangle, generation: 8)
//        for (i, _) in largeKochIsland.word.enumerated()
//        {
//            print(largeKochIsland.word[i])
//        }
        canvas.framesPerSecond = 120
        
        //print(VLsystems[1].rules)
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Render the current system
        canvas.renderAnimatedSystems(systems: [VLsystems[0]], generations: [5])
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
