//
//  downloadimage.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 25/4/2023.
//

import SwiftUI

struct downloadimage: View {
    @State private var image: UIImage?
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            
            Button("Upload Avatar") {
                uploadAvatar(email: "john.doe@example.com", image: image)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()
            
            Button("Download Avatar") {
                downloadAvatar(email: "siwar.nafti@esprit.tn")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()
            
            Spacer()
        }
        .sheet(isPresented: Binding(get: { image != nil }, set: { _ in image = nil })) {
            ImagePicker(image: $image)
        }
    }
    
    func uploadAvatar(email: String, image: UIImage?) {
        // ...
        // Same code as before
        // ...
    }
    
    func downloadAvatar(email: String) {
        let url = URL(string: "localhost:5002/uploads/users/image.jpg")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("Error: Invalid image data")
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}


struct downloadimage_Previews: PreviewProvider {
    static var previews: some View {
        downloadimage()
    }
}
