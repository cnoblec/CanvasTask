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
    
    var FProb : probabilities
    
    var ruleSet : [String : [String]]
    
    var probRules : [probabilities]
    
    // Create visualizations of other systems
//    let largeKochIsland : VisualizedLindenmayerSystem
//    let mediumKochSwirl : VisualizedLindenmayerSystem
//    let mediumConstruction : VisualizedLindenmayerSystem
    
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        
        ruleSet = ["F" : ["+F","-F"],"X" : ["+X"]]
        
        FProb = probabilities(predecessor: "F", successor: ["-f"])
        
        // Create a new canvas
        
        let rule1 = probabilities(predecessor: "F", successor: ["+F"])
        let rule2 = probabilities(predecessor: "F", successor: ["-F"])
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        probRules = [rule1, rule2]
        
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
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 120
        
        triangle = LindenmayerSystem(angle: 60, axiom: "F",rules: ["F":["F-F","F+F"]], generations: 7)
        
//        FProb = probabilities(predecessor: "F", successor: [0.5:"+F",0.5:"-F"])
        
        vistriangle = VisualizedLindenmayerSystem(with: triangle, length: 100, reduction: 2, x: 200, y: 300, direction: 0, colours: ["1":Colour(hue: 240, saturation: 80, brightness: 90)],probability: [FProb])

        canvas.render(system: vistriangle, generation: 2)
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Render the current system
        
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
