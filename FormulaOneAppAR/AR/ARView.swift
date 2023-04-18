//
//  ARView.swift
//  FormulaOneAppAR
//
//  Created by Apple Esprit on 18/4/2023.
//

import SwiftUI

struct ARView: View {
    var body: some View {
        CustomARViewRepresentable()
            .ignoresSafeArea()
    }
}

struct ARView_Previews: PreviewProvider {
    static var previews: some View {
        ARView()
    }
}
