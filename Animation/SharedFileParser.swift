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
    
    var lsys : LindenmayerSystem = LindenmayerSystem(angle: 60, axiom: "F+F+F", rules: ["F":["F[+F]FF"]], generations: 3)
    
    var lsyss : [VisualizedLindenmayerSystem] = []
    
    init(path: String)
    {
        self.filePath = path
    }
    
    func parseFile() -> [VisualizedLindenmayerSystem]
    {
        guard let reader = LineReader(path: filePath) else {
            print("Cannot open input file")
            exit(0); // cannot open file
        }
        
        // Create an empty array of type String
        var components : [String] = []
        
        // Process each line of the input file
        for (_, line) in reader.enumerated() {
            
            // Build an array of each component from the file
            components.append(contentsOf: line.components(separatedBy: "\r"))
            
        }
        return createSystemsWith(data: components)
    }
    
    func createSystemsWith(data: [String]) -> [VisualizedLindenmayerSystem]
    {
        var author : String = ""
        var description : String = ""
        var x : Float = 0
        var y : Float = 0
        var axiom : String = ""
        var rules : [Character : [String]] = [:]
        var generations : Int = 0
        var direction : Float = 0
        var length : Float = 0
        var reduction : Float = 0
        var width : Float = 0
        var widthReduction : Float = 0
        var angle : Degrees = 0
        var colours : [String : Colour] = [:]
        var ruleFlag = false
        var invalidWidth = false
        
        for (i, string) in data.enumerated()
        {
            let cleanString = string.components(separatedBy: "\n")
//            print(cleanString[0])
            if cleanString[0] == "]" // if we have reached the end of a system add that to an array, and then clear the data
            {
                
                if width != 0 && widthReduction == 0
                {
                    invalidWidth = true
                }
                
                if (author == "" || axiom == "" || description == "" || angle == Degrees(0) || ruleFlag == false || generations == 0 || length == 0 || reduction == 0 || invalidWidth == true)
                {
                    print("you are missing some of the required inputs\nthis L system will not run")
                } else {
                    lsys = LindenmayerSystem(angle: angle, axiom: axiom, rules: rules, generations: generations)
                    //                print("we have reached the end of a system")
                    lsyss.append(VisualizedLindenmayerSystem(with: lsys, length: length, lineReduction: reduction, width: width, widthReduction: widthReduction, x: x, y: y, direction: direction, colours: colours))
                }
                
                x = 0
                y = 0
                axiom = ""
                rules = [:]
                generations = 0
                direction = 0
                length = 0
                reduction = 0
                width = 1
                widthReduction = 1
                angle = 0
                colours = [:]
                ruleFlag = false
                invalidWidth = false
            }
            
            var key = string.components(separatedBy: ":")
            for (i, k) in key.enumerated()
            {
                let clean : [String]
                clean = k.components(separatedBy: "\n")
                key[i] = clean[0]
            }
            switch key[0] {
            case "x":
                x = Float(key[1])!
            case "y":
                y = Float(key[1])!
            case "length":
                length = Float(key[1])!
            case "direction":
                direction = Float(key[1])!
            case "length_reduction":
                reduction = Float(key[1])!
            case "thickness":
                width = Float(key[1])!
            case "thickness_reduction":
                widthReduction = Float(key[1])!
            case "axiom":
                axiom = key[1]
            case "rules":
                ruleFlag = true
                
                var newIndex = i+2
                
                var cleanData = data[newIndex].components(separatedBy: "\n")

                var currentChar = ""
                
                var parts : [String] = []
                
                parts = cleanData[0].components(separatedBy: "=")
                
                var parsedKeys : [Character] = []
                var parsedRules : [String] = []
                
                while currentChar != "}"
                {
                    cleanData = data[newIndex].components(separatedBy: "\n")
                    parts = cleanData[0].components(separatedBy: "=")
                    if parts[0] != "{" && parts[0] != "}"
                    {
                        parsedKeys.append(Character(parts[0]))
                        parsedRules.append(parts[1])
                    }
                    currentChar = data[newIndex]
                    newIndex += 1
                }
                
                for (i,parsedKey) in parsedKeys.enumerated()
                {
                    if (rules[parsedKey] != nil) // if that key exists, add the values
                    {
                        rules[parsedKey]?.append(parsedRules[i])
                    } else {
                        // if the dictionary does not have that key, create it with the corresponding value
                        rules[parsedKey] = [parsedRules[i]]
                    }
                }
                // here we have an array that contains each key that we will need in our rule set
                parts.removeAll()
                parsedKeys.removeAll()
            case "colors":
                var newIndex = i+2
                
                var currentChar = ""
                
                var parts : [String] = []
                
                parts = data[newIndex].components(separatedBy: "=")
                
                var parsedCValues : [Character] = []
                var parsedColours : [String] = []
                
                while currentChar != "}"
                {
                    parts = data[newIndex].components(separatedBy: "=")
                    if parts[0] != "{" && parts[0] != "}"
                    {
                        parsedCValues.append(Character(parts[0]))
                        parsedColours.append(parts[1])
                    }
                    currentChar = data[newIndex]
                    newIndex += 1
                }
                
                for (i,parsedValue) in parsedCValues.enumerated()
                {
                    let arrayOfInfo = parsedColours[i]
                    
                    let hsb = arrayOfInfo.components(separatedBy: ",")
                    
                    let aColour = Colour(hue: Float(hsb[0])!, saturation: Float(hsb[1])!, brightness: Float(hsb[2])!)
                    colours[String(parsedValue)] = aColour
                }
            case "angle":
                angle = Degrees(Float(key[1])!)
            case "generations":
                generations = Int(key[1])!
            case "author":
                author = String(key[1])
            case "description":
                description = String(key[1])
            default: break
            }
            
        }
        
        return lsyss
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
