//
//  DriverStandings.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 19/4/2023.
//

import SwiftUI

struct DriverStandings: View {
    //var driverStandingsModel : DriverStandingsModel
    
    var body: some View {
        ZStack{
            HStack(){
                
                Text("1")//driverStandingsModel.position
                    .foregroundColor(.red)
                    .font(.system(size: 40, design: .rounded).weight(.semibold))
                
                Image("flag")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(20)
                
                VStack(alignment: .leading) {
                    HStack{
                        Text("familyName")
                           
                            .foregroundColor(Color.black)
                            .font(.headline)
                        Text("familyName")
                            .foregroundColor(Color.black)
                            .font(.system(size: 18, design: .rounded).weight(.bold))
                        
                    }
                    Text("name")
                        .foregroundColor(Color.black)
                    //                .font(.headline)
                        .font(.system(size: 25, design: .rounded).weight(.semibold))
                    
                }
                Spacer()
                HStack{
                    Text("78")
                        .foregroundColor(.black)
                        .font(.system(size: 25, design: .rounded).weight(.semibold))
                    Text("pts")
                        .foregroundColor(.black)
                        .font(.system(size: 25, design: .rounded))
                }
            }
            .padding(.horizontal, 20)
            .background(Color.gray)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 4)
            
        }
        
    }
}

//struct DriverStandings_Previews: PreviewProvider {
//    static var previews: some View {
//        DriverStandings()
//    }
//}
