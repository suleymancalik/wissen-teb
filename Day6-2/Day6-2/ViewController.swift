//
//  ViewController.swift
//  Day6-2
//
//  Created by Suleyman Calik on 19.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        println(scrollView.bounds)
//        println(scrollView.contentSize)
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        
        var imgView = UIImageView(image:UIImage(named: "manzara.jpg"))
        scrollView.addSubview(imgView)
        scrollView.contentSize = CGSizeMake(imgView.bounds.width, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pageControlChanged(sender: UIPageControl) {
        var newX:CGFloat = CGFloat(sender.currentPage) * scrollView.bounds.width
        scrollView.setContentOffset(CGPointMake(newX,0), animated: true)
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var x = scrollView.contentOffset.x
        
        var page:Int = Int(x / scrollView.bounds.width)
        println(page)
        pageControl.currentPage = page
    }
    

}

