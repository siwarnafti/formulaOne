//
//  ChangePassword.swift
//  login
//
//  Created by Siwar Nafti on 29/3/2023.
//

import SwiftUI

struct ChangePassword: View {
    @StateObject var vm = EditProfileVM()
    @State private var isPresentingConfirm: Bool = false
    
    
    var body: some View {
        
        // Show a login screen
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
//                Spacer()
                Text("Change your password?")
                    .foregroundColor(.primary)
                    .font(.system(size: 36, design: .rounded))
                Spacer()
                PasswordView(leftIcon : "lock", placeHolder:"Old Password", password: $vm.oldPassword)
                    .onChange(of: vm.oldPassword) { value in
                        vm.validateoldPassword()
                    }
                
                if let oldpasswordError = vm.oldpasswordError{
                    Text(oldpasswordError)
                        .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                }
                PasswordView(leftIcon : "lock", placeHolder:"New Password", password: $vm.newPasswordd)
                    .onChange(of: vm.newPasswordd) { value in
                        vm.validatenewPassword()
                    }
                
                if let newpasswordError = vm.newpasswordError{
                    Text(newpasswordError)
                        .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                }
                PasswordView(leftIcon : "lock", placeHolder:"ConfirmPassword", password: $vm.ConfirmPassword)
                    .onChange(of: vm.ConfirmPassword) { value in
                        vm.validateConfirmPassword()
                    }
                
                if let confirmpasswordError = vm.confirmpasswordError{
                    Text(confirmpasswordError)
                        .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                }
                Spacer()
                Button(action: {
                    // Action à effectuer lorsque l'utilisateur appuie sur le bouton "Save"
                    isPresentingConfirm = true
                }) {
                    Text("Change Password")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(50)
                }
                .confirmationDialog("Are you sure?",
                                    isPresented: $isPresentingConfirm) {
                    Button("Save Updates ?", role: .destructive) {
                        vm.Changepasswordhandler()
                        print("performed")
                        vm.isPresentingUpdated = true
                        
                    }
                    
                }.alert("Password has changed  ✅", isPresented: $vm.isPresentingUpdated) { Button("Ok", action: {})}
                    
                        
                    }
                    
                    //.frame(width: 300)
                    .padding(50)
                }
                
            }
        }
    


