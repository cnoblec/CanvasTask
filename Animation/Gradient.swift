//
//  Gradient.swift
//  Canvas
//
//  Created by Russell Gordon on 5/26/17.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

class Gradient {
    
    var canvas : Canvas
    
    init(on the : Canvas) {
        canvas = the
    }
    
    /**
     Draws a horizontal gradient from the lower left corner given, from the hue provided to the second hue provided. Will always span entire width of screen.
     
     - parameter lowerLeftX: The x position of the lower left corner.
     - parameter lowerLeftY: The y position of the lower left corner.
     - parameter from: The hue to start from
     - parameter to: The hue to end at
     
     */
    public func makeGradient(lowerLeftX : Int, lowerLeftY : Int, from : Float, to: Float, brightness : Float = 90) {
        
        // Get height of sky
        let height : Float = Float(canvas.height - lowerLeftY)
        
        // Get increment for the hue
        let increment = (from - to) / height
        
        // Set the starting point for the hue
        var currentHue : Float = 0
        if increment > 0 {
            currentHue = from
        } else {
            currentHue = to
        }
        
        // Draw the lines to make a gradient
        for y in stride(from: lowerLeftY, through: canvas.height, by: 1) {
            
            // Set the line color
            canvas.lineColor = Color(hue: currentHue, saturation: 80, brightness: brightness, alpha: 100)
            currentHue += increment
            
            // Draw the line
            canvas.drawLine(fromX: 0, fromY: y, toX: canvas.width, toY: y)
            
        }
        
    }
    
    
}
