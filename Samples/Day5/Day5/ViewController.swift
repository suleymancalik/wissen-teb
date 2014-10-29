//
//  ViewController.swift
//  Day5
//
//  Created by Suleyman Calik on 18.10.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        testARC()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        println("MEMORY WARNING ALDIK !!!")
    }

    
    func testARC() {
        //100_000_000
        println("for basladi")
        for _ in 0..<100_000_000 {
            
            var john = Person(name: "John Appleseed")
            var number42 = Apartment(number: 42)
            
            john.apartment = number42
            number42.tenant = john
        }
        
        println("for bitti")
    }

}






