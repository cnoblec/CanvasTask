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
    
    public struct sysInfo
    {
        var x : Float
        var y : Float
        var angle : Degrees
    }
    
    var initialLength : Float               // initial line segment length
    var reduction : Float                   // reduction factor
    var x : Float                             // initial horizontal position of turtle
    var y : Float                             // initial vertical position of turtle
    var direction : Float                     // initial direction turtle faces (degrees)
    var currentAngle : Degrees              //
    var currentLength : Float               // current line segment length
    var animationPosition = 0               // tracks current character being interpreted when system is animated
    var colours : [String : Colour]
    var lineWidth : Float?
    var widthReduction : Float?
    var infoStack = [sysInfo]()

    public init(with providedSystem: LindenmayerSystem,
                length: Float,
                reduction: Float,
                x: Float,
                y: Float,
                direction: Float,
                colours : [String : Colour])
    {
        // Initialize stored properties
        self.initialLength = length
        self.reduction = reduction
        self.x = x
        self.y = y
        self.direction = direction
        self.currentLength = self.initialLength
        self.colours = colours
        self.currentAngle = Degrees(direction)
        super.init(with: providedSystem)
    }
}
