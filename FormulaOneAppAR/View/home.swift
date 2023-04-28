//
//  home.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 18/4/2023.
//
import SwiftUI

struct Home: View {
    let constructors = [ConstructorModel(constructorId:0,logo: "logo_mercedes", carImage: "car_mercedes", rank: "1", point: "356", teamname: "Mercedes"),
                        ConstructorModel(constructorId:1,logo: "logo_ferrari", carImage: "car_ferrari", rank: "2", point: "354", teamname: "ferrari"),
                        ConstructorModel(constructorId:2,logo: "logo_toyota", carImage: "car_toyota", rank: "3", point: "340", teamname: "Toyota")]
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
                                    ForEach(0..<20) { constructor in DriverStandings()}
                                }                                     }             }
                            ScrollView(.vertical, showsIndicators: false) {
                                ForEach(constructors, id: \.self){ constructor in carteamview(constructorModel: constructor) }
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
    

