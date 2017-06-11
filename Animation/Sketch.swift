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
    let cloud1 : VisualizedLindenmayerSystem
    let cloud2 : VisualizedLindenmayerSystem
    
    let sSystems : [VisualizedLindenmayerSystem]
    let sSystemGens : [Int]
    
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        file = SharedFileParser(path: "/Users/student/Desktop/test.txt")
        
        VLsystems = file.parseFile()
        
//        print(file.parseFile())
        // Set up a Koch snowflake
        kochSnowflake = LindenmayerSystem(angle: 120,
                                          axiom: "F+F+F",
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
        triangle = LindenmayerSystem(angle: 15, axiom: "1F",rules: ["F":["1/X+F[+++F]","1/Y-F","1/FF[---F]"], "X": ["1/F-X","1/XX[+++F--F]"], "Y" : ["1/F+Y[--F]","1/F+Y[++F-F]","1/YY"]], generations: 10)
                
        vistriangle = VisualizedLindenmayerSystem(with: triangle, length: 100, lineReduction: 1.7, width: 2, widthReduction: 1, x: 250, y: 500, direction: 270,colours: ["1": Colour(hue: 206,saturation: 14, brightness: 97)])
        
//        canvas.render(system: vistriangle, generation: 8)
//        for (i, _) in largeKochIsland.word.enumerated()
//        {
//            print(largeKochIsland.word[i])
//        }
        canvas.framesPerSecond = 120
        
        //print(VLsystems[1].rules)
        VLsystems[0].initialWidth = 2
        
        cloud1 = VLsystems[2]
        
        cloud2 = VLsystems[2]
        
        canvas.fillColor = Color(hue: 0, saturation: 0, brightness: 0, alpha: 100)
        
        canvas.drawRectangle(bottomLeftX: 0, bottomLeftY: 0, width: canvas.width, height: canvas.height)
        
        canvas.fillColor = Color(hue: 54, saturation: 77, brightness: 95, alpha: 100)

        canvas.drawRectangle(bottomLeftX: 0, bottomLeftY: 0, width: canvas.width, height: canvas.height / 5)
        
        let gradientMaker = Gradient(on: canvas)
        gradientMaker.makeGradient(lowerLeftX: 0, lowerLeftY: 0, from: 240, to: 300, brightness: 50)

        sSystems = [VLsystems[2],VLsystems[3],VLsystems[4],VLsystems[0],VLsystems[5],VLsystems[7],VLsystems[8],VLsystems[9]]
        sSystemGens = [2,2,2,5,5,4,4,4]
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Render the current system
        canvas.renderAnimatedSystems(systems: [largeKochIsland], generations: [4])
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
