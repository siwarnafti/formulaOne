//
//  home.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 18/4/2023.
//
import SwiftUI

struct Home: View {
   
    @ObservedObject var evm = ErgastViewModel()
    var body: some View {
        NavigationView{
            ZStack{
               LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .top, endPoint: .bottom)
    
                   .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Formula 1 Fan")
                        .font(.system(size: 35, design: .rounded).weight(.semibold))
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .foregroundColor(.black)

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
                                ForEach(constructors, id: \.self){ constructor in
                                    NavigationLink(
                                        destination: TeamCardView(constructor: constructor),
                                        label: {
                                            carteamview(constructorModel: constructor)
                                            
                                        })
                                }
                            }
                        }.onAppear {}
                    }
                    }.navigationBarTitle("Home", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }

//                            }
//                        }
//                        }
/*
                        HStack {
                            Text("Horizontal List 1")
                                .font(.headline)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(horizontalData, id: \.self) { item in
                                        Text(item)
                                            .padding(.horizontal, 10)
                                    }
                                }
                            }
                        }

                        HStack {
                            Text("Horizontal List 2")
                                .font(.headline)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(horizontalData, id: \.self) { item in
                                        Text(item)
                                            .padding(.horizontal, 10)
                                    }
                                }
                            }
                        }
                    }
            }
        }
    }
}*/

//ScrollView(.vertical, showsIndicators: false) {
//
//                    Text("Movies")
//                        .font(.system(size: 35, design: .rounded).weight(.semibold))
//                        .fontWeight(.bold)
//                        .padding(.top, 20)
//                        .foregroundColor(.white)
//
//                    ScrollView(.horizontal, showsIndicators: false) {
//                              HStack(spacing: 20) {
//                                  ForEach(moviesViewModel.movies, id: \.self) { movie in
//                                      BabyCardView(movie: movie)
//
//                                     }
//                                  }
//
//                              .padding(.horizontal, 20)
//                              .padding(.top, 10)
//                              .onAppear {                                                  print("Movies in HomeView: \(moviesViewModel.movies)")}
//
//                          }
//
//                    Spacer()
//      }
    struct home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
    

