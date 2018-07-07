//
//  File.swift
//  Meet
//
//  Created by Caelan Dailey on 7/1/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import Foundation
import UIKit

/*
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
*/

class User: NSObject, NSCoding {
    var id: String!
    var name: String!
    var location: String!
    var intro: String!
    var image: UIImage!
    
    convenience init(id: String, name: String, location: String, intro: String, image: UIImage) {
        self.init()
        self.id = id
        self.name = name
        self.location = location
        self.intro = intro
        self.image = image
    }
    
    // The initializer init(coder:) is required by NSCoding protocol
    required convenience init(coder aDecoder: NSCoder) {
        self.init()

        self.id = aDecoder.decodeObject(forKey: "id") as! String
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.location = aDecoder.decodeObject(forKey: "location") as! String
        self.intro = aDecoder.decodeObject(forKey: "intro") as! String
        self.image = aDecoder.decodeObject(forKey: "image") as! UIImage
    }
    
    // The instance method encode(with:) is required by NSCoding protocol
    func encode(with anEncoder: NSCoder) {
        if let id = id {
            anEncoder.encode(id, forKey: "id")
        }
        if let name = name {
            anEncoder.encode(name, forKey: "name")
        }
        if let location = location {
            anEncoder.encode(location, forKey: "location")
        }
        if let intro = intro {
            anEncoder.encode(intro, forKey: "intro")
        }
        if let image = image {
            anEncoder.encode(image, forKey: "image")
        }
    }
}
