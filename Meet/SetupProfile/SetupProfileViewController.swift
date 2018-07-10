//
//  SetupProfileViewController.swift
//  Meet
//
//  Created by Caelan Dailey on 7/24/17.
//  Copyright © 2017 Caelan Dailey. All rights reserved.
//

import Foundation
import UIKit

class SetupProfileViewController: UIViewController, SetupProfileViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    var imagePicker = UIImagePickerController()
    
    private var viewHolder: SetupProfileView {
        return view as! SetupProfileView
    }
    
    func doneButtonPressed(name: String, intro: String, image: UIImage) {
        let viewController = PeersViewController()
        let user = User(id: "12345", name: name, intro: intro, image: image)
        saveData(user: user)
        viewController.user = user
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // Loads the view
    override func loadView() {
        
        view = SetupProfileView()

    }
    
    func imageButtonPressed() {
        
       print("here")
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            print("Button capture")
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationItem.title = "Profile"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]

        imagePicker.delegate = self
        viewHolder.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    
        
        viewHolder.userImageView.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
    private static let entriesEncoder: JSONEncoder = {
        let entriesEncoder = JSONEncoder()
        entriesEncoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        return entriesEncoder
    }()
    
    // Codable loaddata
    private func loadData() -> User? {
        var loadedData: User?
        
        
        guard
            // get url
            let fileURL: URL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("FinishedDataset.json", isDirectory: false),
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
    
    private func saveData(user: User) {
        
        
        
        guard
            // Get data
            
            let fileURL: URL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("userProfile.json", isDirectory: false)
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
