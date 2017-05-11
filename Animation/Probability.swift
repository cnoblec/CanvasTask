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

func randSuccesor(rules: [String]) -> String
{
    
    let random = Int(arc4random_uniform(UInt32((rules.count))))
    
    return rules[random]
}
