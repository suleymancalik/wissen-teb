//
//  ViewController.swift
//  Day3
//
//  Created by Suleyman Calik on 11/10/14.
//  Copyright (c) 2014 Bahcesehir University. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareManzara()
    }
    
    func prepareManzara() {
        var manzaraImage = UIImage(named: "manzara.jpg")
        var manzaraImageView = UIImageView(image: manzaraImage)
        scrollView.addSubview(manzaraImageView)
        
        scrollView.contentSize = manzaraImage.size
        
        scrollView.delegate = self
        
        
        var doubleTapGesture = UITapGestureRecognizer(target:self, action:Selector("doubleTapped"))
        doubleTapGesture.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTapGesture)
    }
    
    func doubleTapped() {
        if scrollView.zoomScale == scrollView.maximumZoomScale {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated:true)
        }
        else {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated:true)
        }
    }


    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        if let imageView:UIImageView = scrollView.subviews.first as? UIImageView {
            println("viewForZoomingInScrollView")
            return imageView
        }
        return nil
    }


}









