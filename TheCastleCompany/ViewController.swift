//
//  ViewController.swift
//  TheCastleCompany
//
//  Created by Sanjay Shah on 2018-01-31.
//  Copyright © 2018 Sanjay Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var castleCount: Int!
    var lastHighPoint: Int!
    var lastLowPoint: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        castleCount = 0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func myFunc(array: [Int]) -> Int {
        
        var lastElement: Int = -10
        var index: Int = 0
        
        if (array.count>0) {
            castleCount = 1
        }
        
        for element in array{
            if (element > lastElement){
                print("we could be at a peak")
                
                if (array[lastLowPoint] == lastElement){
                    castleCount = castleCount + 1
                }
                
                lastHighPoint = index
                
            }
            
            else if (element < lastElement){
                print("we could be at a valley")
                
                if (array[lastHighPoint] == lastElement){
                    castleCount = castleCount + 1
                }
                
                lastLowPoint = index
                
            }
            
            else {
                print("we are at a flat")
            }
        
            index += 1
            lastElement = element
        }
        
        return castleCount
    }

}

