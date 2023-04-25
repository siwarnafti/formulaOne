import SwiftUI

struct ContentView2: View {
        @State private var image: UIImage?
        @State private var showImagePicker: Bool = false
        private var services = APIServices()
        var body: some View {
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    Text("No Image Selected")
                }

                Button(action: {
                    self.showImagePicker = true
                }) {
                    Text("Select Image")
                }
                Button(action: {
                    services.uploadAvatar(email: "siwar.nafti@esprit.tn", image: image)
                }) {
                    Text("upload Image")
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(sourceType: .photoLibrary) { image in
                    self.image = image
                }
                
            }
            
        
    }

    struct ImagePicker: UIViewControllerRepresentable {
        var sourceType: UIImagePickerController.SourceType = .photoLibrary
        var completionHandler: (UIImage?) -> Void

        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
            let picker = UIImagePickerController()
            picker.delegate = context.coordinator
            picker.sourceType = sourceType
            return picker
        }

        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}

        func makeCoordinator() -> ImagePickerCoordinator {
            return ImagePickerCoordinator(completionHandler: completionHandler)
        }
    }

    class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var completionHandler: (UIImage?) -> Void

        init(completionHandler: @escaping (UIImage?) -> Void) {
            self.completionHandler = completionHandler
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true)

            if let image = info[.originalImage] as? UIImage {
                completionHandler(image)
            } else {
                completionHandler(nil)
            }
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
            completionHandler(nil)
        }
    }

}

struct ContentView_Previews1: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
