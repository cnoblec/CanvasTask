//
//  Stack.swift
//  Canvas
//
//  Created by Carlos Noble Curveira on 2017-05-15.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation


public class CustomStack
{
    var stack : [stackInformation]
    
    public init(stack : [stackInformation])
    {
        self.stack = stack
    }
}

public struct stackInformation
{
    var x : Int
    var y : Int
    var angle : Degrees
}

public func pushState()
{
    
}
