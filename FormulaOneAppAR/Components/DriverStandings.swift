//
//  DriverStandings.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 19/4/2023.
//

import SwiftUI

struct DriverStandings: View {
    //var driverStandingsModel : DriverStandingsModel
    var race : Rrace
    var body: some View {
        ZStack{
            HStack(){
                
                Text("\(race.round)")//driverStandingsModel.position
                    .foregroundColor(Color.gray)
                    .font(.system(size: 40, design: .rounded).weight(.semibold))
                
                Image(race.country)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(20)
                
                VStack(alignment: .leading) {
                    HStack{
                        Text("RaceName")
                           
                            .foregroundColor(Color.red)
                            .font(.system(size: 25, design: .rounded).weight(.semibold))
//                            .font(.headline)
                        Text("\(race.city) Race")
                            .foregroundColor(Color("PrimaryColor"))
                            .font(.system(size: 18, design: .rounded).weight(.bold))
                        
                    }
                    Text(race.date)
                        .foregroundColor(Color.white)
                    //                .font(.headline)
                        .font(.system(size: 25, design: .rounded).weight(.semibold))
                    
                }
                Spacer()
                
            }
            .background(Image("backtemview")
            .resizable()
            .frame(height:100 ))
            .padding(.horizontal, 20)
            .cornerRadius(50)
//            .shadow(radius: 10)
            .cornerRadius(10)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 4)
            
        }
        
    }
}

//struct DriverStandings_Previews: PreviewProvider {
//    static var previews: some View {
//        DriverStandings()
//    }
//}
