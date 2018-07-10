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
    
    var peerService: PeerServiceManager? = nil
    var user: User? = nil
    
    private var peersCollectionView: PeersCollectionView {
        return view as! PeersCollectionView
    }
    
    // Loads the view
    override func loadView() {
        super.loadView()
      
        let layout = UICollectionViewFlowLayout()
        
        let itemInset:CGFloat = 5
        let numberOfSectionItems = 2
        
        layout.sectionInset = UIEdgeInsets(top: itemInset, left: itemInset, bottom: itemInset, right: itemInset)
        let itemHeight = ((self.view.frame.width-itemInset)/CGFloat(numberOfSectionItems))*1.5
        let itemWidth = (self.view.frame.width-itemInset*(CGFloat(numberOfSectionItems)+1))/CGFloat(numberOfSectionItems)
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = itemInset
        layout.scrollDirection = .vertical
        
        let myCollectionView = PeersCollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.dataSource = myCollectionView
        myCollectionView.delegate = myCollectionView
        myCollectionView.register(ImageCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = UIColor(red: 250/255, green: 255/255, blue: 255/255, alpha: 1.0)
        view = myCollectionView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        peerService = PeerServiceManager(ID: (user?.id)!)
        peerService?.delegate = self
        self.navigationItem.title = "Peers"

    }
  
}

extension PeersViewController : PeerServiceManagerDelegate {
    
    func connectedDevicesChanged(manager: PeerServiceManager, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
   
            print(connectedDevices)
            
            if let user = self.user {
                self.peerService?.sendUser(user: user)
            }
        }
    }
    
    func receivedUser(user: User) {
        peersCollectionView.users.append(user)
    }
    
}
