//
//  MatchListViewController.swift
//  Meet
//
//  Created by Caelan Dailey on 7/24/17.
//  Copyright © 2017 Caelan Dailey. All rights reserved.
//
import UIKit
import Foundation


class ColorSwitchViewController: UIViewController {
    
    let colorService = ColorServiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorService.delegate = self
    }
}

extension ColorSwitchViewController : ColorServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: ColorServiceManager, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            
        }
    }
    
    // Did receive data
    func colorChanged(manager: ColorServiceManager, colorString: [String: String]) {
        OperationQueue.main.addOperation {
            
            
            
        }
    }
    
}
