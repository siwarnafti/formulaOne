//
//  CarsView.swift
//  FormulaOneAppAR
//
//  Created by Apple Esprit on 3/5/2023.
//

import SwiftUI

struct CarsView: View {
    var body: some View {
        // CarView(modelname: "formulaEsprit.usdz")
        
        NavigationView{
            
            ZStack{
                
                ScrollView(.vertical, showsIndicators: false) {
                    CarView(modelname: "formula.usdz")
                    CarView(modelname: "formulared.usdz")
                    CarView(modelname: "formulaEsprit.usdz")
                    CarView(modelname: "formula 4.usdz")
                    
                    
                    
                }.onAppear {}
            }
            
        }.navigationBarTitle("Home", displayMode: .inline)
            .navigationBarHidden(true)
         
    }
    
}

struct CarsView_Previews: PreviewProvider {
    static var previews: some View {
        CarsView()
    }
}
