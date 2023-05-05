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
                    NavigationLink(
                        destination: RealityKitView(carname: "formula"),
                        label: {
                            CarView(modelname: "formula.usdz")
                            
                        })
                    NavigationLink(
                        destination: RealityKitView(carname: "formulared"),
                        label: {
                            CarView(modelname: "formulared.usdz")
                            
                        })
                    NavigationLink(
                        destination: RealityKitView(carname: "formulaEsprit"),
                        label: {
                            CarView(modelname: "formulaEsprit.usdz")
                            
                        })
                    NavigationLink(
                        destination: RealityKitView(carname: "formula 4"),
                        label: {
                            CarView(modelname: "formula 4.usdz")
                            
                        })
                   
                    
                    
                    
                    
                    
                    
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
