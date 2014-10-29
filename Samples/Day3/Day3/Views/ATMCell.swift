//
//  ATMCell.swift
//  Day3
//
//  Created by Suleyman Calik on 11/10/14.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import UIKit

class ATMCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnShowOnMap: UIButton!
    
    @IBOutlet weak var constraintImgWidth: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()

        self.printValues()
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(),{ () -> Void in
//            self.printValues()
//        })
    }
    
    func printValues() {
        
        //constraintImgWidth.constant = 100
        
        
        self.constraintImgWidth.constant = 100
        UIView.animateWithDuration(3, animations: { () -> Void in
//            self.iconView.frame.size.width = 100
//            self.layoutIfNeeded()
            }) { (completed:Bool) -> Void in
//                self.iconView.frame.size.width = 0
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(),{ () -> Void in
                    self.printValues()
//                })
        }
    }
    
    
    class func height() -> CGFloat {
        return 60
    }
    
    class func reuseIdentitifier() -> String {
        return "ATMCell"
    }

    /*
    override func drawRect(rect: CGRect) {
        var test:NSString = "deneme"
        var key : NSString = NSString(string: "UITextAttributeFont")
        var font = UIFont(name:"Helvetica", size: 20)
        var attributes:Dictionary<NSObject,AnyObject> = [key:font!]
        test.drawAtPoint(CGPoint(x:0, y:0), withAttributes:attributes)
    }
    */

}
