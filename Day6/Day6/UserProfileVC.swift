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
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtFacebookId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtFacebookId.text = user?.facebookId
    }

    
    @IBAction func actionLogout(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion:nil)
    }

    @IBAction func actionSave(sender: AnyObject) {
        
        if !txtFacebookId.text.isEmpty {
            user?.facebookId = txtFacebookId.text
            context?.save(nil)
            
//            graph.facebook.com/4/picture?type=square
        }
    }
    
    @IBAction func actionDeleteAccount(sender: AnyObject) {
        
        context?.deleteObject(user!)
        self.dismissViewControllerAnimated(true, completion:nil)
    }


}
