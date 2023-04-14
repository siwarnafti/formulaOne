//
//  WelcomeScreenView.swift
//  login
//
//  Created by Apple Esprit on 14/3/2023.
//

import SwiftUI

struct WelcomeScreenView: View {
        var body: some View {
        NavigationView {
           
                ZStack {
                    Image("welcome")
                        .resizable()
                        .frame(width: 400, height: 900 , alignment: .center)
                        .padding(.horizontal, 20)
                    VStack{
                       Spacer()
                        Image("logo")
                            .resizable()
                            .offset(x:-100, y: 170)
                            .frame(width: 300, height: 300)
                            //.padding(.vertical, 10)
                        VStack{
                            Text("Welcome To Your")
                                .font(.system(size: 36))
                                .foregroundColor(Color.white)
                                .offset(x:-30, y:60)
                            HStack{
                                Text("Formula 1")
                                    .font(.system(size: 36))
                                    .foregroundColor(Color.white)
                                
                                    .fontWeight(.bold)
                                    
                                Text("AR")
                                    .foregroundColor(Color("PrimaryColor"))
                                    .font(.system(size: 36))
                                    .bold()
                                    .offset(x:-5)
                                
                            }
                            .offset(x:-50, y:60)
                        }
                      
                    NavigationLink(
                        destination: SignInScreenView().navigationBarHidden(true),
                        label: {
                            
                            PrimaryButton(title: "Let's Start")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color.red)
                                //.padding(0.1)
                                .frame(maxWidth: 300)
                                //.background(Color.black)
                              .cornerRadius(50.0)
                              .shadow(color: Color.black.opacity(0.1), radius: 60, x: 0.0, y: 16)
                                .padding(.vertical)
                        })
                        .navigationBarHidden(true)
                        .padding(.vertical, 60)
                    }
                }
                
            
        }
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}

