//
//  File.swift
//  login
//
//  Created by Apple Esprit on 14/3/2023.
//

import SwiftUI

struct SignInScreenView: View {
    
    @StateObject var vm = ViewModel()
    
//    @StateObject var user : User
    @State  var usernameError: String = ""
    @State  var passwordError: String = ""
    
    
    var body: some View {
        
        NavigationView {
            if(vm.authenticated){
                mainScreen()
            }else{
                // Show a login screen
                ZStack {
                    Color.gray
                        .ignoresSafeArea()
                    
                    
                    VStack(alignment: .center, spacing: 10) {
                        Image("signin")
                            .resizable()
                            .frame(width: 500, height: 300 , alignment: .center)
                        //.padding(.horizontal, 20)
                        //.shadow(color: Color.red, radius: 5)
                            .offset(y:100)
                        
                        Text("Sign in")
                            .foregroundColor(.black)
                            .font(.system(size: 40, weight: .medium, design: .rounded))
                        
                        
                        
                        TextField("Email", text: $vm.user.email)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0.0, y: 16)
                            .padding(.vertical)
                        
                        Text(usernameError)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.red)
                            .padding(.horizontal, 20)
                            .padding(.top, 0)
                            .font(Font.system(size: 13))
                        
                        SecureField("Password", text: $vm.password)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                            
                        
                        
                        
                        HStack {
                            Spacer()
//                            Toggle("remember Me", isOn: $vm.authenticated)
//                                        .padding()
                            NavigationLink(
                                destination: ForgetView().navigationBarHidden(false),
                                label: {
                                    PrimaryButton2(title: "Forgot password")
                                        .tint(Color("PrimaryColor"))
                                    
                                })
                            .navigationBarHidden(true)
                        }
                        
                        /*  HStack {
                         Spacer()
                         NavigationLink(
                         destination: ForgetView().navigationBarHidden(true),
                         label: {
                         
                         Button("Forgot password?", action: vm.logPressed)
                         .tint(.red.opacity(0.80))
                         })
                         .navigationBarHidden(true)
                         
                         }*/
                        
                        HStack {
                            Spacer()
                            
                            Spacer()
                            //Button(action: vm.login, label: "Sign In")
                            if(vm.invalid){
                            }
                            else
                            {
                                Button("Login") {
                                
                                vm.authenticate()
                            }.font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color("PrimaryColor"))
                                    .cornerRadius(50.0)
                                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .padding(.vertical)}
                            
                            Spacer()
                            
                        }.alert("Your username or password is incorrect", isPresented: $vm.invalid) {
                            Button("Ok", action: vm.logPressed)
                        }
                        HStack {
                            Spacer()
                            
                            Spacer()
                            Text("Don't have an account")
                            NavigationLink(
                                destination: RegisterView().navigationBarHidden(true),
                                label: {
                                    
                                    PrimaryButton2(title: "Sign Up ")
                                        .tint(Color("PrimaryColor"))
                                    
                                    
                                })
                            .navigationBarHidden(true)
                            Spacer()
                            
                            //Spacer()
                            
                        }
                        
                        
                        
                        Spacer()
                    }
                    
                    .frame(width: 300)
                    .padding()
                }
                .transition(.offset(x: 0, y: 850))
                .alert(vm.message, isPresented: $vm.invalid) {
                    Button("Ok", action: vm.logPressed)}
                
            }
        }
        
    }
    
    
}




struct SignInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreenView()
    }
}

