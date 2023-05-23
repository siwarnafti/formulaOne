//
//  home.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 18/4/2023.
//
import SwiftUI

struct Home: View {
   
    @StateObject var evm = ErgastViewModel()
    var body: some View {
        NavigationView{
            ZStack{
//               LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .top, endPoint: .bottom)
//
//                   .edgesIgnoringSafeArea(.all)
                VStack {
                    Text(LocalizedStringKey("Home"))
                        .font(.system(size: 35, design: .rounded).weight(.semibold))
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .foregroundColor(.red)

                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack() {
                                    ForEach(racess,id: \.self) { race in
                                        NavigationLink(
                                            destination: RoundInformationView(race: race),
                                            label: {
                                                DriverStandings(race: race)
                                                
                                            })
                                        
                                        
                                    }
                                }                                     }             }
                            ScrollView(.vertical, showsIndicators: false) {
                                ForEach(evm.construcators, id: \.self){ constructor in
                                    NavigationLink(
                                        destination: TeamCardView(constructor: constructor),
                                        label: {
                                            carteamview(constructorModel: constructor)
                                            
                                        })
                                }
                            }
                        }.onAppear {}
                    }
            .background(Image("backgroundcolor3")
            .resizable()
            .frame(width: 450, height: 940)
            .offset(x:0,y:0))
                    }.navigationBarTitle("Home", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
    struct home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
    

