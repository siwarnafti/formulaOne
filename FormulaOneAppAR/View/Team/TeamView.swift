//
//  TeamView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 14/4/2023.
//

import SwiftUI

struct TeamView: View {
    var body: some View {
        ScrollView{
            ZStack{
                VStack{
                    ZStack{
                        Image("Mercedes-Benzlogo")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedCorners(tl:30,tr:30,bl: 30,br:30))
                            .padding(7)
                        HStack{
                            VStack{
                                
                                
                                Text("1st")
                                    .font(
                                        .custom(
                                            "RacingSansOne-Regular",
                                            fixedSize: 24)
                                        .weight(.black))
                                    .foregroundColor(.white)
                                    .padding(7)
                                Text("345pts")
                                    .font(
                                        .custom(
                                            "RacingSansOne-Regular",
                                            fixedSize: 24)
                                        .weight(.black))
                                    .foregroundColor(.white)
                                
                            }.padding()
                            Spacer()
                            
                        }
                        
                    }
                        
                        Image("Mercedes-Benzlogo")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedCorners(tl:30,tr:30,bl: 30,br:30))
                            .padding(7)
                    
                    
                        Image("Mercedes-Benzlogo")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedCorners(tl:30,tr:30,bl: 30,br:30))
                            .padding(7)
                        Image("Mercedes-Benzlogo")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedCorners(tl:30,tr:30,bl: 30,br:30))
                            .padding(7)
                    }
                    
                }
                
            }}
    }
    
    struct TeamView_Previews: PreviewProvider {
        static var previews: some View {
            TeamView()
        }
    }

