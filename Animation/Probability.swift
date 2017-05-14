//
//  Probability.swift
//  Canvas
//
//  Created by Carlos Noble Curveira on 2017-05-05.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

public struct probabilities
{
    var predecessor : String
    var successor : [String]
}

func randSuccesor(successors: [String]) -> String
{
    var probArray :[Int] = []
    var addativeArray : [Int] = []
    var max : Int = 0
    var keyArray : [String] = []
    for successor in successors
    {
        let components = successor.components(separatedBy: "/")
        if let IntofString = Int(components[0])
        {
        probArray.append(IntofString)
        }
        keyArray.append(components[1])
    }
    
    for i in probArray
    {
        max += i
        addativeArray.append(max)
    }
    
    let random = Int(arc4random_uniform(UInt32(max+1)))
    var c = 0
    for i in addativeArray
    {
        
        if random <= i
        {
            break
        }
        c += 1
    }
    
    return successors[c]
}