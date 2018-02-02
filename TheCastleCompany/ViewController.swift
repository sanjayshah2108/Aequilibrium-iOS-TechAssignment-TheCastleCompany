//
//  ViewController.swift
//  TheCastleCompany
//
//  Created by Sanjay Shah on 2018-01-31.
//  Copyright © 2018 Sanjay Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var entryTextField: UITextField!
    
    @IBOutlet weak var addToArrayButton: UIButton!
    
    @IBOutlet weak var currentArrayLabel: UILabel!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var castleCountLabel: UILabel!
    
    
    @IBOutlet weak var graphView: UIView!
    
    var theEnteredArray: [Int]!
    
    var castleCount: Int!
    var castleAtIndexesArray: [Int]!

    var tapGesture: UIGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        entryTextField.delegate = self
        
        view.sendSubview(toBack: graphView)
        
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
        
        castleAtIndexesArray = []
        
        if (array.count == 1) {
            castleCount = 1
            castleAtIndexesArray.append(index)
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
                        castleAtIndexesArray.append(index - 1)
                    }
                    
                    lastHighPoint = index
                    
                }
                    
                else if (element < lastElement){
                    print("we could be at a valley")
                    
                    if (array[lastHighPoint] == lastElement){
                        castleCount = castleCount + 1
                        print("\(lastElement) is a peak")
                        castleAtIndexesArray.append(index-1)
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
        
        graphView.alpha = 0.5
        renderPeaksAndValleys(array: theEnteredArray)
        renderCastles(array: castleAtIndexesArray)
    }
    
    
    @IBAction func reset(_ sender: UIButton) {
        
        theEnteredArray = []
        currentArrayLabel.text = "Empty Array"
        
        castleCount = 0
        castleCountLabel.text = String(castleCount)
        
        castleAtIndexesArray = []
        renderPeaksAndValleys(array: castleAtIndexesArray)
        renderCastles(array: castleAtIndexesArray)
        
        
    }
    
    
    func renderPeaksAndValleys(array: [Int]){
        
        var xPoint = 0
        
        for item in array {
            let bar = UIView(frame: CGRect(x: xPoint+10, y: Int(UIScreen.main.bounds.maxY), width: 20, height: -(item*10)))
            
            bar.backgroundColor = UIColor.black
            bar.alpha = 0.5
            
            xPoint += 25
           
            graphView.addSubview(bar)
            
        }
    }
    
    func renderCastles(array: [Int]){
        
        var xPoint = 0
        
        for castle in array {
            
            xPoint += (25*castle)
            
            
            let castleImage = UIView(frame: CGRect(x: xPoint+10, y: Int(UIScreen.main.bounds.maxY) - (theEnteredArray[castle]*10), width: 20, height: 15))
            
            castleImage.backgroundColor = UIColor.orange
            castleImage.alpha = 0.5
            
            
            
            graphView.addSubview(castleImage)
            
        }
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if (tapGesture != nil){
            self.view.removeGestureRecognizer(tapGesture)
        }
        
        
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        entryTextField.resignFirstResponder()
        
    }
    
    

    
}

