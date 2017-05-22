import Foundation

// Filename constant
// NOTE: Must adjust path for your system
let pathToFile = "/Users/russellgordon/Desktop/example.txt"

// Open an output file for writing, overwriting any existing data
guard let writer = LineWriter(path: pathToFile, appending: false) else {
    print("Cannot open output file")
    exit(0); // cannot open output file
}

// Iterate over the array of column headers and print each element to the output file
for counter in 1...10 {
    writer.write(line: "This is line \(counter)")
}

// Close the output file
writer.close()

// Open a file for reading and parse each line using the space character as a delimiter
guard let reader = LineReader(path: pathToFile) else {
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

// Now print the contents of the array created
print("======== contents of components array are =======")
for value in components {
    print(value)
}


