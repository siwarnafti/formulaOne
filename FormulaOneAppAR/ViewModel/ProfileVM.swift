//
//  ProfileVM.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 9/4/2023.
//

import Foundation
class ProfileVM:ObservableObject{
    @Published var pro:String?
    @Published var user = LogedInUser()
    init(){
        user=getuser()!
    }
    func signout() {
        
        self.removeuser()
        //user=User()
        
//        DispatchQueue.main.async {
//            self.authenticated = false
//        }
        UserDefaults.standard.set(false, forKey: "RememberMe")
        
    }
    func removeuser(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "user")
    }
}
