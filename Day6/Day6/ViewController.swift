//
//  ViewController.swift
//  Day6
//
//  Created by Suleyman Calik on 19.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var appDelegate:AppDelegate?
    var context:NSManagedObjectContext?
    var userEntity:NSEntityDescription?
    
    
    @IBOutlet weak var txtRegisterUsername: UITextField!
    @IBOutlet weak var txtRegisterPassword: UITextField!
    @IBOutlet weak var txtRegisterPasswordAgain: UITextField!
    @IBOutlet weak var txtLoginUsername: UITextField!
    @IBOutlet weak var txtLoginPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        context = appDelegate?.managedObjectContext
        userEntity = NSEntityDescription.entityForName("User", inManagedObjectContext:context!)
        
        
//        addUser("testUser", password:"testPass")
        fetchUsers()
    }

    
    // MARK: CoreData Methods
    
    func addUser(username:String , password:String) {
        var newUser = User(entity:userEntity!, insertIntoManagedObjectContext:context)
        newUser.username = username
        newUser.password = password
        context?.save(nil)
    }
    
    
    func fetchUsers() {
        var request = NSFetchRequest(entityName: "User")
        request.returnsObjectsAsFaults = false
        
        request.predicate = NSPredicate(format:"username = %@" , "testUser")
        
        var users = context?.executeFetchRequest(request, error:nil)
        
        for fetchedUser in users! {
            var user = fetchedUser as User
            println(user.username)
        }
    }
    

    //MARK: - Action Methods
    
    @IBAction func actionRegister(sender: AnyObject) {
        
        if !txtRegisterUsername.text.isEmpty && !txtRegisterPassword.text.isEmpty && !txtRegisterPasswordAgain.text.isEmpty {
            // kayit islemleri
        }
        else {
            // show error
        }
    }
    
    @IBAction func actionLogin(sender: AnyObject) {
        if !txtLoginUsername.text.isEmpty && !txtLoginPassword.text.isEmpty {
            // login islemleri
        }
        else {
            // show error
        }
    }
}








