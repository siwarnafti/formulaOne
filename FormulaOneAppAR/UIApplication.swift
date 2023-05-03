//
//  UIApplication.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 29/4/2023.
//
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
