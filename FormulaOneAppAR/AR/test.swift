//
//  test.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 21/4/2023.
//

import SwiftUI

struct test: View {
    var body: some View {
        ZStack{
            RealityKitView(carname: "formulaEsprit")
            
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
