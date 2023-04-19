//
//  home.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 18/4/2023.
//
import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView{
            ZStack{
                
                                VStack {
                                    ScrollView(.vertical, showsIndicators: false) {
                                        Text("Movies")
                                            .font(.system(size: 35, design: .rounded).weight(.semibold))
                                            .fontWeight(.bold)
                                            .padding(.top, 20)
                                            .foregroundColor(.black)
                
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack(spacing: 20) {
                
//                                                                        ForEach(moviesViewModel.movies, id: \.self)
                                                //Text("dooooo")
//                                                movie in
                                                                            RaceCardView()
                                            }
                                        }
                                        .padding(.horizontal, 20)
                                        .padding(.top, 10)
                                        .onAppear {
//                                                             print("Movies in HomeView: \(moviesViewModel.movies)")
                                                                }
                                        }
                                    }
                                    Spacer()
                                }
                            }
                        }
                        }
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


    struct home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
    

