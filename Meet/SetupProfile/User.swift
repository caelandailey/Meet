//
//  File.swift
//  Meet
//
//  Created by Caelan Dailey on 7/1/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    var id: String
    var name: String
    var location: String
    var intro: String
    var image: UIImage
    
    init(id: String, name: String, location: String, intro: String, image: UIImage) {
        self.id = id
        self.name = name
        self.location = location
        self.intro = intro
        self.image = image
    }
    
}
