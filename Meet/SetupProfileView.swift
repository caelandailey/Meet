//
//  SetupProfileView.swift
//  Meet
//
//  Created by Caelan Dailey on 6/16/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import Foundation
import UIKit

class SetupProfileView: UIView {
    
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
        imageButton.titleLabel?.text = "Add Image"
        return imageButton
    }()
    
    let locationField: UITextField = {
        let locationField = UITextField()
        locationField.placeholder = "Your location"
        return locationField
    }()
    
    let introField: UITextField = {
        let introField = UITextField()
        introField.placeholder = "Introduce yourself"
        return introField
    }()
    
    let doneButton: UIButton = {
        let doneButton = UIButton()
        doneButton.titleLabel?.text = "Done"
        return doneButton
    }()
    
    //ADD SUBVIEWS AND TARGETS
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 245/255, alpha: 1.0)
        
        addSubview(titleLabel)
        addSubview(imageButton)
        addSubview(locationField)
        addSubview(introField)
        addSubview(doneButton)
        doneButton.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        imageButton.addTarget(self, action: #selector(imageButtonPressed), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func doneButtonPressed() {
        if let username = usernameTextField.text, let password = passwordTextField.text {
            delegate?.loginButtonPressed(email: username, password: password)
        }
        
    }
    @objc
    func imageButtonPressed() {
        
    }
}
