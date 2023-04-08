//
//  ForgetViw.swift
//  login
//
//  Created by Apple Esprit on 15/3/2023.
//

import Foundation

import SwiftUI

struct ForgetView: View {// by default it's empty
    @StateObject var vm = ViewModel()
    
    var body: some View {
       
            // Show a login screen
            ZStack {
                //Spacer()
                   
              
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    Text("Forgot your password?")
                        .foregroundColor(.primary)
                        .font(.system(size: 30, design: .rounded))
                        Text("Enter your email address ")

                    
                    TextField("Email address", text: $vm.email)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                        .padding(.vertical)
                    HStack {
                        Spacer()
                    }
                    HStack {
                     
                        Spacer()
                        Button("Reset passwod",role: .cancel, action: vm.forgotpwd)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("PrimaryColor"))
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                            .padding(.vertical)
                        Spacer()
                    }
                    .alert(vm.message, isPresented: $vm.invalid) {
                        Button("Ok", action: vm.logPressed)
                    }
                   Spacer()
                }
               
                .frame(width: 300)
                .padding()
            }
            .transition(.offset(x: 0, y: 850))
        }
    }


struct ForgetView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetView()
    }
}
