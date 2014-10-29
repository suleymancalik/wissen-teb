//
//  UserProfileVC.swift
//  Day6
//
//  Created by Suleyman Calik on 19.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import CoreData

class UserProfileVC: UIViewController {

    var user:User?
    var context:NSManagedObjectContext?
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtFacebookId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if user?.facebookId != nil && !(user!.facebookId.isEmpty) {
            txtFacebookId.text = user?.facebookId
            showUserImage()
        }
        
    }
    
    //MARK: - Actions
    
    @IBAction func actionLogout(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion:nil)
    }

    @IBAction func actionSave(sender: AnyObject) {
        
        if !txtFacebookId.text.isEmpty {
            user?.facebookId = txtFacebookId.text
            context?.save(nil)
            showUserImage()
        }
    }
    
    @IBAction func actionDeleteAccount(sender: AnyObject) {
        
        context?.deleteObject(user!)
        self.dismissViewControllerAnimated(true, completion:nil)
    }

    
    //MARK: - Image Methods
    
    
    lazy var documentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] as NSURL
        }()
    
    func getCachedImage(imageName:String) -> NSData? {
        var fileURL = documentsDirectory.URLByAppendingPathComponent(imageName)
        var filePath:String! = fileURL.relativePath
        println(filePath)
        
        if NSFileManager.defaultManager().fileExistsAtPath(filePath) {
            var data = NSData.dataWithContentsOfFile(filePath, options: NSDataReadingOptions.DataReadingMappedAlways, error: nil)
            return data
        }
        else {
            return nil
        }
    }
    
    func cacheImage(imageName:String, imageData:NSData) {
        var fileURL = documentsDirectory.URLByAppendingPathComponent(imageName)
        var filePath:String! = fileURL.relativePath
        println(filePath)
        var isCreated = NSFileManager.defaultManager().createFileAtPath(filePath, contents:imageData, attributes:nil)
        println(isCreated)
    }
    
    
    func showUserImage() {
        
        
        if let cachedData = getCachedImage(user!.facebookId) {
            var image = UIImage(data:cachedData)
            self.imgProfile.image = image
        }
        else {
            indicator.startAnimating()
            var urlString = "https://graph.facebook.com/" + user!.facebookId + "/picture?type=square"
            var url = NSURL(string: urlString)
            var request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
                
                if error == nil {
                    var image = UIImage(data:data)
                    self.imgProfile.image = image
                    self.cacheImage(self.user!.facebookId,imageData:data)
                }
                else {
                    println(error)
                }
                self.indicator.stopAnimating()
            })
        }
    }
    
    
    

}
