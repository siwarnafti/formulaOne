//
//  Profilev2.swift
//  login
//
//  Created by Siwar Nafti on 7/4/2023.
//



import SwiftUI
func getuser()->User?{
       let defaults = UserDefaults.standard
       if let savedUser = defaults.object(forKey: "user") as? Data {
           let decoder = JSONDecoder()
           if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
               // use loadedUser
               return loadedUser
           }
       }
       return nil

   }
struct ProfileView: View {
    @StateObject var vm = ViewModel()
    @StateObject var profileVM=ProfileVM()
    let user=getuser()
    var body: some View {
        NavigationView(){
            VStack( spacing: 0) {
                
                // User profile picture
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
                
                // User's name and bio
                Text(user?.name ?? "username")
                .font(.title)
//                VStack(){
                    Spacer()
                Text(user?.email ?? "email")
                        .foregroundColor(.gray)
                Spacer()
                    NavigationLink(
                        destination: EditProfil(),
                        label: {
                            Text("Edit Profil")
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color("PrimaryColor"))
                                .cornerRadius(15)
                                .frame( height: 70)
                            
                        })
                    
//                }
                Spacer()
                
                // User's stats
                HStack {
                    VStack {
                        Text("1,234")
                            .font(.headline)
                        
                        Text("Posts")
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("4,567")
                            .font(.headline)
                        
                        Text("Followers")
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("890")
                            .font(.headline)
                        
                        Text("Following")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                
                // User's posts
                ScrollView {
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3), spacing: 2) {
                        ForEach(0..<9) { _ in
                            Image("post_image")
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width / 3 - 2, height: UIScreen.main.bounds.width / 3 - 2)
                                .clipped()
                        }
                    }
                }
            }
            .toolbar{
                Button {
                    profileVM.signout()
                    AppEventsManager.shared.navigateFullScreen.send((true, FullScreenNavigationViewType.WelcomeView))
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .imageScale(.large)
                }
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

