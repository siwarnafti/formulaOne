//
//  EditProfil.swift
//  login
//
//  Created by Siwar Nafti on 28/3/2023.
//
import PhotosUI
import SwiftUI

struct EditProfil: View {
    
    @StateObject var editVM = EditProfileVM()
    @State var username: String = ""
    @State var email: String = ""
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    @State private var isPresentingConfirm: Bool = false
    @State private var isPresentingAlert: Bool = false
    @State var user=getuser()
//    let username = getuser()?.name
//    let email = getuser()?.email
    var body: some View {
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
                                              .scaleEffect(2)
                                              .imageScale(.large)
                                              .offset(x:70,y: 70)
                                              .opacity(0.8)
                               }
                               
                       }
                    }
                
                Spacer()
                    TextField(user?.name ?? "username", text: $username)
                    .padding()
                    
                    TextField(user?.email ?? "email", text: $email)
                    .padding()
                    NavigationLink(
                        destination: ChangePassword(),
                        label: {
                            Text("Change Password ?")
                                .foregroundColor(.red)
                                .padding()
                                })
                        .padding(.vertical, 60)
                Spacer()
                Button(action: {
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
                      if(!(username.isEmpty)){
                          user!.name=username
                      }
                      if(!(email.isEmpty)){
                          user?.email=email
                      }
                      editVM.updateprofil(user:user! )
                   }
                 }
            }
            .padding()
            .navigationTitle("Edite Profile")
            .navigationViewStyle(StackNavigationViewStyle())
                    .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                        ImagePicker(image: $image)
                            .ignoresSafeArea()
                    }
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
