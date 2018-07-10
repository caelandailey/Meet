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
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]

       // self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "profileIcon")
        
        //self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "profileIcon")
        
        //self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = goToProfileButton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        self.navigationItem.rightBarButtonItem = goToChatsButton
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white

    }
    
    // Refresh table if buggy
    lazy var goToProfileButton : UIBarButtonItem = {
        let goToProfileButton = UIBarButtonItem()
        goToProfileButton.image = UIImage(named: "profileIcon")
        goToProfileButton.action = #selector(goToProfile)
        goToProfileButton.target = self
        goToProfileButton.style = .plain
        return goToProfileButton
    }()
    
    // Refresh table if buggy
    lazy var goToChatsButton : UIBarButtonItem = {
        let goToChatsButton = UIBarButtonItem()
        goToChatsButton.image = UIImage(named: "chat_icon")
        //goToChatsButton.action = #selector(goToProfile)
        goToChatsButton.target = self
        goToChatsButton.style = .plain
        return goToChatsButton
    }()
    
    @objc
    func goToProfile() {
        navigationController?.pushViewController(SetupProfileViewController(), animated: true)
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
