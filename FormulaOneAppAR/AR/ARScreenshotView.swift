//
//  ARScreenshotView.swift
//  FormulaOneAppAR
//
//  Created by MacOS on 4/5/2023.
//

import SwiftUI

struct ARScreenshotView: View {
    @State private var image: UIImage? = nil
    var body: some View {
       
           
            
           
                VStack {
                    Text("AR Screen Shot")
                        .font(.title)
                        .padding()
                    
                    FormulaARView()
                        .background(Color.white)
                        .onTapGesture {
                            takeScreenshot()
                        }
                    
                    if image != nil {
                        Image(uiImage: image!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                }
            }
            
            func takeScreenshot() {
                guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
                    return
                }
                
                let renderer = UIGraphicsImageRenderer(bounds: window.bounds)
                let image = renderer.image { ctx in
                    window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
                }
                
                self.image = image
            }
}

struct ARScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ARScreenshotView()
    }
}
