//
//  FileManager.swift
//  Meet
//
//  Created by Caelan Dailey on 7/9/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import Foundation

class FileHandler {
    
    let fileLocation = "userProfile.json"
    
    // Codable loaddata
    public func loadData() -> User? {
        
        var loadedData: User?
        
        guard
            // get url
            let fileURL: URL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(fileLocation, isDirectory: false),
            let encodedDataset: Data = try? Data(contentsOf: fileURL, options: [])
            
            else {
                return nil  // Return nothing
        }
        do {
            
            if let user = NSKeyedUnarchiver.unarchiveObject(with: encodedDataset) as? User {
                
                loadedData = user
            }
            // try decoding
            
        }
        
        return loadedData
    }
    
    func saveData(user: User) {
        
        
        
        guard
            // Get data
            
            let fileURL: URL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(fileLocation, isDirectory: false)
            else {
                print("failed")
                return
        }
        do {
            // Try to write
            let encodedDataset = NSKeyedArchiver.archivedData(withRootObject: user)
            try encodedDataset.write(to: fileURL, options: [.atomic, .completeFileProtection])
            
        }catch {
            print(error.localizedDescription)
        }
    }
    
}
