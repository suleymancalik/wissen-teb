//
//  BlueView.swift
//  Day7
//
//  Created by Suleyman Calik on 25.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class BlueView: UIView {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {

        var manzara = UIImage(named: "manzara")
        manzara?.drawAsPatternInRect(bounds)
        
        var text = NSString(string: "Bu bir mavi view'dir!")
        var attributes = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName            : UIFont(name: "Helvetica", size: 22)!]
        
        var textSize = text.sizeWithAttributes(attributes)
        println(textSize)
        var textX = (bounds.size.width / 2.0) - (textSize.width / 2.0)
        var textY = (bounds.size.height / 2.0) - (textSize.height / 2.0)
        text.drawAtPoint(CGPoint(x:textX, y:textY), withAttributes: attributes)
    }

}
