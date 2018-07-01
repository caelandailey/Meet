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
    
    func doneButtonPressed(name: String, location: String, intro: String) {
        print("yes")
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
        imagePicker.delegate = self
        viewHolder.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let testView = UIImageView(image: chosenImage)
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.view.addSubview(testView)
        //imageView.image = chosenImage
        
        dismiss(animated: true, completion: nil)
    }
    
}
