//
//  ViewController.swift
//  Day7
//
//  Created by Suleyman Calik on 25.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationTests()
//        localNotifications()
    }
    
    
    func animationTests() {
        
        var redView = UIView(frame: CGRect(x: 20, y: 20, width: 200, height: 200))
        redView.backgroundColor = UIColor.redColor()
        redView.clipsToBounds = true
        redView.contentMode = UIViewContentMode.Redraw
        view.addSubview(redView)
        
        var blueView = BlueView(frame: CGRect(x:10, y: 10, width: 100, height: 100))
        blueView.backgroundColor = UIColor.blueColor()
        blueView.clipsToBounds = true
        blueView.layer.cornerRadius = blueView.bounds.width / 2.0
        blueView.contentMode = UIViewContentMode.Redraw
        redView.addSubview(blueView)
        
//        var manzara = UIImage(named: "manzara")
//        var imageView = UIImageView(image: manzara)
//        blueView.addSubview(imageView)
        
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            //
            // animasyonlar buraya
            //
            blueView.frame = redView.bounds
            blueView.layer.cornerRadius = blueView.bounds.width / 2.0
            
            
//            blueView.tr
            //
            //
            }) { (completed:Bool) -> Void in
            //
            // bitince yapilacaklar buraya
                blueView.frame.size.width += 1
            //
            //
            //
        }
    }
}













