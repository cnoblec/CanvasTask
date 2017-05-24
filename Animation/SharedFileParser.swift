//
//  SharedFileParser.swift
//  Canvas
//
//  Created by Carlos Noble Curveira on 2017-05-24.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

public class SharedFileParser
{
    var filePath : String

    init(path: String)
    {
        self.filePath = path
    }
    
    func parseFile()// -> [VisualizedLindenmayerSystem]
    {
        guard let reader = LineReader(path: filePath) else {
            print("Cannot open input file")
            exit(0); // cannot open file
        }
        
        // Create an empty array of type String
        var components : [String] = []
        
        // Process each line of the input file
        for (number, line) in reader.enumerated() {
            
            // DEBUG
            print("Parsing line \(number)")
            
            // Build an array of each component from the file
            components.append(contentsOf: line.components(separatedBy: " "))
            
        }
        print(components)
    }
}

//// Filename constant
//// NOTE: Must adjust path for your system
//let pathToFile = "/Users/student/Desktop/test.txt"
//
//// Open a file for reading and parse each line using the space character as a delimiter
//guard let reader = LineReader(path: pathToFile) else {
//    print("Cannot open input file")
//    exit(0); // cannot open file
//}
//// Create an empty array of type String
//var components : [String] = []
//
//// Process each line of the input file
//for (number, line) in reader.enumerated() {
//
//    // DEBUG
//    print("Parsing line \(number)")
//
//    // Build an array of each component from the file
//    components.append(contentsOf: line.components(separatedBy: " "))
//
//}
//
//// Now print the contents of the array created
//print("======== contents of components array are =======")
//for value in components {
//    print(value)
//}
