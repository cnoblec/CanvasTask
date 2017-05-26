let data = ["{", "F=1/F-[1+F]F+[2-F]", "F=1/F-[1+F]F+[F]", "F=1/-[1-F]F+[2-F]", "X=1/F[3+FFF]F[1-F]", "}"]

var char = ""
var newIndex = 0

var characters : [Character] = []

var parts : [String] = []
while char != "}"
{
//    parts = data[newIndex].components(separatedBy: "=")
    
    for char in characters
    {
        if Character(parts[0]) == char
        {
            
        } else {
            characters.append(char)
        }
    }
    
    char = data[newIndex]
    newIndex += 1
}
