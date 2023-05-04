//
//  File.swift
//  login
//
//  Created by Apple Esprit on 14/3/2023.
//

import SwiftUI

struct SignInScreenView: View {
    @StateObject var loginVM = LogiVM()
    @StateObject private var authentication = Authentication()
    
    @State var legedinVM=UserDefaults.standard.bool(forKey: "RememberMe")
    
    var body: some View {
        
        NavigationView {
            if(UserDefaults.standard.bool(forKey: "RememberMe")||loginVM.loginbut){
                mainScreen()
            }else{
                // Show a login screen
                ZStack {
//                    Color.gray
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: .top, endPoint: .bottom)
         
                        .edgesIgnoringSafeArea(.all)
//                        .ignoresSafeArea()
                    VStack(alignment: .center, spacing: 10) {
                        Image("signin")
                            .resizable()
                            .frame(width: 500, height: 300 , alignment: .center)
                            .offset(y:100)
                        Text("Sign in")
                            .foregroundColor(.black)
                            .font(.system(size: 40, weight: .medium, design: .rounded))
                        TextField("Email", text: $loginVM.credentials.email)
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10.0)
                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0.0, y: 16)
                            .padding(.vertical)
                            .keyboardType(.emailAddress)
                            .onChange(of: loginVM.email) { value in
                                loginVM.validateEmail()
                            }
                        
                        if let EmailError = loginVM.EmailError{
                            Text(EmailError)
                                .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                        }
                        PasswordView(leftIcon : "lock", placeHolder:"Password", password: $loginVM.credentials.password)
                            .onChange(of: loginVM.credentials.password) { value in
                                loginVM.validatePassword()
                            }.padding(.vertical)
//                            .onChange(of: loginVM.password) { value in
//                                loginVM.validatePassword()
//                            }
                        if let passwordError = loginVM.passwordError{
                            Text(passwordError)
                                .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                        }
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
                            if authentication.biometricType() != .none {
                                Button {
                                    authentication.requestBiometricUnlock { (result:Result<Credentials, Authentication.AuthenticationError>) in
                                        switch result {
                                        case .success(let credentials):
                                            print("iam successed to use biometrics")
                                            loginVM.credentials = credentials
                                            loginVM.authenticate()
                                        case .failure(let error):
                                            print("iam not successed to use biometrics")
                                            loginVM.error = error
                                        }
                                    }
                                } label: {
                                    Image(systemName: authentication.biometricType() == .face ? "faceid" : "touchid")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.red)
                                }
                            }
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
                    .autocapitalization(.none)
//                    .padding()
                    .disabled(loginVM.showProgressView)
                    .alert(item: $loginVM.error) { error in
                        if error == .credentialsNotSaved {
                            return Alert(title: Text("Credentials Not Saved"),
                                         message: Text(error.localizedDescription),
                                         primaryButton: .default(Text("OK"), action: {
                                            loginVM.storeCredentialsNext = true
                                         }),
                                         secondaryButton: .cancel())
                        } else {
                            return Alert(title: Text("Invalid Login"), message: Text(error.localizedDescription))
                        }
                    }

                    .frame(width: 300)
                    
                    
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
