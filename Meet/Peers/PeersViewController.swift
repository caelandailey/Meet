//
//  PeersViewController.swift
//  Meet
//
//  Created by Caelan Dailey on 6/19/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import Foundation

import UIKit

class PeersViewController: UIViewController {
    
    let colorService = ColorServiceManager()
    
    func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
        //colorService.send(message: messageItem)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        colorService.delegate = self

    }
  
}

extension PeersViewController : ColorServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: ColorServiceManager, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            //self.connectionsLabel.text = "Connections: \(connectedDevices)"
            print(connectedDevices)
            let message = [ // 2
                "id": "1012",
                "name": "Caelan Dailey",
                "intro": "I like dogs",
                "location" : "Utah"
                ]
            self.colorService.send(message: message)
            
            
            //self.colorService.sendImage(img: UIImage(named: "imgTest")!)
        }
    }
    
    func colorChanged(manager: ColorServiceManager, colorString: [String: String]) {
        print(colorString)
    }
    
    func showImage(image: UIImageView) {
        image.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(image)
    }
    
}
