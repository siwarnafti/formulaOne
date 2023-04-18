////
////  CustomARView.swift
////  FormulaOneAppAR
////
////  Created by Apple Esprit on 17/4/2023.

import ARKit
import RealityKit
import SwiftUI

//class CustomARVeiw: ARView {
////    typealias
//    required init(frame frameRect: CGRect){
//        super.init(frame: frameRect)
//    }
//    dynamic required init?(coder decoder : NSCoder){
//        fatalError("init(coder:) has not been implement")
//    }
////    convenience init(){
////        self.init(frame : UIScreen.main.bounds)
////    }
//    func configuration(){
//        let configuration = ARWorldTrackingConfiguration()
//        session.run(configuration)
//    }
//    func anchor(){
//        let coordinateAnchor = AnchorEntity(world: .zero)
//        Scene.addAnchor(coordinateAnchor)
//    }
//    func entity(){
//        //load an entity from a usdz file
//        let _ = try? Entity.load(named: "modelname")
//
//        let box = MeshResource.generateBox(size: 1)
//        let entity = ModelEntity(mesh: box)
//
//        let anchor = AnchorEntity()
//        anchor.addChild(entity)
//    }
//    func placeBlueBlock(){
//        let block = MeshResource.generateBox(size: 1)
//        let material = SimpleMaterial(color: .blue,isMetallic: false)
//        let entity = ModelEntity(mesh: block,materials:[material])
//
//        let anchor = AnchorEntity(plane: .horizontal)
//        scene.addAnchor(anchor)
//    }
//
//}

//struct ARView : UIViewRepresentable{
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//
//    }

//
//    func makeUIView(context: Context) -> some UIView {
//        let sceneView = ARSCNView()
////        sceneView.showsStatistics = true
//
//        let block = MeshResource.generateBox(size: 1)
//        let material = SimpleMaterial(color: .blue,isMetallic: false)
//        let entity = ModelEntity(mesh: block,materials:[material])

//        let anchor = AnchorEntity(plane: .horizontal)
////        sceneView.scene = SCNScene(name: )
//        let configuration = ARWorldTrackingConfiguration ( )
//        sceneView.session.run(configuration)
//        return sceneView

        //        func updateUIView(_ uiview: UIViewType, context: Context) { }
        //        }
//    }
//}
