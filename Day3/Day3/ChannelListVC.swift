//
//  ChannelListVC.swift
//  Day3
//
//  Created by Suleyman Calik on 11/10/14.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import UIKit

class ChannelListVC: UITableViewController , CLLocationManagerDelegate {

    var atms:Array<ATM> = []
    var branchs:Array<Branch> = []
    var selectedTab:Int = 0
    
    var locationManager = CLLocationManager()
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 0..<10 {
            var atm = ATM(title: "ATM \(index + 1)")
            var lat = CLLocationDegrees(41 + (CGFloat(index) * 0.01))
            var lon = CLLocationDegrees(29 + (CGFloat(index) * 0.01))
//            println("lat:\(lat) lon:\(lon)")
            atm.coordinate = CLLocationCoordinate2D(latitude:lat, longitude:lon)
            atms.append(atm)
        }
        
        for index in 0..<10 {
            var branch = Branch(title: "Sube \(index + 1)", phoneNumber:"212 292 89 0\(index)")
            var lat = CLLocationDegrees(41.0 - (index * 0.1))
            var lon = CLLocationDegrees(29.0 - (index * 0.1))
            branch.coordinate = CLLocationCoordinate2D(latitude:lat, longitude:lon)
            branchs.append(branch)
        }
        
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }

    
    override func viewDidAppear(animated: Bool) {
        
        
        for region in locationManager.monitoredRegions {
            locationManager.stopMonitoringForRegion(region as CLRegion)
        }
        
        for atm in atms {
            if atm.isTracking {
                var region  = ChannelRegion(circularRegionWithCenter: atm.coordinate, radius: Double(atm.trackingDistance), identifier:atm.title)
                locationManager.startMonitoringForRegion(region)
            }
        }
        
        for branch in branchs {
            if branch.isTracking {
                var region  = ChannelRegion(circularRegionWithCenter: branch.coordinate, radius: Double(branch.trackingDistance), identifier:branch.title)
                locationManager.startMonitoringForRegion(region)
            }
        }
    }
    
    
    // MARK: - TableView
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        switch selectedTab {
        case 0:
            return 3
        case 1:
            return 2
        case 2:
            return 2
        default:
            return 0
        }
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 40
        case 1:
            return ATMCell.height()
        case 2:
            return 44
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return atms.count
        case 2:
            return branchs.count
        default:
            return 0
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell:UITableViewCell!
        
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("TabCell") as UITableViewCell
        }
        else {
            if indexPath.section == 1 {
                if selectedTab == 1 {
                    cell = tableView.dequeueReusableCellWithIdentifier("MenuCell") as UITableViewCell
                    var branch = branchs[indexPath.row] as Branch
                    cell.textLabel?.text = branch.title
                    cell.imageView?.image = UIImage(named: "branch")
                    cell.detailTextLabel?.text = branch.phoneNumber
                }
                else {
                    var atmCell = tableView.dequeueReusableCellWithIdentifier(ATMCell.reuseIdentitifier()) as ATMCell
                    var atm = atms[indexPath.row] as ATM
                    atmCell.lblTitle.text = atm.title
                    atmCell.iconView?.image = UIImage(named: "atm")
                    atmCell.btnShowOnMap.tag = indexPath.row
                    cell = atmCell
                }
            }
            else {
                cell = tableView.dequeueReusableCellWithIdentifier("MenuCell") as UITableViewCell
                var branch = branchs[indexPath.row] as Branch
                cell.textLabel?.text = branch.title
                cell.imageView?.image = UIImage(named: "branch")
                cell.detailTextLabel?.text = branch.phoneNumber
            }
        }

        
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.whiteColor()
        }
        else {
            cell.backgroundColor = UIColor(red:220.0/255.0, green:220.0/255.0, blue:220.0/255.0, alpha: 1)
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section > 0 {
            
            var selectedChannel:Channel?
            
            if indexPath.section == 1 {
                if selectedTab == 1 {
                    selectedChannel = branchs[indexPath.row]
                }
                else {
                    selectedChannel = atms[indexPath.row]
                }
            }
            else {
                selectedChannel = branchs[indexPath.row]
            }
            
            
            self.performSegueWithIdentifier("ChannelDetailSegue", sender:selectedChannel)
        }
    }
    
    
    
    // MARK: Actions
    
    @IBAction func actShowAtmOnMap(sender: UIButton) {
        println("HARITADA GOSTER: \(sender.tag)")
        
        var atm = atms[sender.tag]
        self.performSegueWithIdentifier("ShowMapSegue", sender:atm)
    }
    
    
    @IBAction func actTabChanged(sender: UISegmentedControl) {
        selectedTab = sender.selectedSegmentIndex
        self.tableView.reloadData()
    }

    
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.destinationViewController is MapVC {
            var mapVC = segue.destinationViewController as MapVC
            mapVC.channel = sender as Channel
        }
        else if segue.destinationViewController is ChannelDetailVC {
            var detailVC = segue.destinationViewController as ChannelDetailVC
            detailVC.channel = sender as Channel
        }
    }
    
    
    
    // MARK: - Region Monitoring Methods
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("ERR: \(error)")
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var location:CLLocation = locations.last as CLLocation
        println("\(location.coordinate.latitude) \(location.coordinate.longitude)")
    }
    
    func locationManager(manager: CLLocationManager!, didStartMonitoringForRegion region: CLRegion!) {
        println("start monitoring: \(region)")
    }
    
    
    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        println("did enter region: \(region)")
    }
    
    
    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
        println("did exit region: \(region)")
    }

    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
//        if status == CLAuthorizationStatus.Authorized {
//            println(CLLocationManager.locationServicesEnabled())
//            println(locationManager)
//            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
//            locationManager.delegate = self
//            locationManager.startUpdatingLocation()
//        }
    }
    
    
}










