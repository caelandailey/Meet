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
    func doneButtonPressed(name: String, location: String, intro: String, image: UIImage)
    func imageButtonPressed()
}

class SetupProfileView: UIView {
    
    // Variables~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    weak var delegate: SetupProfileViewDelegate?
    
    var imagePicker = UIImagePickerController()
    
    // Objects~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    var userImage: UIImage = {
        let userImage = UIImage()
        return userImage
    }()
    
    var bottomBottonBackground: UIView = {
        let bottomButtonBackground = UIView()
        bottomButtonBackground.backgroundColor = UIColor.white
        return bottomButtonBackground
    }()
    
    var userImageView: UIImageView = {
        let userImageView = UIImageView()
        userImageView.layer.masksToBounds = true
        return userImageView
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
        imageButton.setTitleColor(.darkGray, for: .normal)
        imageButton.backgroundColor = UIColor.white
        return imageButton
    }()
    
    let locationTextField: UITextField = {
        let locationTextField = UITextField()
        locationTextField.placeholder = "Your location"
        return locationTextField
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Name"
        nameLabel.textColor = UIColor.darkGray
        
        return nameLabel
    }()
    
    let introLabel: UILabel = {
        let introLabel = UILabel()
        introLabel.text = "Introduction"
        introLabel.textColor = UIColor.darkGray
        
        return introLabel
    }()
    
    let nameTextField: CustomTextField = {
        let nameTextField = CustomTextField()
        nameTextField.placeholder = "First Name"
        nameTextField.layer.backgroundColor = UIColor.white.cgColor
        //nameTextField.layer.borderWidth = 1
        //nameTextField.autocapitalizationType = UITextAutocapitalizationType.none
        let padding = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
        
        nameTextField.placeholderRect(forBounds: nameTextField.bounds)
        
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        return nameTextField
    }()
    
    let introTextField: CustomTextField = {
        let introTextField = CustomTextField()
        introTextField.placeholder = "Introduce Yourself"
        introTextField.layer.backgroundColor = UIColor.white.cgColor
        //introTextField.layer.borderWidth = 1
        
        let padding = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
        introTextField.placeholderRect(forBounds: introTextField.bounds)
        
        introTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        return introTextField
    }()
    
    let doneButton: UIButton = {
        let doneButton = UIButton()
        doneButton.backgroundColor = UIColor(red: 0/256, green: 128/256, blue: 128/256, alpha: 1.0)
        doneButton.setTitle("Finish", for: .normal)
        doneButton.setTitleColor(UIColor.white, for: .normal)
        
        return doneButton
    }()
    
    let skipButton: UIButton = {
        let skipButton = UIButton()
        
        skipButton.setTitle("Skip", for: .normal)
        skipButton.setTitleColor(UIColor(red: 0/256, green: 108/256, blue: 108/256, alpha: 1.0), for: .normal)
        return skipButton
    }()
    
    // Functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    //ADD SUBVIEWS AND TARGETS
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        self.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
        
        
        
        // Labels
        //addSubview(titleLabel)
        
        // TextFields
        //addSubview(locationTextField)
        addSubview(nameTextField)
        addSubview(introTextField)
        
        addSubview(bottomBottonBackground)
        
        // Buttons
        addSubview(imageButton)
        addSubview(doneButton)
        addSubview(skipButton)
        addSubview(nameLabel)
        addSubview(introLabel)
        
        // Image
        addSubview(userImageView)
        
        // Targets
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        imageButton.addTarget(self, action: #selector(imageButtonPressed), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/10)
        locationTextField.frame = CGRect(x: 0, y: self.frame.height/10, width: self.frame.width, height: self.frame.height/10)
        
        nameTextField.frame = CGRect(x: 0, y: self.frame.width*0.85, width: self.frame.width, height: self.frame.height/10)
        
        introTextField.frame = CGRect(x: 0, y: nameTextField.frame.origin.y + nameTextField.frame.height*1.5, width: self.frame.width, height: self.frame.height*0.175)
        
        doneButton.frame = CGRect(x: self.frame.width*0.515, y: self.frame.height*0.88, width: self.frame.width*0.455, height: self.frame.height*0.10)
        skipButton.frame = CGRect(x: self.frame.width*0.03, y: self.frame.height*0.88, width: self.frame.width*0.455, height: self.frame.height*0.10)
        nameLabel.frame = CGRect(x: 10, y: nameTextField.frame.origin.y - self.frame.height*0.05, width: self.frame.width, height: self.frame.height*0.05)
        introLabel.frame = CGRect(x: 10, y: introTextField.frame.origin.y - self.frame.height*0.05, width: self.frame.width, height: self.frame.height*0.05)
        bottomBottonBackground.frame = CGRect(x: 0, y: self.frame.height*0.86, width: self.frame.width, height: self.frame.height*0.14)
        bottomBottonBackground.layer.borderColor = UIColor.lightGray.cgColor
        
        bottomBottonBackground.layer.borderWidth = 1
        skipButton.layer.cornerRadius = self.frame.height*0.10/4
        doneButton.layer.cornerRadius = self.frame.height*0.10/4
        skipButton.layer.borderWidth = 2
        skipButton.layer.borderColor = UIColor(red: 0/256, green: 128/256, blue: 128/256, alpha: 1.0).cgColor
        
        // FOR ROUNDED
        userImageView.frame = CGRect(x: self.frame.width*0.1, y: self.frame.width*0.025, width: self.frame.width*0.8, height: self.frame.width*0.8)
        //userImageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width*0.8)
        userImageView.layer.cornerRadius = userImageView.frame.width/2
        
        
        
        imageButton.frame = userImageView.frame
        imageButton.layer.cornerRadius = imageButton.frame.width/2
        imageButton.layer.borderWidth = 1
        imageButton.layer.borderColor = UIColor(red: 205/256, green: 205/256, blue: 205/256, alpha: 1.0).cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func doneButtonPressed() {
        if let name = nameTextField.text, let location = locationTextField.text, let intro = introTextField.text {
            print("okk")
            delegate?.doneButtonPressed(name: name, location: location, intro: intro, image: userImage)
        }
        
    }
    @objc
    func imageButtonPressed() {
        print("pressed")
        delegate?.imageButtonPressed()
    }
    
    
    
}
