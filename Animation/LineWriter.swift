//
//  LineWriter.swift
//  Canvas
//
//  Created by Russell Gordon on 5/11/17.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

// Write text file line by line
class LineWriter {
    
    var fileHandle = FileHandle()
    
    init?(path: String, appending : Bool = false) {
        
        // See if we can open the specified path for writing
        if let handle = FileHandle(forWritingAtPath: path) {
            
            // File already exists, get a handle to it
            self.fileHandle = handle
            
        } else {
            
            // File does not exist, so create it
            let fileManager = FileManager.default
            if fileManager.createFile(atPath: path, contents: nil, attributes: nil) {
                
                // Try to get a handle to the newly created file
                guard let handle = FileHandle(forWritingAtPath: path) else {
                    
                    // This really should not happen, as the file was just craeted by the FileManager instance
                    return nil
                }
                
                // Set the handle to the file
                self.fileHandle = handle
                
            }
            
        }
        
        // Truncate (wipe) existing contents of file if requested
        if !appending {
            self.fileHandle.truncateFile(atOffset: 0)
        }
        
    }
    
    func write(line : String, terminator : String = "\n") {
        
        // Move file pointer to end of the file
        fileHandle.seekToEndOfFile()
        
        // Create the line to be written to the file
        let lineToWrite = "\(line)\(terminator)"
        
        // Convert to NSString before writing to file
        if let data = (lineToWrite as NSString).data(using: String.Encoding.utf8.rawValue) {
            // Write the data to the file
            fileHandle.write(data)
        }
        
    }
    
    
    // This must be invoked when we are finished writing to the file
    func close() {
        fileHandle.closeFile()
    }
    
    
}
