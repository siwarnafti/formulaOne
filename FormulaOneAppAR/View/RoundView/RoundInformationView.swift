//
//  RoundInformationView.swift
//  FormulaOneAppAR
//
//  Created by Apple Esprit on 3/5/2023.
//

import SwiftUI

struct RoundInformationView: View {
    //@State private var selection = 0
    var race : Rrace
    var body: some View {
            ZStack{
                Color.gray
                    .ignoresSafeArea()
                    VStack{
                        Image("TeameDetailViewMercedess")
                            .resizable()
                                                .padding(10)
                            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/2.5)
                            .cornerRadius(50)
                            .shadow(radius: 10)
                        
                        //                .padding()
                        
                        Spacer()
                        HStack{
                            Text("Round").font(
                                .custom(
                                    "AmericanTypewriter",
                                    fixedSize: 34)
                                .weight(.black))
                            Spacer()
                            Text(race.date)
                                .font(.custom("VastShadow-Regular", size: 34))
                                .fontWeight(.bold)
                        }.padding([.top, .leading, .trailing])
                        HStack{
                            Text("\(race.round)")
                                .font(.custom("VastShadow-Regular", size: 54))
                                .fontWeight(.bold)
                                .padding(.horizontal, 20)
                            Spacer()
                            
                        }
                        Spacer(minLength: 30)
                        HStack{
                            
                            Spacer()
                           
                        }.padding(.horizontal)
                        HStack{
                            VStack(alignment:.leading){
                                Text("Base").font(.custom("Sarpanch-Regular", size: 24))
                                Text(race.country).font(.custom("Sarpanch-Bold", size: 24))
                            }
                            Spacer()
                            NavigationLink(
                                destination: localisationView(base: race.city),
                                label: {
                                    Image(race.country)
                                        .resizable()
                                        .frame(width: 100,height: 50)
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                    
                                })
                            
                           
                           
                        }.padding(.horizontal)
                        
                        HStack{
                            VStack(alignment:.leading){
                                Text("city").font(.custom("Sarpanch-Regular", size: 24))
                                Text(race.city).font(.custom("Sarpanch-Bold", size: 24))
                            }
                            Spacer()
                        }.padding(.horizontal)
                      
                    
                
            }
        }
    }
}

struct RoundInformationView_Previews: PreviewProvider {
    static var previews: some View {
        RoundInformationView(race: racess[0])
    }
}
