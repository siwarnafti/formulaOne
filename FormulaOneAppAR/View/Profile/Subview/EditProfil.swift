//
//  EditProfil.swift
//  login
//
//  Created by Siwar Nafti on 28/3/2023.
//
import PhotosUI
import SwiftUI

struct EditProfil: View {
    
    @ObservedObject var editVM : EditProfileVM
    @ObservedObject var prfileVM : ProfileVM
    @State var username: String = ""
    @State var email: String = ""
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    @State private var isPresentingConfirm: Bool = false
    @State private var isPresentingAlert: Bool = false
    func uploadImage() {
        guard let image = self.image else {
               return
           }

           let boundary = UUID().uuidString

           let config = URLSessionConfiguration.default
           let session = URLSession(configuration: config)

           guard let url = URL(string: "http://example.com/upload") else {
               return
           }

           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

           let httpBody = NSMutableData()

           httpBody.append("--\(boundary)\r\n".data(using: .utf8)!)
           httpBody.append("Content-Disposition: form-data; name=\"file\"; filename=\"image.png\"\r\n".data(using: .utf8)!)
           httpBody.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
           httpBody.append(image.pngData()!)
           httpBody.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

           request.httpBody = httpBody as Data

           let task = session.dataTask(with: request) { (data, response, error) in
               if let error = error {
                   print("Error: \(error.localizedDescription)")
                   return
               }

               guard let data = data else {
                   print("Error: No data received")
                   return
               }

               // Process server response
               print("Server response: \(String(data: data, encoding: .utf8) ?? "")")
           }

           task.resume()
       }
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
                    TextField(prfileVM.user.name, text: $username)
                    .padding()
                    
                    TextField(prfileVM.user.email, text: $email)
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
                          prfileVM.user.name=username
                      }
                      if(!(email.isEmpty)){
                          prfileVM.user.email=email
                      }
                      editVM.updateprofil(user:prfileVM.user )
                      
                   }
                 }
            }
            
            .padding()
        
            .alert(isPresented: $editVM.profilehaschanged) {
                            Alert(
                                title: Text("done"),
                                message: Text(editVM.message),
                                primaryButton: .default(Text("OK")) {
                                    // Dismiss the current view and return to the previous view
                                    presentationMode.wrappedValue.dismiss()
                                },
                                secondaryButton: .cancel()
                            )
                        }
                    
            .navigationTitle("Edite Profile")
//            .navigationViewStyle(StackNavigationViewStyle())
                    .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                        ImagePicker(image: $image)
                            .ignoresSafeArea()
                    }
            }
    @Environment(\.presentationMode) var presentationMode
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
