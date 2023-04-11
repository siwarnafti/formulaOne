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
            ZStack{
                VStack {
                    ZStack{
                        Image("signup1")
                            .resizable()
                            .frame(width:600,height: 300)
                            .offset(y:-20)
                        VStack{
                            //Spacer()
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
                            .onChange(of: vm.user.name) { value in
                                vm.validateUsername()
                            }
                        
                        if let usernameError = vm.usernameError{
                            Text(usernameError)
                                .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                        }
                        TextField("Email",text: $vm.user.email)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                            .onChange(of: vm.user.email) { value in
                                vm.validateEmail()
                            }
                        
                        if let emailError = vm.emailError{
                            Text(emailError)
                                .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                        }
//                        SecureField("Password", text: $vm.user.password)
//                            .font(.title3)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.white)
//                            .cornerRadius(50.0)
//                            .shadow(color: Color.black.opacity(0.08), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
//                            .padding(.vertical)
//                            .onChange(of: vm.user.password) { value in
//                                vm.validatePassword()
//                            }
                        PasswordView(leftIcon : "lock", placeHolder:"Password", password: $vm.user.password)
                            .onChange(of: vm.user.password) { value in
                                vm.validatePassword()
                            }
                        if let passwordError = vm.passwordError{
                            Text(passwordError)
                                .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                        }
                       
//                        SecureField("Confirm Password", text: $vm.confirmPassword)
//                            .font(.title3)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.white)
//                            .cornerRadius(50.0)
//                            .shadow(color: Color.black.opacity(0.08), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
//                            .padding(.vertical)
//                            .onChange(of: vm.confirmPassword) { value in
//                                vm.validateConfirmPassword()
//                            }
                        PasswordView(leftIcon : "lock", placeHolder:"Confirm Password", password: $vm.confirmPassword)
                            .onChange(of: vm.confirmPassword) { value in
                                vm.validateConfirmPassword()
                            }
                        
                        if let passwordconfirmError = vm.confirmPasswordError{
                            Text(passwordconfirmError)
                                .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                        }
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
                        }
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
                    }.offset(y:-50)
                    .padding()
                    .offset(y:-50)
                }
                
            }
//                .transition(.offset(x: 0, y: 850))
            
            
            }
        }
    }
   struct RegisterView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterView()
        }
    }


