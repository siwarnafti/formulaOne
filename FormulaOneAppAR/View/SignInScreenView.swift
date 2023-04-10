//
//  File.swift
//  login
//
//  Created by Apple Esprit on 14/3/2023.
//

import SwiftUI

struct SignInScreenView: View {
    @StateObject var loginVM = LogiVM()
    @State var legedinVM=UserDefaults.standard.bool(forKey: "RememberMe")
    
    var body: some View {
        
        NavigationView {
            
            if(UserDefaults.standard.bool(forKey: "RememberMe")||loginVM.loginbut){
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
                            .offset(y:100)
                        Text("Sign in")
                            .foregroundColor(.black)
                            .font(.system(size: 40, weight: .medium, design: .rounded))
                        TextField("Email", text: $loginVM.email)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0.0, y: 16)
                            .padding(.vertical)
                        
                        Text(loginVM.EmailError)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.red)
                            .padding(.horizontal, 20)
                            .padding(.top, 0)
                            .font(Font.system(size: 13))
                        
                        SecureField("Password", text: $loginVM.password)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                            .padding(.vertical)
                        HStack {
                            Spacer()
                            CheckBox(isChecked:$loginVM.rememberMe)
                            Text("Remember me").foregroundColor(.black )
                            NavigationLink(
                                destination: ForgetView().navigationBarHidden(false),
                                label: {
                                    PrimaryButton2(title: "Forgot password")
                                        .tint(Color("PrimaryColor"))
                                    
                                })
                            .navigationBarHidden(true)
                        }
                        HStack {
                            Spacer()
                            
                            Spacer()
                            Button("Login") {
                                loginVM.authenticate()
                            }.font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color("PrimaryColor"))
                                    .cornerRadius(50.0)
                                    .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .padding(.vertical)
                            
                            Spacer()
                            
                        }.alert("Your username or password is incorrect", isPresented: $loginVM.invalid) {
                            Button("Ok", action: {})
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
                        }
                        Spacer()
                    }
                    .frame(width: 300)
                    .padding()
                }
                .transition(.offset(x: 0, y: 850))
                .alert(loginVM.message, isPresented: $loginVM.invalid) {
                    Button("Ok", action: {})}
            }
        }
    }
}

struct SignInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreenView()
    }
}

