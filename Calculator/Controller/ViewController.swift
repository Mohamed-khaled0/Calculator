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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        guard let number = Double(displayLabel.text!) else {
            fatalError("Can't convert display label text to a double.")
        }
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            }else if  calcMethod == "AC"{
                displayLabel.text = "0"
            }else if calcMethod == "%" {
                displayLabel.text = String(number * 0.01)
            }
        }
    }
        
        @IBAction func numButtonPressed(_ sender: UIButton) {
            if let numValue =  sender.currentTitle {
                if  isFinishedTypingNumber == true  {
                    displayLabel.text = numValue
                    isFinishedTypingNumber = false
                }else{
                    displayLabel.text = displayLabel.text! + numValue
                }
            }
        }
        
    }

