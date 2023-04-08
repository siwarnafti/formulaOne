//
//  Register.swift
//  login
//
//  Created by Apple Esprit on 16/3/2023.
//



import SwiftUI

struct RegisterView: View {
    @StateObject var vm = ViewModel()
  
    var body: some View {
        
        NavigationView {
            
            
            ZStack{
                
                VStack {
                    ZStack{
                        Image("signup1")
                            .resizable()
                            .frame(width:600,height: 300)
                            .offset(y:-20)
                        VStack{
                            Spacer()
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .font(.system(size: 50, weight: .medium, design: .rounded))
                                .offset(y:-20)
                        }
                    }
                    VStack(alignment: .center) {
                        TextField("Username", text: $vm.user.name)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        TextField("emailError",text: $vm.user.email)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        SecureField("Password", text: $vm.password)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        SecureField("Confirm Password", text: $vm.confirmPassword)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        
                        HStack {
                            
                            Spacer()
                            
                            Button("Sign Up",role: .cancel, action: vm.signup)
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
                        } //.alert("Sign Up Successfully! ✅", isPresented: $vm.invalid) {
                            //Button("Ok", action: vm.logPressed)
                    
//                        }
                        
                        .alert(vm.message, isPresented: $vm.invalid) {
                            Button("Ok", action: vm.logPressed)
                        }
                        
                        HStack {
                            Spacer()
                            
                            Spacer()
                            Text("Already have an account?")
                            NavigationLink(
                                destination: SignInScreenView().navigationBarHidden(true),
                                label: {
                                    
                                    PrimaryButton2(title: "Sign in ")
                                        .tint(.red.opacity(0.80))
                                    
                                })
                            .navigationBarHidden(true)
                            Spacer()
                            Spacer()
                        }
                        Spacer()
                    }.offset(y:-50)
                    .padding()
                }
                
            }
                .transition(.offset(x: 0, y: 850))
            }
//           Text("kjkjkj")
        }
    }
            
    
  
        
           
    
   struct RegisterView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterView()
        }
    }

