//
//  PeersView.swift
//  Meet
//
//  Created by Caelan Dailey on 6/19/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import Foundation
import UIKit

class PeersCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    let itemsPerSection = 3
    
    
    var images: [UIImage] = [] {
        didSet{
           reloadData()
           setNeedsDisplay()
        }
    }
    
    var users: [User] = [] {
        didSet{
           reloadData()
           setNeedsDisplay()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return itemsPerSection
        //return 12
        return itemsPerSection
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (users.count/itemsPerSection) + 1
        //return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("loading cell~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! ImageCell
        
        print(indexPath.row + (indexPath.section*itemsPerSection))
        
        let position = indexPath.row + (indexPath.section*itemsPerSection)
        if(position < users.count) {
            
            let user = users[position]
            cell.imageView.image = user.image
            cell.nameLabel.text = user.name
            cell.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print(indexPath.row + (indexPath.section*itemsPerSection))
        
        let cell = self.cellForItem(at: indexPath) as! ImageCell
        let newCell = ImageCell()
        newCell.imageView = cell.imageView
        newCell.frame = CGRect(x:cell.frame.origin.x, y: cell.frame.origin.y, width: cell.frame.width, height: cell.frame.height)
        animateImageView(imageView: newCell.imageView)
    }
    
    let blackBackgroundView = UIView()
    let zoomImageView = UIImageView()
    var statusImageView: UIImageView?
    let tabBarCoverView = UIView()
    var navBarCoverView = UIView()
    
    func animateImageView(imageView: UIImageView) {
        
      self.statusImageView = imageView
        
        if var startingFrame = imageView.superview?.convert(imageView.frame, to: nil){
            
            startingFrame = CGRect(x: startingFrame.origin.x, y: startingFrame.origin.y, width: startingFrame.width, height: startingFrame.height)
            imageView.alpha = 0
            
            blackBackgroundView.frame = self.frame
            blackBackgroundView.backgroundColor = UIColor.black
            blackBackgroundView.alpha = 0
            self.addSubview(blackBackgroundView)
            
            navBarCoverView.frame = CGRect(x: 0, y: 0, width: 1000, height: 20+44)
            navBarCoverView.backgroundColor = UIColor.black
            navBarCoverView.alpha = 0
            
            if let keyWindow =  UIApplication.shared.keyWindow  {
                keyWindow.addSubview(navBarCoverView)
                
                tabBarCoverView.frame = CGRect(x:0, y:keyWindow.frame.height-49 ,width: 1000, height: 49 )
                tabBarCoverView.backgroundColor = UIColor.black
                tabBarCoverView.alpha = 0
                keyWindow.addSubview(tabBarCoverView)
            }
            
            zoomImageView.backgroundColor = UIColor.red
            zoomImageView.frame = startingFrame
            zoomImageView.isUserInteractionEnabled = true
            zoomImageView.image = imageView.image
            zoomImageView.contentMode = .scaleAspectFill
            zoomImageView.clipsToBounds = true
            
            self.addSubview(zoomImageView)
            
            zoomImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.zoomOut)))
            
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: { () -> Void in
                
                let height = (self.frame.width/startingFrame.width) * startingFrame.height
                
                let y = self.frame.height / 2 - height / 2
                
                self.zoomImageView.frame = CGRect(x: 0, y: y, width: self.frame.width, height: height)
                
                self.blackBackgroundView.alpha = 1
                
                self.navBarCoverView.alpha = 1
                
                //self.tabBarCoverView.alpha = 1
                
            }, completion: { (didComplete) -> Void in
                
            })
            
        }
    }
    
    @objc func zoomOut() {
        if var startingFrame = statusImageView?.superview?.convert((statusImageView?.frame)!, to: nil){
            
            startingFrame = CGRect(x: startingFrame.origin.x, y: startingFrame.origin.y, width: startingFrame.width, height: startingFrame.height)
            
            UIView.animate(withDuration: 0.75, animations: {
                () -> Void in
                self.zoomImageView.frame = startingFrame
                self.navBarCoverView.alpha = 0
                self.blackBackgroundView.alpha = 0
                self.tabBarCoverView.alpha = 0
            }, completion: { (didComplete) -> Void in
                self.zoomImageView.removeFromSuperview()
                self.blackBackgroundView.removeFromSuperview()
                self.statusImageView?.alpha = 1
                self.navBarCoverView.removeFromSuperview()
                //self.tabBarCoverView.removeFromSuperview()
            })
        }
    }
    
}
