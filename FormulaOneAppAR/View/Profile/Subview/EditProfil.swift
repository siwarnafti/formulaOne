//
//  EditProfil.swift
//  login
//
//  Created by Siwar Nafti on 28/3/2023.
//
import PhotosUI
import SwiftUI

struct EditProfil: View {
   // var body: some View {
       // struct EditProfileView: View {
    let email=UserDefaults.standard.string(forKey: "email")
    let username=UserDefaults.standard.string(forKey: "username")
    @StateObject var vm = ViewModel()
          @State var UserName: String = ""
          @State var Email: String = ""

            @State private var avatarItem: PhotosPickerItem?
            @State private var avatarImage: Image?
            @State var shouldShowImagePicker = false
            @State var image: UIImage?
            @State private var isPresentingConfirm: Bool = false
            @State private var isPresentingAlert: Bool = false
   
            
    var body: some View {
       // NavigationView{
                VStack {
                    ZStack() {
                           Button {
                               shouldShowImagePicker.toggle()
                           } label: {
                               ZStack{
                                   VStack {
                                       if let image = self.image {
                                           Image(uiImage: image)
                                               .resizable()
                                               .scaledToFill()
                                               .frame(width: 200, height: 200)
                                               .clipShape(Circle())
                                       } else {
                                           Image(systemName: "person.fill")
                                               .font(.system(size: 150))
                                               .padding()
                                               .foregroundColor(Color(.label))
                                       }
                                   }
                                   
                               .overlay(Circle()
                                           .stroke(Color.black, lineWidth: 3)
                               )
                                   
                                       
                                       Image(systemName:"camera.circle.fill")
                                              .foregroundColor(.black)
                                              //.background(Material.ultraThinMaterial)
                                              .scaleEffect(2)
                                              .imageScale(.large)
                                              .offset(x:70,y: 70)
                                              .opacity(0.8)
                               }
                               
                       }
                    }
                
                Spacer()
                TextField(username!, text: $UserName)
                    .padding()
                    
                TextField(email!, text: $Email)
                    .padding()
                
               // TextField("Phone", text: $phone)
//                    .padding()
                    
                    NavigationLink(
                        destination: ChangePassword(),
                        label: {
                            Text("Change Password ?")
                                .foregroundColor(.red)
                                .padding()
                                })
                        //.navigationBarHidden(true)
                        .padding(.vertical, 60)
                Spacer()
                Button(action: {
                    // Action à effectuer lorsque l'utilisateur appuie sur le bouton "Save"
                    
                    isPresentingConfirm = true
                }) {
                    Text("Save")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150.0)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .confirmationDialog("Are you sure?",
                  isPresented: $isPresentingConfirm) {
                  Button("Save Updates ?", role: .destructive) {
                      if(UserName.isEmpty){
                          UserName=username!
                      }
                      if(Email.isEmpty){
                          Email=email!
                      }
                      vm.updateprofil(email:Email ,username:UserName )
                   }
                 }
            }
            .padding()
            .navigationViewStyle(StackNavigationViewStyle())
                    .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                        ImagePicker(image: $image)
                            .ignoresSafeArea()
                    }
            
        }
    //}
            
            func saveProfile() {
                // Code pour enregistrer les modifications du profil
                
            }
        }

struct EditProfil_Previews: PreviewProvider {
   static var previews: some View {
       EditProfil()
    }
}
struct ImagePicker: UIViewControllerRepresentable {
 
    @Binding var image: UIImage?
 
    private let controller = UIImagePickerController()
 
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
 
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
        let parent: ImagePicker
 
        init(parent: ImagePicker) {
            self.parent = parent
        }
 
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }
 
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
 
    }
 
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.delegate = context.coordinator
        return controller
    }
 
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
 
    }
 
}
