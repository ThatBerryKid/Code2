//
//  ViewController.swift
//  Calculator
//
//  Created by James Berry on 3/27/17.
//  Copyright © 2017 James Berry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   var myNumber = ""
    @IBOutlet weak var label: UILabel!
  

    @IBAction func numPressed(_ sender: UIButton) {
        
     let myNumberAdded = (sender.titleLabel?.text)!
        
        myNumber = myNumber.appending(myNumberAdded)
        UpdateMyNumber();
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        clearNumbers()
    }
    func UpdateMyNumber(){
        label.text=myNumber;
    }
    func clearNumbers(){
    myNumber = "0"
    UpdateMyNumber()
    }
    
    
}

