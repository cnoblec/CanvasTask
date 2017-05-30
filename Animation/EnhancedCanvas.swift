import Foundation

public class EnhancedCanvas : Canvas {
    
    public func render(system s : VisualizedLindenmayerSystem) {
        
        render(system: s, generation: s.n)
        
    }
    
    public func render(system : VisualizedLindenmayerSystem, generation : Int) {
        
        // Verify that generation that was asked to be rendered actually exists
        var generation = generation
        if generation > system.n {
            generation = system.n
        }
        
        // Change the line length
        system.currentLength = Float(Double(system.initialLength) / pow(Double(system.lineReduction), Double(generation)) )
        
        system.currentWidth = Float(Double(system.initialWidth) / pow(Double(system.widthReduction),Double(generation)))
        
        // Render the word
        self.saveState()
        self.translate(byX: system.x, byY: system.y) // Move turtle to starting point
        self.rotate(by: Degrees(system.direction))
        for c in system.word[generation].characters {
            interpret(character: c, forThis: system)
        }
        self.restoreState()

    }
    
    public func renderAnimated(system : VisualizedLindenmayerSystem, generation : Int) {
        
        // Verify that generation that was asked to be rendered actually exists
        var generation = generation
        if generation > system.n {
            generation = system.n
        }
        
        // Things to do at start of L-system animation...
        if system.animationPosition == 0 {
            
            // Change the line length
            system.currentLength = Float(Double(system.initialLength) / pow(Double(system.lineReduction), Double(generation)) )

            system.currentWidth = Float(Double(system.initialWidth) / pow(Double(system.widthReduction),Double(generation)))
            
            // Move turtle to starting point
            self.translate(byX: system.x, byY: system.y) // Move turtle to starting point
            self.rotate(by: Degrees(system.direction))
        }
        
        // Don't run past end of the word
        if system.animationPosition < system.word[generation].characters.count {
            
            // Get the index of the next character
            let index = system.word[generation].index(system.word[generation].startIndex, offsetBy: system.animationPosition)

            // Get the next character
            let c = system.word[generation][index]
            
            // Render the character
            interpret(character: c, forThis: system)

            // Move to next character in word
            system.animationPosition += 1

        }
        
    }
    
    public func renderAnimatedSystems(systems : [VisualizedLindenmayerSystem], generations : [Int])
    {
        for (i,system) in systems.enumerated()
        {
            // Verify that generation that was asked to be rendered actually exists
            self.lineColor = system.currentColour
            var generation : Int
            if generations.count > i
            {
                generation = generations[i]
            } else {
                generation = generations[generations.count - 1]
            }
            if generation > system.n {
                generation = system.n
            }
            
            // Things to do at start of L-system animation...
            if system.animationPosition == 0 {
                
                // Change the line length
                system.currentLength = Float(Double(system.initialLength) / pow(Double(system.lineReduction), Double(generation)) )
                system.currentWidth = Float(system.initialWidth) / pow(Float(system.widthReduction),Float(generation))
                system.currentAngle = Degrees(system.direction)
            }
            
            // Don't run past end of the word
            if system.animationPosition < system.word[generation].characters.count {
                
                // Get the index of the next character
                let index = system.word[generation].index(system.word[generation].startIndex, offsetBy: system.animationPosition)
                
                // Get the next character
                let c = system.word[generation][index]
                
                // Render the character
                interpret(character: c, forThis: system)
                
                // Move to next character in word
                system.animationPosition += 1
                
            }
        }
    }
    
    func interpret(character : Character, forThis system : VisualizedLindenmayerSystem) {
        // let defaultColour = Color(hue: 0, saturation: 0, brightness: 0, alpha: 100)
        
        // update the x and y positoins using trig to find how far they move
        let updatedX = Float(CGFloat(system.x) + cos( system.currentAngle * CGFloat(M_PI)/180) * CGFloat(system.currentLength))
        let updatedY = Float(CGFloat(system.y) + sin(system.currentAngle * CGFloat(M_PI)/180) * CGFloat(system.currentLength))
                
        // Interpret each character of the word
        let unicodeScalar = String(character).unicodeScalars
        
        switch character {
        case "+":
            // Turn left
            system.currentAngle += system.angle
        case "-":
            // Turn right
            system.currentAngle -= system.angle
        case "1","2","3","4","5","6":
            if let newColor = system.colours[String(character)] {
                self.lineColor = Color(hue: newColor.hue, saturation: newColor.saturation, brightness: newColor.brightness, alpha: 100)
            }
            system.currentColour = self.lineColor
        case "[":
            system.infoStack.append(VisualizedLindenmayerSystem.sysInfo(x: Float(system.x), y: Float(system.y), angle: system.currentAngle))
        case "]":
            system.x = (system.infoStack.last?.x)!
            system.y = (system.infoStack.last?.y)!
            system.currentAngle = (system.infoStack.last?.angle)!
            system.infoStack.removeLast()
        default:
            // Do nothing for any another character in the word
            if unicodeScalar[unicodeScalar.startIndex].value >= 65 && unicodeScalar[unicodeScalar.startIndex].value <= 90
            {
                self.drawLine(fromX: system.x, fromY: system.y, toX: updatedX, toY: updatedY, lineWidth: Int(system.initialWidth))
                system.x = updatedX
                system.y = updatedY
            }
            if unicodeScalar[unicodeScalar.startIndex].value >= 97 && unicodeScalar[unicodeScalar.startIndex].value <= 122
            {
                system.x = updatedX
                system.y = updatedY
            }
        }
    }
}
