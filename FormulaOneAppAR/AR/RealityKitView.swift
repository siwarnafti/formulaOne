//
//  RealityKitView.swift
//  FormulaOneAppAR
//
//  Created by Apple Esprit on 19/4/2023.
//


import ARKit
import RealityKit
import SwiftUI
import FocusEntity

struct RealityKitView: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let view = ARView()

        // Start AR session
            let session = view.session
            let config = ARWorldTrackingConfiguration()
            config.planeDetection = [.horizontal]
            session.run(config)

                    // Add coaching overlay
            let coachingOverlay = ARCoachingOverlayView()
            coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            coachingOverlay.session = session
            coachingOverlay.goal = .horizontalPlane
            view.addSubview(coachingOverlay)
        

                    // Set debug options
           /* #if DEBUG
            view.debugOptions = [.showFeaturePoints, .showAnchorOrigins, .showAnchorGeometry]
            #endif*/

        // Handle ARSession events via delegate
        context.coordinator.view = view
        session.delegate = context.coordinator
        
        // Handle taps
        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: context.coordinator,
                action: #selector(Coordinator.handleTap)
            )
        )
        return view
    }
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    func updateUIView(_ view: ARView, context: Context) {
        print("")
    }
    class Coordinator: NSObject, ARSessionDelegate {
        weak var view: ARView?
        var focusEntity: FocusEntity?

        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            guard let view = self.view else { return }
            debugPrint("Anchors added to the scene: ", anchors)
            self.focusEntity = FocusEntity(on: view, style: .classic(color: .yellow))
        }
        @objc func handleTap() {
            guard let view = self.view, let focusEntity = self.focusEntity else { return }

            // Create a new anchor to add content to
            let anchor = AnchorEntity()
            view.scene.anchors.append(anchor)

            // Add a Box entity with a blue material
            // Add a dice entity
            /*let diceEntity = try! ModelEntity.loadModel(named: "Dice")
            //diceEntity.scale = [0.1, 0.1, 0.1]
            diceEntity.position = focusEntity.position*/
            
            let box = MeshResource.generateBox(size: 0.5, cornerRadius: 0.05)
                let material = SimpleMaterial(color: .blue, isMetallic: true)
                let diceEntity = ModelEntity(mesh: box, materials: [material])
                diceEntity.position = focusEntity.position

            anchor.addChild(diceEntity)
        }
    }
    

}
