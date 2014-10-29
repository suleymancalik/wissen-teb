//
//  MapVC.swift
//  Day3
//
//  Created by Suleyman Calik on 12/10/14.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController , MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var channel:Channel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        CLLocationManager
        
        mapView.delegate = self

        var region = MKCoordinateRegionMakeWithDistance(channel.coordinate, 1000, 2000)
        mapView.setRegion(region, animated: true)
        
        var annotation = ChannelAnnotation()
        annotation.channel = channel
        mapView.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: MapView
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if annotation is ChannelAnnotation {
            var identifier = "ChannelAnnotationView"
            var view = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
            
            if view == nil {
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            }
            view.canShowCallout = true
            
            view.rightCalloutAccessoryView = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as UIView
            view.image = UIImage(named:"atm")
            
            return view
        }
        else {
            return nil
        }
    }
    

    
    
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        
        // TODO: draw route
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
