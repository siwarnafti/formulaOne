//
//  ForgetViw.swift
//  login
//
//  Created by Apple Esprit on 15/3/2023.
//

import Foundation

import SwiftUI

struct ForgetView: View {// by default it's empty
    @StateObject var vm = ForgotVM()
    
    var body: some View {
        if(vm.isSent){
            ZStack {
                //Spacer()
                
                
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    Text("New password")
                        .foregroundColor(.primary)
                        .font(.system(size: 30, design: .rounded))
                    
                    
                    
                    TextField("verification code", text: $vm.verificationcode)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                        .padding(.vertical)
                        .onChange(of: vm.verificationcode) { value in
                            vm.validateverificationcode()
                        }
                    if let verificationcodeError = vm.verificationcodeError{
                        Text(verificationcodeError)
                            .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                    }
                    PasswordView(leftIcon : "lock", placeHolder:"Password", password: $vm.password)
                        .onChange(of: vm.password) { value in
                            vm.validatePassword()
                        }
                    
                    if let passwordError = vm.passwordError{
                        Text(passwordError)
                            .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                    }
                    PasswordView(leftIcon : "lock", placeHolder:"Confirm Password", password: $vm.confirmPassword)
                        .onChange(of: vm.confirmPassword) { value in
                            vm.validateConfirmPassword()
                        }
                    
                    if let confirmPasswordError = vm.confirmPasswordError{
                        Text(confirmPasswordError)
                            .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                    }
                    
                
                    HStack {
                        
                        Spacer()
                        Button("Confirm New passwod",role: .cancel, action: vm.confirmForgotPwd)
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

                    
                   
                }
                .transition(.offset(x: 0, y: 850))
                .frame(width: 300)
                .padding()
            }
            
        }else{
            
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
            .alert(vm.message, isPresented: $vm.invalid) {
                Button("Ok", action: {})}
        }
    }
    }


struct ForgetView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetView()
    }
}
