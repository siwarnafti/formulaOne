//
//  RegisterView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 10/4/2023.
//



import SwiftUI

struct RegisterView: View {
    @StateObject var vm = ResgiterVM()
    var body: some View {
        NavigationView {
        ZStack {
            Color.gray
        Image("signup1")
            .resizable()
            .ignoresSafeArea()
            .offset()
            .backgroundStyle(Color.black)
        ZStack {
            VStack {
                Text(LocalizedStringKey("SignUp"))
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .medium, design: .rounded))
                Spacer()
                }
            }
        
        VStack (alignment: .center) {
            Spacer()
            VStack(alignment: .center) {
                TextField(LocalizedStringKey("UserName"), text: $vm.user.name)
                    .font(.title3)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0.0, y: 16)
//                    .padding(.vertical)
                    .opacity(0.7)
                    .onChange(of: vm.user.name) { value in
                        vm.validateUsername()
                    }
                if let usernameError = vm.usernameError {
                    Text(usernameError)
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                TextField("Email", text: $vm.user.email)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0.0, y: 16)
//                    .padding(.vertical)
                    .onChange(of: vm.user.email) { value in
                        vm.validateEmail()
                    }
                    .opacity(0.7)
                
                if let emailError = vm.emailError {
                    Text(emailError)
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                PasswordView(leftIcon: "lock", placeHolder: LocalizedStringKey("Password"), password: $vm.user.password)
                    .onChange(of: vm.user.password) { value in
                        vm.validatePassword()
                    }
                    .opacity(0.7)
                if let passwordError = vm.passwordError {
                    Text(passwordError)
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                PasswordView(leftIcon: "lock", placeHolder: LocalizedStringKey("ConfirmPassword"), password: $vm.confirmPassword)
                    .onChange(of: vm.confirmPassword) { value in
                        vm.validateConfirmPassword()
                    }
                    .opacity(0.7)
                if let passwordconfirmError = vm.confirmPasswordError {
                    Text(passwordconfirmError)
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    Spacer()
                    
                    Button(LocalizedStringKey("SignUp"), role: .cancel, action: vm.signup)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
//                        .frame(maxWidth: .infinity)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(10.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                        .padding(.vertical)
                        .opacity(0.7)
                    Spacer()
                }
                .alert(vm.message, isPresented: $vm.invalid) {
                    Button("Ok", action: vm.logPressed)
                }
                
                HStack {
                    Spacer()
                    
                    Text(LocalizedStringKey("AlreadyHaveanAccount"))
                    
                    NavigationLink(
                        destination:
                            SignInScreenView().navigationBarHidden(true),
                                label: {
                                    
                                    PrimaryButton2(title: LocalizedStringKey("SignUp"))
                                        .tint(.red.opacity(0.80))
                                    
                                })
                            .navigationBarHidden(true)
                            Spacer()
                            
                        }
                    }
                    .padding()
                    
                }
                
            }            }
        }
   }
   struct RegisterView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterView()
        }
    }
