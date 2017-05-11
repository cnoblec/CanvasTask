//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var ruleSet = ["F" : ["+F","-F"],"X" : ["+X"]]

var word = "F"

var newWord = ""

//for character in word.characters
//{
//    
//    let unicodeScalar = String(character).unicodeScalars
//    
//    switch character {
//    case "+", "-", "[", "]":
//        newWord.append(character)
//    default:
//        let random = Float(arc4random_uniform(100)) / 100
//        if unicodeScalar[unicodeScalar.startIndex].value >= 65 && unicodeScalar[unicodeScalar.startIndex].value <= 90 || unicodeScalar[unicodeScalar.startIndex].value >= 97 && unicodeScalar[unicodeScalar.startIndex].value <= 122
//        {
//            if ruleSet[character] == ruleSet[character] {
//                newWord.append(ruleSet[character])
//            }
//        }
//    }
//}

let array = ruleSet["F"]

let random = Int(arc4random_uniform(UInt32((array?.count)!)))

//func randSuccesor(rules: [String]) -> String
//{
//}

var example = "1/F+FFFF+F"

example.components(separatedBy: "/")

