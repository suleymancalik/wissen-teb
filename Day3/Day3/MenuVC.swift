//
//  MenuVC.swift
//  Day3
//
//  Created by Suleyman Calik on 11/10/14.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import UIKit

class MenuVC: UITableViewController {

    var atms:Array<ATM> = []
    var branchs:Array<Branch> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 0..<10 {
            var atm = ATM(title: "ATM \(index + 1)")
            atms.append(atm)
        }
        
        for index in 0..<10 {
            var branch = Branch(title: "Sube \(index + 1)", phoneNumber:"212 292 89 0\(index)")
            branchs.append(branch)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - TableView
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return ATMCell.height()
        case 1:
            return 44
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return atms.count
        case 1:
            return branchs.count
        default:
            return 0
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell:UITableViewCell!
        
        switch indexPath.section {
        case 0:
            var atmCell = tableView.dequeueReusableCellWithIdentifier(ATMCell.reuseIdentitifier()) as ATMCell
            var atm = atms[indexPath.row] as ATM
            atmCell.lblTitle.text = atm.title
            atmCell.iconView?.image = UIImage(named: "atm")
            atmCell.btnShowOnMap.tag = indexPath.row
            cell = atmCell
        case 1:
            cell = tableView.dequeueReusableCellWithIdentifier("MenuCell") as UITableViewCell
            var branch = branchs[indexPath.row] as Branch
            cell.textLabel?.text = branch.title
            cell.imageView?.image = UIImage(named: "branch")
            cell.detailTextLabel?.text = branch.phoneNumber
        default:()
        }
        
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.whiteColor()
        }
        else {
            cell.backgroundColor = UIColor(red:220.0/255.0, green:220.0/255.0, blue:220.0/255.0, alpha: 1)
        }
        
        return cell
    }
    
    @IBAction func actShowAtmOnMap(sender: UIButton) {
        println("HARITADA GOSTER: \(sender.tag)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}