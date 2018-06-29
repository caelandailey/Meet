//
//  SetupProfileView.swift
//  Meet
//
//  Created by Caelan Dailey on 6/16/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import Foundation
import UIKit

protocol SetupProfileViewDelegate: AnyObject {
    func doneButtonPressed(name: String, location: String, intro: String)
    func imageButtonPressed()
}

class SetupProfileView: UIView {
    
    // Variables~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    weak var delegate: SetupProfileViewDelegate?
    
    var imagePicker = UIImagePickerController()
    
    // Objects~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    let userImage: UIImage = {
        let userImage = UIImage()
        return userImage
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Create Profile"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 48)
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    let imageButton: UIButton = {
        let imageButton = UIButton()
        imageButton.setTitle("Set Image", for: .normal)
        imageButton.tintColor = .black
        return imageButton
    }()
    
    let locationTextField: UITextField = {
        let locationTextField = UITextField()
        locationTextField.placeholder = "Your location"
        return locationTextField
    }()
    
    let nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "Your Name"
        return nameTextField
    }()
    
    let introTextField: UITextField = {
        let introTextField = UITextField()
        introTextField.placeholder = "Introduce yourself"
        return introTextField
    }()
    
    let doneButton: UIButton = {
        let doneButton = UIButton()
     
        doneButton.setTitle("Done", for: .normal)
        return doneButton
    }()
    
    // Functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    //ADD SUBVIEWS AND TARGETS
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        self.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 245/255, alpha: 1.0)
        
        // Labels
        addSubview(titleLabel)
        
        // TextFields
        addSubview(locationTextField)
        addSubview(nameTextField)
        addSubview(introTextField)
        
        // Buttons
        addSubview(imageButton)
        addSubview(doneButton)
        
        // Targets
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        imageButton.addTarget(self, action: #selector(imageButtonPressed), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/10)
        locationTextField.frame = CGRect(x: 0, y: self.frame.height/10, width: self.frame.width, height: self.frame.height/10)
        introTextField.frame = CGRect(x: 0, y: self.frame.height*2/10, width: self.frame.width, height: self.frame.height/10)
        nameTextField.frame = CGRect(x: 0, y: self.frame.height*3/10, width: self.frame.width, height: self.frame.height/10)
        doneButton.frame = CGRect(x: 0, y: self.frame.height*4/10, width: self.frame.width, height: self.frame.height/10)
        imageButton.frame = CGRect(x: 0, y: self.frame.height*5/10, width: self.frame.width, height: self.frame.height/10)
  
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func doneButtonPressed() {
        if let name = nameTextField.text, let location = locationTextField.text, let intro = introTextField.text {
            print("okk")
            delegate?.doneButtonPressed(name: name, location: location, intro: intro)
        }
        
    }
    @objc
    func imageButtonPressed() {
        print("pressed")
        delegate?.imageButtonPressed()
    }
    
    
    
}
