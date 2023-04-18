//
//  TeamView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 14/4/2023.
//

import SwiftUI

struct TeamView: View {
    var body: some View {
        ZStack{
            //.color(.gray)
            Color.gray
                .ignoresSafeArea()
            HStack{
                Text("1")
                    .bold()
                Divider()
                    .frame(width: 1.0)
                    .foregroundColor(.blue)
                    
            }
        }.frame(height:100)
        
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}
