//
//  ImportfARFile.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 26/4/2023.
//

import SwiftUI
import ARKit
import _SceneKit_SwiftUI

struct Viewer3D: View {

@State var urlLocalModel: URL?
@State var openFile = false

var body: some View {
    VStack{
        VStack {
            Button {
                openFile.toggle()
            } label: {
                Text("Open File Local USDZ")
            }
        }
        .fileImporter(isPresented: $openFile, allowedContentTypes: [.usdz]) {  result in
            switch result {
            case .success(let url):
                _ = url.startAccessingSecurityScopedResource()
                self.urlLocalModel = url
                print(url)
            case.failure(let error):
                print(error)
            }
        }
        if (urlLocalModel != nil) {
            let scene = try? SCNScene(url: urlLocalModel!)
            SceneView(scene: scene, options: [.autoenablesDefaultLighting,.allowsCameraControl])
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        }
    }
}}
struct ImportfARFile_Previews: PreviewProvider {
    static var previews: some View {
        Viewer3D()
    }
}
