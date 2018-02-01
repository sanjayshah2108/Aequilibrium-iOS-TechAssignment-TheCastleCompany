//
//  ViewController.swift
//  TheCastleCompany
//
//  Created by Sanjay Shah on 2018-01-31.
//  Copyright © 2018 Sanjay Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var entryTextField: UITextField!
    
    @IBOutlet weak var addToArrayButton: UIButton!
    
    @IBOutlet weak var currentArrayLabel: UILabel!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var castleCountLabel: UILabel!
    
    
    var theEnteredArray: [Int]!
    
    var castleCount: Int!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        theEnteredArray = []
        currentArrayLabel.text = "Empty Array"
        
        castleCount = 0
        castleCountLabel.text = String(castleCount)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func buildCastles(array: [Int]) -> Int {
        
        var lastHighPoint: Int = -1
        var lastLowPoint: Int = -1
        
        var lastElement: Int = 0
        var index: Int = 0
        
        if (array.count == 1) {
            castleCount = 1
        }
        
        
        for element in array{
            if(lastElement == 0){
                print("we are at the first element")
                lastHighPoint = 0
                lastLowPoint = 0
            }
            else {
                if (element > lastElement){
                    print("we could be at a peak")
                    
                    
                    if (array[lastLowPoint] == lastElement){
                        castleCount = castleCount + 1
                        print("\(lastElement) is a valley")
                    }
                    
                    lastHighPoint = index
                    
                }
                    
                else if (element < lastElement){
                    print("we could be at a valley")
                    
                    if (array[lastHighPoint] == lastElement){
                        castleCount = castleCount + 1
                        print("\(lastElement) is a peak")
                    }
                    
                    lastLowPoint = index
                }
                    
                else {
                    print("we are at a flat")
                }
            }
            
            index += 1
            lastElement = element
        }
        
        return castleCount
    }
    
    
    @IBAction func addToArray(_ sender: UIButton) {
        
        theEnteredArray.append(Int(entryTextField.text!)!)
        
        var currentArrayLabelString: String = ""
        
        for item in theEnteredArray{
            
            if (currentArrayLabelString == ""){
                currentArrayLabelString = String(item)
            }
            else {
                currentArrayLabelString = currentArrayLabelString + ", \(String(item))"
            }
        }
        
        entryTextField.text = ""
        currentArrayLabel.text = currentArrayLabelString
        
    }
    
    
    @IBAction func calculate(_ sender: UIButton) {
        
        castleCountLabel.text = String(buildCastles(array: theEnteredArray))
        
    }
    
    
    @IBAction func reset(_ sender: UIButton) {
        
        theEnteredArray = []
        currentArrayLabel.text = "Empty Array"
        
        castleCount = 0
        castleCountLabel.text = String(castleCount)
        
    }
    
    

    
}

