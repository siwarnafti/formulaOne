//
//  testnav.swift
//  FormulaOneAppAR
//
//  Created by MacOS on 10/5/2023.
//

import SwiftUI

struct testnav: View {
    var body: some View {
        NavigationView {
             NavigationLink(destination:SecView()) {
               Text("Primo")
             }
        }
    }
}


struct SecView: View {
    var body: some View {
         NavigationLink(destination:TerView()) {
               Text("Secondo")
           }
    }
}

struct TerView: View {
    var body: some View {
        Text("Hello World!")
    }
}
struct testnav_Previews: PreviewProvider {
    static var previews: some View {
        testnav()
    }
}
