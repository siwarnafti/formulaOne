//
//  customViews.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 8/4/2023.
//

import Foundation
import SwiftUI

struct PrimaryButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("PrimaryColor"))
            .cornerRadius(50)
    }
    
}
struct PrimaryButton2: View {
    var title: String
    var body: some View {
        Text(title)
            
            
    }
    
}
