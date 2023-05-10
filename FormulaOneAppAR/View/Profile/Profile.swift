//
//  Profilev2.swift
//  login
//
//  Created by Siwar Nafti on 7/4/2023.
//



import SwiftUI
func getuser()->LogedInUser{
       let defaults = UserDefaults.standard
       if let savedUser = defaults.object(forKey: "user") as? Data {
           let decoder = JSONDecoder()
           if let loadedUser = try? decoder.decode(LogedInUser.self, from: savedUser) {
               // use loadedUser
               return loadedUser
           }
       }
       return LogedInUser()

   }
struct ProfileView: View {
    @StateObject var vm = ViewModel()
    @StateObject var profileVM = ProfileVM()
    @StateObject var editProfileVM = EditProfileVM()
//    @Environment(\.colorScheme) var colorScheme
    //    let user=getuser()
    var body: some View {
        NavigationView{
            ZStack{
//                LinearGradient(gradient: Gradient(colors: [Color("backgroundcolor"), Color("backgroundcolor")]), startPoint: .top, endPoint: .bottom)
                Color("backgroundcolor")
                                    .edgesIgnoringSafeArea(.all)
                
                VStack( spacing: 0) {
                    
                    // User profile picture
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                        .padding()
                        .overlay(Circle()
                                    .stroke(Color.red, lineWidth: 3)
                        )
                    
                    // User's name and bio
                    Text(profileVM.user.name )
                        .font(.title)
                    //                VStack(){
                    Spacer()
                    Text(profileVM.user.email )
                        .foregroundColor(.gray)
                    Spacer()
                    HStack{
                        NavigationLink(
                            destination: EditProfil(editVM: editProfileVM, prfileVM: profileVM),
                            label: {
                                Text("Edit Profil")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(Color(.red))
                                    .cornerRadius(15)
                                    .frame( height: 70)
                                
                            })
                        Button(action: {
                            // Handle action
                        }) {
                            Image(systemName: "gearshape")
                                .font(.headline)
                                .foregroundColor(Color("PrimaryColor"))
                                .padding(.horizontal, 5)
                                .padding(.vertical, 10)
                                .scaleEffect(1.5)
                        }
                      
                    }
                    
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
                            ForEach(0..<24) { _ in
                                Image("signup")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width / 3 - 2, height: UIScreen.main.bounds.width / 3 - 2)
                                    .clipped()
                            }
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
                        .foregroundColor(.red)
                    
                    
                }
            }
        }
        
    }
    
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
    
}
