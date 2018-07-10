//
//  NavigationController.swift
//  Meet
//
//  Created by Caelan Dailey on 7/9/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.backgroundColor = UIColor(red: 0/256, green: 128/256, blue: 128/256, alpha: 1.0)
        navigationBar.barTintColor = UIColor(red: 0/256, green: 128/256, blue: 128/256, alpha: 1.0)
        navigationBar.isTranslucent = false
    }
    
    override init(rootViewController: UIViewController) {
        
        
        
        super.init(rootViewController: rootViewController)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
