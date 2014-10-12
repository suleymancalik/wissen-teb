//
//  ViewController.swift
//  Day4
//
//  Created by Suleyman Calik on 12/10/14.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate , UIAlertViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    
    var shareOptions = [
        ["title" : "Facebook" , "icon" : "facebook"],
        ["title" : "Twitter"  , "icon" : "twitter"],
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

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var shareOption = shareOptions[indexPath.item] as Dictionary
        
        let iosVersion = NSString(string:UIDevice.currentDevice().systemVersion).doubleValue
        if iosVersion >= 8 {
            showAlertOnIOS8(shareOption["title"]!)
        }
        else {
            showAlertOnIOS7(shareOption["title"]!)
        }
    }
    
    
    func showAlertOnIOS7(message:String) {
        
        var alert = UIAlertView(title: "Yapilan Secim", message: message, delegate: self, cancelButtonTitle: "Tamam")
        alert.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        println("ALERT kapatildi")
    }
    
    
    func showAlertOnIOS8(message:String) {
        var alertController = UIAlertController(title: "Yapilan Secim", message: message, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        var action = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.Default) { (action:UIAlertAction!) -> Void in
            
            println("ALERT kapatildi")
        }
        alertController.addAction(action)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    

}








