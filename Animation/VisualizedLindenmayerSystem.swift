//
//  VisualizedLindenmayerSystem.swift
//  Canvas
//
//  Created by Russell Gordon on 5/3/17.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

public class VisualizedLindenmayerSystem : LindenmayerSystem
{
    
    var initialLength : Float               // initial line segment length
    var reduction : Float                   // reduction factor
    var x : Int                             // initial horizontal position of turtle
    var y : Int                             // initial vertical position of turtle
    var direction : Int                     // initial direction turtle faces (degrees)
    var currentLength : Float               // current line segment length
    var animationPosition = 0               // tracks current character being interpreted when system is animated
    var colours : [String : Colour]
    var probability : [probabilities]

    public init(with providedSystem: LindenmayerSystem,
                length: Float,
                reduction: Float,
                x: Int,
                y: Int,
                direction: Int,
                colours : [String : Colour],
                probability: [probabilities])
    {
        // Initialize stored properties
        self.initialLength = length
        self.reduction = reduction
        self.x = x
        self.y = y
        self.direction = direction
        self.currentLength = self.initialLength
        self.colours = colours
        self.probability = probability
        super.init(with: providedSystem)
        
    }
    
    
}
