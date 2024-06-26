//
//  ViewController.swift
//  Calculator
//
//  Created by MoKhaled on 29/03/2024.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber:Bool = true
    private var displayValue:Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Can't convert display label text to a double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
            
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue =  sender.currentTitle {
            if  isFinishedTypingNumber == true  {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }else{
                if numValue == "." {
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Can't convert display label text to a double.")
                    }
                    let isInt = floor(Double(displayValue)) == displayValue
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

