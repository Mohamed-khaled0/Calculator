//
//  CalculatorModel.swift
//  Calculator
//
//  Created by MoKhaled on 29/03/2024.
//

import Foundation

struct CalculatorLogic {
    
    var number:Double
    init(number: Double) {
        self.number = number
    }
    
    func calculate (symbol: String) -> Double? {
            if symbol == "+/-" {
               return number * -1
            }else if  symbol == "AC"{
                return 0
            }else if symbol == "%" {
                return number * 0.01
            }
        return nil
    }
}
