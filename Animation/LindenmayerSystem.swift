import Foundation

public class LindenmayerSystem
{
    // Set up required information
    var angle : Degrees                 // rotation amount for turtle (degrees)
    var axiom : String
    var rules : [Character : [String]]
    var n : Int                         // number of times the production rule is applied
    var word : [String] = []            // the word that will be rendered
    // is rendered with an animation, step by step
    
    public init(angle : Degrees,
                axiom : String,
                rules : [Character : [String]],
                generations : Int) {
        
        // Initialize stored properties
        self.angle = angle
        self.axiom = axiom
        self.rules = rules
        self.n = generations
        self.word.append(axiom)   // The first word is the axiom
        
        // Apply the production rule
        applyRules()
    }
    
    public init(with system : LindenmayerSystem) {
        
        // Initalize stored properties
        self.angle = system.angle
        self.axiom = system.axiom
        self.rules = system.rules
        self.n = system.n
        self.word.append(axiom)   // The first word is the axiom
        
        // Apply the production rule
        applyRules()
    }
    
    func applyRules() {
        
        // See if word needs to be re-written
        if n > 0 {
            
            // Apply the production rule "n" times
            for i in 1...n {
                
                // Create a new word
                var newWord = ""
                
                // Inspect each character of existing word
                for character in word[i - 1].characters {
                    
                    let unicodeScalar = String(character).unicodeScalars
                    switch character {
                    case "+", "-", "[", "]","1","2","3","4","5","6","7","8","9":
                        newWord.append(character)
                    default:
                        if unicodeScalar[unicodeScalar.startIndex].value >= 65 && unicodeScalar[unicodeScalar.startIndex].value <= 90 || unicodeScalar[unicodeScalar.startIndex].value >= 97 && unicodeScalar[unicodeScalar.startIndex].value <= 122
                        {
                            if let successor = rules[character] {
                                if successor.count > 1
                                {
                                    newWord.append(randSuccesor(successors: successor))
                                } else {
                                    newWord.append(successor[0])
                                }
                            }
                        }
                    }
                    // just copy what's in the existing word to the new word
                }
                
                // Add the re-written word to the system
                word.append(newWord)
                
            }
            
        }
        
    }
    
}
