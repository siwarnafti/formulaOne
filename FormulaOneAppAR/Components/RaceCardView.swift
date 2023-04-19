//
//  RaceCardView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 19/4/2023.
//

import SwiftUI

struct RaceCardView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("signup")
                .resizable()
                .aspectRatio(contentMode: .fill)
//                .frame(width: 100, height: 100)
                
            
            Text("Baby Name")
                .foregroundColor(Color.black)
                .font(.headline)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 4)
        .frame(width: 300, height: 200)
    }
}

struct RaceCardView_Previews: PreviewProvider {
    static var previews: some View {
        RaceCardView()
    }
}
