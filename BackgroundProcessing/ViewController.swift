//
//  ViewController.swift
//  BackgroundProcessing
//
//  Created by Brandon Rich2 on 2/24/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        print("start")
        
        var name = "Brandon"
        self.doInSeconds(5) {
            (foo) -> Void in
                print("Hey \(name), I got a value: \(foo)")
        }
        
        // other stuff
    }
    
    func printString( str: String ) -> Void {
        print("the string is \(str)")
    }

    func doInSeconds( seconds: Int, callback: (String) -> Void ) {
        
        dispatch_async( dispatch_get_main_queue() ) {
            // sleep x seconds
            sleep(UInt32(seconds))
            // do the callback
            let msg =  "Processing Finished"
            callback(msg)
        }
        
    }


}

