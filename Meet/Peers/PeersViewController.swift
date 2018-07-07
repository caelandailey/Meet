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
    
    //let colorService = ColorServiceManager()
    var colorService: ColorServiceManager? = nil
    var user: User? = nil
    
    private var peersCollectionView: PeersCollectionView {
        return view as! PeersCollectionView
    }
    
    // Loads the view
    override func loadView() {
        super.loadView()
        
        let layout = UICollectionViewFlowLayout()
        
        let itemInset:CGFloat = 3
        let numberOfSectionItems = 3
        
        layout.sectionInset = UIEdgeInsets(top: itemInset, left: itemInset, bottom: 0, right: itemInset)
        let itemHeight = (self.view.frame.width-itemInset)/CGFloat(numberOfSectionItems)
        let itemWidth = (self.view.frame.width-itemInset*(CGFloat(numberOfSectionItems)+1))/CGFloat(numberOfSectionItems)
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = itemInset
        layout.scrollDirection = .vertical
        
        let myCollectionView = PeersCollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = myCollectionView
        myCollectionView.delegate = myCollectionView
        myCollectionView.register(ImageCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = UIColor.white
        view = myCollectionView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        colorService = ColorServiceManager(ID: (user?.id)!)
        colorService?.delegate = self
        //colorService.delegate = self

    }
  
}

extension PeersViewController : ColorServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: ColorServiceManager, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            //self.connectionsLabel.text = "Connections: \(connectedDevices)"
            print(connectedDevices)
            let message = [ // 2
                "id": "1012",
                //"name": self.userName!,
                "name": "bobbbie",
                "intro": "I like dogs",
                "location" : "Utah"
                ]
            //self.colorService?.send(message: message)
            
            
            //self.colorService.sendImage(img: UIImage(named: "websiteIcon")!)
            //self.colorService?.sendImage(img: self.userImage)
            if let user = self.user {
                self.colorService?.sendUser(user: user)
            }
            
            //self.colorService.sendImage(img: self.userImage!)
        }
    }
    
    func colorChanged(manager: ColorServiceManager, colorString: [String: String]) {
        print(colorString)
    }
    
    func showImage(image: UIImageView) {
        image.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        view.addSubview(image)
    }
    
    func receivedImage(image: UIImage) {
        let user = User(id: "bob", name: "dailey", location: "utah", intro: "hello", image: image)
        peersCollectionView.users.append(user)
       // peersCollectionView.images.append(image)
    }
    
    func receivedUser(user: User) {
        peersCollectionView.users.append(user)
    }
    
}
