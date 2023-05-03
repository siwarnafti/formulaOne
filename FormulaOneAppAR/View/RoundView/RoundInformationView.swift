//
//  RoundInformationView.swift
//  FormulaOneAppAR
//
//  Created by Apple Esprit on 3/5/2023.
//

import SwiftUI

struct RoundInformationView: View {
    @State private var selection = 0
    
    var body: some View {
        NavigationView {
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
                            Text("Ferrari").font(
                                .custom(
                                    "AmericanTypewriter",
                                    fixedSize: 34)
                                .weight(.black))
                            Spacer()
                            Text("2023")
                                .font(.custom("VastShadow-Regular", size: 34))
                                .fontWeight(.bold)
                        }.padding([.top, .leading, .trailing])
                        HStack{
                            Text("03")
                                .font(.custom("VastShadow-Regular", size: 54))
                                .fontWeight(.bold)
                                .padding(.horizontal, 20)
                            Spacer()
                            HStack{
                                Text("134").font(.custom("KumarOne-Regular", size: 40))
                                    .foregroundColor(.red)
                                    .fontWeight(.bold)
                                
                                    Text("PTS")
                                        .font(.system(size: 24))
                                        .offset(y:1)
                                
                            }
                            Spacer()
                            Spacer()
                        }
                        Spacer(minLength: 30)
                        HStack{
                            VStack(alignment: .leading){
                                Text("2").font(.system(size: 34)).fontWeight(.bold)
                                Text("Wins")
                            }
                            Spacer()
                            VStack{
                                Text("2").font(.system(size: 34)).fontWeight(.bold)
                                Text("Podiums")
                            }
                            Spacer()
                            VStack{
                                Text("2").font(.system(size: 34)).fontWeight(.bold)
                                Text("Poles")
                            }
                        }.padding(.horizontal)
                        HStack{
                            VStack(alignment:.leading){
                                Text("Base").font(.custom("Sarpanch-Regular", size: 24))
                                Text("Maranello").font(.custom("Sarpanch-Bold", size: 24))
                            }
                            Spacer()
                           
                            Image("flag")
                                .resizable()
                                .frame(width: 100,height: 50)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                            
                        }.padding(.horizontal)
                        HStack{
                            VStack(alignment:.leading){
                                Text("Team Principal").font(.custom("Sarpanch-Regular", size: 24))
                                Text("Toto Wolff").font(.custom("Sarpanch-Bold", size: 24))
                            }
                            Spacer()
                        }.padding(.horizontal)
                      
                    }
                
                }
        }
    }
}

struct RoundInformationView_Previews: PreviewProvider {
    static var previews: some View {
        RoundInformationView()
    }
}
