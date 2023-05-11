//
//  ChangePassword.swift
//  login
//
//  Created by Siwar Nafti on 29/3/2023.
//

import SwiftUI

struct ChangePassword: View {
    @ObservedObject var vm = EditProfileVM()
    @State private var isPresentingConfirm: Bool = false
    
    
    var body: some View {
        
        // Show a login screen
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
//                Spacer()
                Text(LocalizedStringKey("ChangePassword"))
                    .foregroundColor(.primary)
                    .font(.system(size: 36, design: .rounded))
                Spacer()
                PasswordView(leftIcon : "lock", placeHolder:LocalizedStringKey("OldPassword"), password: $vm.oldPassword)
                    .onChange(of: vm.oldPassword) { value in
                        vm.validateoldPassword()
                    }
                
                if let oldpasswordError = vm.oldpasswordError{
                    Text(oldpasswordError)
                        .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                }
                PasswordView(leftIcon : "lock", placeHolder:LocalizedStringKey("NewPassword"), password: $vm.newPassword)
                    .onChange(of: vm.newPassword) { value in
                        vm.validatenewPassword()
                    }
                
                if let newpasswordError = vm.newpasswordError{
                    Text(newpasswordError)
                        .foregroundColor(.red).font(.system(size:12)).frame(maxWidth:.infinity, alignment:.leading)
                }
                PasswordView(leftIcon : "lock", placeHolder:LocalizedStringKey("ConfirmPassword"), password: $vm.ConfirmPassword)
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
                    Text(LocalizedStringKey("ChangePassword"))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300)
                        .background(Color("PrimaryColor"))
                        .cornerRadius(50)
                }
                .confirmationDialog(LocalizedStringKey("AreYouSure"),
                                    isPresented: $isPresentingConfirm) {
                    Button(LocalizedStringKey("SaveUpdates"), role: .destructive) {
                        vm.changePasswordHandler()
                        print("performed")
                        vm.isPresentingUpdated = true
                        
                    }
                    
                }.alert(vm.message, isPresented: $vm.invalid) { Button("Ok", action: {})}
                    
                        
                    }
                    
                    .frame(width: 350)
                    .padding(50)
                }
                
            }
        }
    


