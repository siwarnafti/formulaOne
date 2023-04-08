//
//  ChangePassword.swift
//  login
//
//  Created by Siwar Nafti on 29/3/2023.
//

import SwiftUI

struct ChangePassword: View {
    @State private var email: String = "" // by default it's empty
    @StateObject var vm = ViewModel()
    @State private var isPresentingConfirm: Bool = false
    @State private var isPresentingUpdated: Bool = false
    
    var body: some View {
        
        // Show a login screen
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                Spacer()
                Text("Change your password?")
                
                    .foregroundColor(.primary)
                    .font(.system(size: 36, design: .rounded))
                Spacer()
                SecureField("Old Password", text: $email)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(50.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                    .padding(.vertical)
                SecureField("New Password", text: $email)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(50.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                    .padding(.vertical)
                SecureField("Confirm Password", text: $email)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(50.0)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                    .padding(.vertical)
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
                        vm.Changepassword()
                        print("performed")
                        isPresentingUpdated = true
                    }
                }.alert("Password has changed  ✅", isPresented: $isPresentingUpdated) { Button("Ok", action: {})}
                    
                        Spacer()
                    }
                    
                    //.frame(width: 300)
                    .padding(50)
                }
                
            }
        }
    


struct ChangePassword_Previews: PreviewProvider {
    static var previews: some View {
        ChangePassword()
    }
}
