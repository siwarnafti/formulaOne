//
//  EditProfileVM.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 9/4/2023.
//

import Foundation
class EditProfileVM:ObservableObject{
    @Published var message:String=""
    @Published var oldPassword:String=""
    @Published var newPasswordd:String=""
    @Published var ConfirmPassword:String=""
    @Published var newpasswordError:String?=nil
    @Published var confirmpasswordError:String?=nil
    @Published var oldpasswordError:String?=nil
    @Published var invalid:Bool=false
    @Published var isPresentingUpdated: Bool = false
    init(){}
    func validateoldPassword() {
        if oldPassword.isEmpty {
            oldpasswordError = "Password is required"
        } else if oldPassword.count < 8 {
            oldpasswordError = "Password must be at least 8 characters"
        } else {
            oldpasswordError = nil
        }
    }
    func validatenewPassword() {
        if newPasswordd.isEmpty {
            newpasswordError = "Password is required"
        } else if newPasswordd.count < 8 {
            newpasswordError = "Password must be at least 8 characters"
        } else {
            newpasswordError = nil
        }
    }

func validateConfirmPassword() {
    if self.ConfirmPassword.isEmpty {
        confirmpasswordError = "Password is required"
    } else if ConfirmPassword != self.newPasswordd {
        confirmpasswordError = "Passwords must match"
    } else {
        confirmpasswordError = nil
    }
}
    
    
    func updateprofil(user:User) {
        if(user.email.isValidEmail){
            updateprofilApi(user:user){ result in
                //               switch result {
                //                case .success():
                self.message="check your email  ✅"
                self.invalid=true
                
                //                case .failure():
                ////                   print(error.localizedDescription)
                //                   self.message="failed plz try again"
                //               }
                //result.status
                print(result)
            }
        }else{
            self.message="Email not valid"
            self.invalid=true
        }
    }
    func Changepasswordhandler(){}
//    func Changepasswordhandler(user:User) {
//        if(user.email.isValidEmail){
//            updateprofilApi(user:user){ result in
//                //               switch result {
//                //                case .success():
//                self.message="check your email  ✅"
//                self.invalid=true
//                
//                //                case .failure():
//                ////                   print(error.localizedDescription)
//                //                   self.message="failed plz try again"
//                //               }
//                //result.status
//                print(result)
//            }
//        }else{
//            self.message="Email not valid"
//            self.invalid=true
//        }
//    }
    func updateprofilApi(user:User, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
           
           guard let url = URL(string: baseUrl+"user/EditProfil") else {
               completion(.failure(.URLisnotcorrect))
               return
           }
           
//           let body = EditResponse(email: email, username: username)
           
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = try? JSONEncoder().encode(user)
           
           URLSession.shared.dataTask(with: request) { (data, response, error) in
               
               print("edit teb3ath")
               
           }.resume()
           
       }
}
