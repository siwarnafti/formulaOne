//
//  RaceCardView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 19/4/2023.
//

import SwiftUI

struct RaceCardView: View {
    var race:Race
    var body: some View {
        
            HStack(){
                Image("flag")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            
                    .padding(20)
                
         
//            Image("signup")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
////                .frame(width: 100, height: 100)
        VStack(alignment: .leading) {
            Text("Round \(race.round!)")
                .foregroundColor(.red)
            .foregroundColor(Color.black)
            .font(.headline)
          
            
            Text(race.name!)
                .foregroundColor(Color.black)
//                .font(.headline)
                .font(.system(size: 25, design: .rounded).weight(.semibold))

            Text("\(race.date!)")
                .foregroundColor(Color.black)
                .font(.headline)
        }
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
        RaceCardView(race:races[0])
    }
}
