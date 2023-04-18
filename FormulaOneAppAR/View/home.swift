//
//  home.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 18/4/2023.
//

import SwiftUI

struct home: View {
    var body: some View {
        let items = ["Item 1", "Item 2", "Item 3", "Item 4"]

          
               List(items, id: \.self) { item in
                   Text(item)
               }
           }
    }


struct home_Previews: PreviewProvider {
    static var previews: some View {
        home()
    }
}
