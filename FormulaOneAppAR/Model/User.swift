//
//  User.swift
//  login
//
//  Created by Siwar Nafti on 29/3/2023.
//

import Foundation

//class User:ObservableObject,Codable{
//    @Published var id:Int=0
//    @Published var name: String=""
//    @Published var email: String=""
//    @Published var password: String=""
//    @Published var avatar: String=""
//    @Published var token: String=""
//
//init(){}
//    enum CodingKeys: CodingKey{
//        case id,name,email,password,avatar,token
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(email, forKey: .email)
//        try container.encode(password, forKey: .password)
//        try container.encode(avatar, forKey: .avatar)
//        try container.encode(token, forKey: .token)
//    }
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        id = try container.decode(Int.self, forKey: .id)
//        name = try container.decode(String.self, forKey: .name)
//        email = try container.decode(String.self, forKey: .email)
//        password = try container.decode(String.self, forKey: .password)
//        avatar = try container.decode(String.self, forKey: .avatar)
//        token = try container.decode(String.self, forKey: .token)
//    }
//    func isvalid(){
//
//    }
//
//}
struct User: Codable{
     var id:String=""
    var name: String=""
    var email: String=""
    //var password: String=""
    var avatar: String=""
    var token: String=""
    mutating func setname(_ name:String){
        self.name=name
    }
    mutating func setemail(email:String){
        self.email=email
    }
}
struct LogedInUser: Codable{
     var id:String=""
    var name: String=""
    var email: String=""
//    var password: String=""
    var avatar: String=""
    var token: String=""
    mutating func setname(_ name:String){
        self.name=name
    }
    mutating func setemail(email:String){
        self.email=email
    }
}
struct SignInUser: Codable{
    
    var name: String=""
    var email: String=""
    var password: String=""
//    var confirm: String=""
    
    
}
struct UserChangePassword:Codable{
    
}
struct UserForgotPassword:Codable{
    var codeForget:String
    var email:String
    var password:String
}
