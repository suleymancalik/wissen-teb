//
//  ViewController.swift
//  Day4
//
//  Created by Suleyman Calik on 12/10/14.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    
    var shareOptions = [
        ["title" : "Facebook" , "icon" : "facebook"],
        ["title" : "Twitter"  , "icon" : "twiter"],
        ["title" : "E-Mail"   , "icon" : "email"],
        ["title" : "SMS"      , "icon" : "sms"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    // MARK: - CollectionView
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shareOptions.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("ShareCell", forIndexPath: indexPath) as ShareCell
        
        var shareOption = shareOptions[indexPath.item] as Dictionary
        cell.lblTitle.text = shareOption["title"]
        cell.icon.image = UIImage(named:shareOption["icon"]!)
        
        return cell
    }


}








