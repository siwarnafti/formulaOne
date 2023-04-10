//
//  CheckBox.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 9/4/2023.
//

import SwiftUI

struct CheckBox: View {
    @Binding var isChecked: Bool

    var body: some View {
        Button(action: {
            self.isChecked.toggle()
        }) {
            HStack(alignment: .center) {
                Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isChecked ? .black : .white)
                    .scaleEffect(2)
                
            }
        }
    }
}

