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
        viewController.user = User(id: "12345", name: name, intro: intro, image: image)
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
    
}
